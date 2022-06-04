import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.address,
    this.birthday,
    this.name,
    this.patient,
    this.phone,
    this.placeCluster,
    this.reasonCluster,
    this.sameHome,
    this.sex,
    this.status,
    this.symptom,
    this.timeComeCluster,
  });

  String? id;
  String? address;
  String? birthday;
  String? name;
  String? patient;
  String? phone;
  String? placeCluster;
  String? reasonCluster;
  String? sameHome;
  String? sex;
  String? status;
  String? symptom;
  String? timeComeCluster;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    address: json["address"],
    birthday: json["birthday"],
    name: json["name"],
    patient: json["patient"],
    phone: json["phone"],
    placeCluster: json["placeCluster"],
    reasonCluster: json["reasonCluster"],
    sameHome: json["sameHome"],
    sex: json["sex"],
    status: json["status"],
    symptom: json["symptom"],
    timeComeCluster: json["timeComeCluster"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "birthday": birthday,
    "name": name,
    "patient": patient,
    "phone": phone,
    "placeCluster": placeCluster,
    "reasonCluster": reasonCluster,
    "sameHome": sameHome,
    "sex": sex,
    "status": status,
    "symptom": symptom,
    "timeComeCluster": timeComeCluster,
  };
}
