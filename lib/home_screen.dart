import 'package:camera/camera.dart';
import 'package:camera_app/camera_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const HomeScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController controller = TextEditingController();

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
            title: Center(
              child: Text(
                'Extract Information Medical Declaration Form',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Host',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Icon(Icons.camera_alt, size: 60),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(cameras: widget.cameras, host: controller.text.toString()),
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
