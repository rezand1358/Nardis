import 'dart:async';

import 'package:meta/meta.dart';
import 'package:nardis/data/database_helper.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/user.dart';

class UserRepository {
  

  Future<String> authenticate({
    @required String username,
    @required String password,
    @required String code
  }) async {
   await databaseHelper.saveUser(new User(userName: username,mobile: username,code:code,password: password));

    //await Future.delayed(Duration(seconds: 1));
    return code;
  }

 Future<String> authenticateUser({
    @required Customer user,
  }) async {
   await databaseHelper.saveCustomerInfo(user);
   await databaseHelper.saveUser(new User(code: user.code,mobile: user.mobile,userName: user.mobile,password: user.password,admin: user.kind));
    return user.code;
  }

  Future<String> getUserCode() async
  {
     User user=await databaseHelper.getUserInfo();
     if(user!=null)
     {
      return user.code;
     }
     return '';
  }

  Future<bool> getUserType() async
  {
    User user=await databaseHelper.getUserInfo();
    if(user!=null)
    {
      return user.admin==true;
    }
    return false;
  }
  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    //await Future.delayed(Duration(seconds: 1));
     User user=await databaseHelper.getUserInfo();
     if(user!=null)
     {
       user.code='';
     await databaseHelper.saveUser(user);
     await databaseHelper.deleteUsers();
     await databaseHelper.deleteCustomers();

     }
    return;
  }

  Future<void> persistToken(String token) async {
     User user=await databaseHelper.getUserInfo();
     if(user!=null)
     {
       user.code=token;
       //user.password=
       await databaseHelper.saveUser(user);
     }
      return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
   bool result=await databaseHelper.isLoggedIn();
   // await Future.delayed(Duration(seconds: 1));
    return result;
  }

}