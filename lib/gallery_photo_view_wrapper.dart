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
    required this.host,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<File> galleryItem;
  final Axis scrollDirection;
  final String host;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<UserModel?> uploadImage(File file, BuildContext context) async {
    showLoading(context);
    String fileName = file.path.split('/').last;
    print(fileName);
    FormData data = FormData.fromMap({
      'upload': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    Dio dio = Dio();
    try {
      final response = await dio.post(
          '${widget.host}/load_image',
          data: data);
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        final dataPeople = userModelFromJson(response.toString());
        return dataPeople;
      }
    } catch (e) {
      Navigator.of(context).pop();
      return null;
    }
    Navigator.of(context).pop();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  child:IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 36,
                    ),
                    onPressed: () async {
                      final data = await uploadImage(
                          widget.galleryItem[currentIndex],context);
                      if (data != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInformation(
                              name: data.name.toString(),
                              diaChi: data.address.toString(),
                              ngaySinh:data.birthday.toString(),
                              nguoiNha: data.patient.toString(),
                              sdt: data.phone.toString(),
                              sex: data.sex.toString(),
                              status: data.status.toString(),
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
      ),
    );
  }
  static Future showLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () => Future.value(true),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
