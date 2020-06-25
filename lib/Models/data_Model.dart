import 'package:flutter/material.dart';
class data_Model{

  String title ,
      interest,
      date,address,
      trainerName,
      trainerImg,
      trainerInfo,
      occasionDetail;
  List<dynamic> imags_list;

  data_Model(
  { this.title,
      this.interest,
      this.date,
      this.address,
      this.trainerName,
      this.trainerImg,
      this.trainerInfo,
      this.occasionDetail,
      this.imags_list
  });



  factory data_Model.fromJson(Map<String, dynamic> json) {
    return data_Model(
      title: json['title'],
      interest: json['interest'],
      date: json['date'],
      address: json['address'],
      trainerName: json['trainerName'],
      trainerImg: json['trainerImg'],
      trainerInfo: json['trainerInfo'],
      occasionDetail: json['occasionDetail'],
      imags_list: json['img'],
    );

}

}