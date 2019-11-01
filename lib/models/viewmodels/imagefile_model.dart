import 'dart:io';

import 'package:flutter/material.dart';

class UploadedImageFile {

  File file;
  String type;

  UploadedImageFile({
    @required this.file,
    @required this.type,
  });

}