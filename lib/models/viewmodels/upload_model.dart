import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class UploadModel
{

  String extraField;
  String  files;
  String fileName;
  int id;
  UploadModel({
    @required this.extraField,
    @required this.files,
    @required this.fileName,
    @required this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'extraField': this.extraField,
      'files': this.files,
      'fileName': this.fileName,
      'ID':this.id
    };
  }

  factory UploadModel.fromMap(Map<String, dynamic> map) {
    return new UploadModel(
      extraField: map['extraField'] ,
      files: map['files'] ,
      fileName: map['fileName'],
      id: map['ID']
    );
  }

  factory UploadModel.fromJson(Map<String, dynamic> json) {
    return UploadModel(extraField: json["extraField"],
      files: json["files"],
      fileName: json['fileName'],
      id: json['ID']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "extraField": this.extraField,
      "files": this.files,
    "fileName": this.fileName,
    "ID": this.id};
  }
  static List encondeToJson(List<UploadModel>list){
    List jsonList = List();
    list.map((item)=>
        jsonList.add(item.toJson())
    ).toList();
    return jsonList;
  }

}