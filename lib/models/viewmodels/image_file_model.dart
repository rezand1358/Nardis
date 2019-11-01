import 'dart:io';
import 'package:flutter/material.dart';

class ImageFileModel {
  String fileName;
  String type;
  File image;
  int id;
  int requestId;
  ImageFileModel({
    @required this.fileName,
    @required this.type,
    @required this.image,
    @required this.id,
    @required this.requestId
  });

}