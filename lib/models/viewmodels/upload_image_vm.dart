import 'package:flutter/material.dart';
import 'package:nardis/bloc/values/notify_value.dart';
import 'package:nardis/models/viewmodels/imagefile_model.dart';


class UploadImageModel
{
 String title= '';
 int type;
 String forWhich='';
 NotyBloc<UploadedImageFile> valueNotyImageBloc;

 UploadImageModel({
   @required this.title,
   @required this.type,
   @required this.forWhich,
   @required this.valueNotyImageBloc,
 });

}