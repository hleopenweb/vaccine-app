import 'package:camera_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  UserInformation({Key? key, required this.name, required this.nguoiNha, required this.sdt, required this.ngaySinh, required this.diaChi, required this.sex, required this.status}) : super(key: key);

  final String? name;
  final String? nguoiNha;
  final String? sdt;
  final String? ngaySinh;
  final String? diaChi;
  final String? sex;
  final String? status;


  @override
  Widget build(BuildContext context) {
    print("Gioi tinh: "+sex.toString());
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
            title: Center(
              child: Text(
                'Extract Information',
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
              buildUserInfoDisplay(name ?? 'Không có', 'Họ và tên'),
              buildUserInfoDisplay(
                  nguoiNha ?? 'Không có', 'Bệnh nhân tiếp xúc'),
              buildUserInfoDisplay(
                ngaySinh ?? 'Không có',
                'Ngày sinh',
              ),
              buildUserInfoDisplay(
                sdt ?? 'Không có',
                'Số điện thoại',
              ),
              buildUserInfoDisplay(
                diaChi ?? 'Trống',
                'Địa chỉ',
              ),
              buildUserInfoDisplay(
                sex ?? 'Không có',
                'Giới tính',
              ),
              buildUserInfoDisplay(
                status ?? 'Không có',
                'Trạng thái',
              ),
              // buildUserInfoDisplay(
              //   userModel.placeCluster ?? 'Không có',
              //   'Địa điểm vùng dịch',
              // ),
              // buildUserInfoDisplay(
              //   userModel.timeComeCluster ?? 'Không có',
              //   'Thời gian ở vùng dịch',
              // ),
              // buildUserInfoDisplay(
              //   userModel.sameHome ?? 'Không có',
              //   'Quan hệ với người nhiễm',
              // ),
              // buildUserInfoDisplay(
              //   userModel.sta ?? 'Không có',
              //   'Triệu chứng',
              // ),
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
            height: 50,
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      getValue,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.3,
                        color: Colors.black.withOpacity(0.6),
                      ),
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
