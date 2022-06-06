import 'dart:io';

import 'package:camera_app/user_information.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'models/user_model.dart';

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItem,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<File> galleryItem;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;
  bool isLoading = false;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<UserModel?> uploadImage(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      'upload': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = Dio();
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await dio.post(
          'https://67da-2402-800-629c-e2c8-113-2edf-d1c2-123c.ap.ngrok.io/load_image',
          data: data);
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        final dataPeople = userModelFromJson(response.data);
        return dataPeople;
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      return null;
    }
    setState(() {
      isLoading = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: FileImage(widget.galleryItem[index]),
                  initialScale: PhotoViewComputedScale.contained * 1,
                  heroAttributes: PhotoViewHeroAttributes(
                      tag: widget.galleryItem.toString()),
                );
              },
              itemCount: widget.galleryItem.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              width: 56,
              height: 56,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              margin: EdgeInsets.only(bottom: 5, right: 20),
              child: Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.blueAccent,
                        strokeWidth: 2,
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 36,
                        ),
                        onPressed: () async {
                          final data = await uploadImage(
                              widget.galleryItem[currentIndex]);
                          if (data != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserInformation(
                                  userModel: data,
                                ),
                              ),
                            );
                          }
                        },
                        color: Colors.blueAccent,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
