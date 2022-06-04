import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
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
      body: UserInformationScreen(),
    );
  }
}

class UserInformationScreen extends StatefulWidget {
  @override
  State createState() => UserInformationScreenState();
}

class UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=54'),
              backgroundColor: Colors.transparent,
            ),
            Column(
              children: <Widget>[
                // Username
                Container(
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      hintText: 'Tran Quang Duy',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 3,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                // Country
                Container(
                  child: Text(
                    'Country',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
                ),

                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Viet Nam',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                        contentPadding: EdgeInsets.all(5.0),
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                // Address
                Container(
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '320/12 Trường Chinh, HCM',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                        contentPadding: EdgeInsets.all(5.0),
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                // About me
                Container(
                  child: Text(
                    'About me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Fun, like travel, read book and play PES!!!',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                        contentPadding: EdgeInsets.all(5.0),
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                // About me
                Container(
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '0123456789',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                        contentPadding: EdgeInsets.all(5.0),
                        hintStyle: TextStyle(color: Colors.grey)),
                    keyboardType: TextInputType.number,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                // About me
                Container(
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '0123456789',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                        contentPadding: EdgeInsets.all(5.0),
                        hintStyle: TextStyle(color: Colors.grey)),
                    keyboardType: TextInputType.number,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                // About me
                Container(
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '0123456789',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                        contentPadding: EdgeInsets.all(5.0),
                        hintStyle: TextStyle(color: Colors.grey)),
                    keyboardType: TextInputType.number,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                ),


              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        ),
      ),
      padding: EdgeInsets.only(bottom: 20.0),
    );
  }
}
