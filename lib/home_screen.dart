import 'package:camera/camera.dart';
import 'package:camera_app/camera_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<CameraDescription> cameras;

  const HomeScreen({Key? key, required this.cameras}) : super(key: key);

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
              child: Text(
                'CỔNG THÔNG TIN TIÊM CHỦNG COVID-19',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(Icons.camera_alt, size: 60),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(cameras: cameras),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Chụp mẫu đơn đăng kí',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
