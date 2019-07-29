import 'dart:async';

import 'package:nardis/data/database_helper.dart';
import 'package:nardis/models/user.dart';





class Helper {


 static User getUserLoginned()
  {
    User user=DatabaseHelper.internal().getUserInfo() as User;
    return user;
  }
 
}