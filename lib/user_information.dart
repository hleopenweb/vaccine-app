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
                  stops: const [0.1, 0.4],
                  colors: const <Color>[kColorAppBarStart, kColorAppBar],
                ),
              ),
            ),
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
                'Hồ sơ khai báo y tế',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 55.0,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=54'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 20,
              ),
              buildUserInfoDisplay(userModel.id ?? 'Không có', 'Mã số'),
              buildUserInfoDisplay(userModel.name ?? 'Không có', 'Họ và tên'),
              buildUserInfoDisplay(
                  userModel.patient ?? 'Không có', 'Bệnh nhân tiếp xúc'),
              buildUserInfoDisplay(
                userModel.birthday ?? 'Không có',
                'Ngày sinh',
              ),
              buildUserInfoDisplay(
                userModel.phone ?? 'Không có',
                'Số điện thoại',
              ),
              buildUserInfoDisplay(
                userModel.address ?? 'Trống',
                'Địa chỉ',
              ),
              buildUserInfoDisplay(
                userModel.sex ?? 'Không có',
                'Giới tính',
              ),
              buildUserInfoDisplay(
                userModel.reasonCluster ?? 'Không có',
                'Lý do đến khai báo',
              ),
              buildUserInfoDisplay(
                userModel.placeCluster ?? 'Không có',
                'Địa điểm vùng dịch',
              ),
              buildUserInfoDisplay(
                userModel.timeComeCluster ?? 'Không có',
                'Thời gian ở vùng dịch',
              ),
              buildUserInfoDisplay(
                userModel.sameHome ?? 'Không có',
                'Quan hệ với người nhiễm',
              ),
              buildUserInfoDisplay(
                userModel.symptom ?? 'Không có',
                'Triệu chứng',
              ),
              buildUserInfoDisplay(
                userModel.status ?? 'Không có',
                'Tình trạng bản thân',
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () =>Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    primary:  Color(0xFF332f8e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    child: Text(
                      'Trở lại thư viện',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
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
          Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 25.0,
                )
              ],
            ),
          )
        ],
      ));
}
