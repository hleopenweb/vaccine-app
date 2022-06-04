import 'package:camera_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  UserInformation({Key? key, required this.userModel}) : super(key: key);

  UserModel userModel;

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
                'Hồ sơ tiêm chủng',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 55.0,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=54'),
                backgroundColor: Colors.transparent,
              ),
              buildUserInfoDisplay(userModel.id ?? '', 'Mã số'),
              // buildUserInfoDisplay(controller.user.value.name ?? '', 'Họ và tên'),
              buildUserInfoDisplay(
                userModel.phone ?? '',
                'Số điện thoại',
              ),
              buildUserInfoDisplay(
                userModel.birthday ?? '',
                'Ngày sinh',
              ),
              buildUserInfoDisplay(
                userModel.address ?? '',
                'Địa chỉ',
              ),
              buildUserInfoDisplay(
                userModel.sex ?? '',
                'Giới tính',
              ),
            ],
          ),
        ),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    getValue,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ],
            ),
          )
        ],
      ));
}
