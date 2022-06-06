
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:camera_app/user_information.dart';
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

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<String> uploadImage(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "upload": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    Response response =
    await dio.post("https://67da-2402-800-629c-e2c8-113-2edf-d1c2-123c.ap.ngrok.io/load_image", data: data);
    return response.toString();
  }

  // Future<UserModel?> callAPI(File file) async {
  //   print(file.path.split("/").last.length);
  //   String baseUrl =
  //       "http://192.168.1.2:5000/load_image";
  //   final url = Uri.parse(baseUrl);
  //
  //   var request = http.MultipartRequest('POST', url);
  //   request.files.add(
  //       http.MultipartFile(
  //           'upload',
  //           file.readAsBytes().asStream(),
  //           file.lengthSync(),
  //           filename: file.path.split("/").last,
  //       )
  //   );
  //   request.send().timeout(Duration(seconds: 60),onTimeout:(){
  //     throw "TimeOut";
  //   }).then((result) async {
  //     http.Response.fromStream(result)
  //         .then((response) {
  //       if (response.statusCode == 200)
  //       {
  //         print("Uploaded! ");
  //           print('response.body '+response.body);
  //       }
  //       return response.body;
  //     });
  //   }).catchError((err) => print('error : '+err.toString()))
  //       .whenComplete(()
  //   {});
  //
  //   // if (response.statusCode == 200) {
  //   //   final dataPeople = userModelFromJson(response.);
  //   //   return dataPeople;
  //   // } else {
  //   //   return null;
  //   // }
  // }

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
              builder:(BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider:  FileImage(widget.galleryItem[index]),
                  initialScale: PhotoViewComputedScale.contained * 1,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.galleryItem.toString()),
                );
              },
              itemCount: widget.galleryItem.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15,bottom: 5),
              child: ClipOval(
                child: Material(
                  child: Container(
                    height: 56,
                    width: 56,
                    padding: EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(Icons.send,size: 36,),
                      onPressed: () async {
                          print(widget.galleryItem[currentIndex]);
                          final data = await uploadImage(widget.galleryItem[currentIndex]);
                          showDialog(context: context, builder: (context){
                            return Dialog(
                              child: Text(data.toString()),
                            );
                          });
                      },
                      color: Colors.blueAccent,
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}