import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'gallery_photo_view_wrapper.dart';
import 'models/user_model.dart';

class GalleryScreen extends StatelessWidget {
  final List<File> images;

  const GalleryScreen({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const kColorAppBar = Color(0xFF332f8e);
    const kColorAppBarStart = Color(0xFFd81d2e);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [
                          0.1,
                          0.4
                        ],
                        colors: const <Color>[
                          kColorAppBarStart,
                          kColorAppBar
                        ]))),
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/images/icon_heart.png',
                fit: BoxFit.contain,
                height: 35,
                width: 35,
              ),
            ),
            title: Center(
              widthFactor: 3,
              child: Text(
                'Thư viện ảnh',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: images
            .asMap()
            .entries
            .map(
              (image) =>
              GestureDetector(
                onTap: (){
                  open(context, image.key);
                },
                child: Hero(
                    tag: image.toString(),
                    child: Image.file(image.value, fit: BoxFit.cover),
                ),
              ),
        )
            .toList(),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            GalleryPhotoViewWrapper(
              galleryItem: images                                                                                                                                      ,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              initialIndex: index,
            ),
      ),
    );
  }
}
