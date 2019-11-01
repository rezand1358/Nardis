import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:nardis/i10n/nardis_messages_all.dart';


class Translations {

  Translations(){

  }
  Translations._()
  {
    current=this;
  }
  static Translations current;
  static Future<Translations> load(Locale locale) {
    final String name =
    (locale.countryCode != null && locale.countryCode.isEmpty)
        ? locale.languageCode
        : locale.toString();
    Translations._();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new Translations();
    });
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

 /* static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Healthy Style',
    },
    'fa': {
      'title': 'Healthy Style',
    },
  };*/

 String userName() => Intl.message(
      "Username",
      name: "userName",
      args: [],
      desc: "User Name"
    );

  String notValidUsername() => Intl.message(
      'Not Valid Username',
      name: 'notValidUsername',
    );

  String password() => Intl.message(
      'password',
      name: 'password',
    );

  String passwordIsTooShort() => Intl.message(
      'password is too short',
      name: 'passwordIsTooShort',
    );

  String login() => Intl.message(
      'Login',
      name: 'login',
    );

  String language() => Intl.message(
      'Language',
      name: 'language',
    );

  String links() => Intl.message(
      'Links',
      name: 'links',
    );

  String contacts() => Intl.message(
      'Contacts',
      name: 'contacts',
    );

  String attendance() => Intl.message(
      'Attendance',
      name: 'attendance',
    );

  String support() => Intl.message(
      'Support',
      name: 'support',
    );

  String profile() => Intl.message(
      'Profile',
      name: 'profile',
    );

  String search() => Intl.message(
      'Search',
      name: 'search',
    );
  String basket() => Intl.message(
      'Basket',
      name: 'basket',
    );
  String product() => Intl.message(
      'Products',
      name: 'product',
    );
  String help() => Intl.message(
      'Help',
      name: 'help',
    );
   String about() => Intl.message(
      'About',
      name: 'about',
    );
  String settings() => Intl.message(
      'Settings',
      name: 'settings',
    );

  String ucanbuymorebutpayless() => Intl.message(
      'You Can Buy More But Pay less',
      name: 'ucanbuymorebutpayless',
    );
  String program() => Intl.message(
      'Program',
      name: 'program',
    );
  String exit() => Intl.message(
      'Exit',
      name: 'exit',
    );

  String register() => Intl.message(
      'Register',
      name: 'register',
    );

  String send() => Intl.message(
      'Send',
      name: 'send',
    );

  String confirm() => Intl.message(
      'Confirm',
      name: 'confirm',
    );

  String resend() => Intl.message(
      'ReSend',
      name: 'resend',
    );

  String similaritems() => Intl.message(
      'Similar Items',
      name: 'similaritems',
    );

  String error() => Intl.message(
      'Error',
      name: 'error',
    );

  String errorInSend() {
    return Intl.message(
      'Error in send',
      name: 'errorInSend',
    );
  }

String receive() => Intl.message(
      'Receive',
      name: 'receive',
    );
String errorInReceive() => Intl.message(
      'Error in receive',
      name: 'errorInReceive',
    );

String edit() => Intl.message(
      'Edit',
      name: 'edit',
    );


  String continuation() => Intl.message(
    'Continuation',
    name: 'continuation',
  );
  String numberisnotcorrect() => Intl.message(
    'Number is not correct',
    name: 'numberisnotcorrect',
  );
  String sportFieldPrice() => Intl.message(
    'Sport Field Price',
    name: 'sportFieldPrice',
  );
 
  String age() => Intl.message(
    'Age',
    name: 'age',
  );
  String sex() => Intl.message(
    'Sex',
    name: 'sex',
  );
  String firstName() => Intl.message(
    'First Name',
    name: 'firstName',
  );
  String lastName() => Intl.message(
    'Last Name',
    name: 'lastName',
  );
  String email() => Intl.message(
    'Email',
    name: 'email',
  );
  String mobile() => Intl.message(
    'Mobile',
    name: 'mobile',
  );
  
  String image() => Intl.message(
    'Image',
    name: 'image',
  );
  String height() => Intl.message(
    'Height',
    name: 'height',
  );
  


  String date() => Intl.message(
    'Date',
    name: 'date',
  );

 String postalcode() => Intl.message(
    'PostalCode',
    name: 'postalcode',
  );

String socialno() => Intl.message(
    'SocialNo',
    name: 'socialno',
  );

 
 String tel() => Intl.message(
    'Tel',
    name: 'tel',
  );

String address() => Intl.message(
    'Address',
    name: 'address',
  );

String sendordersuccessful() => Intl.message(
    'Order sent successful',
    name: 'sendordersuccessful',
  );

  String bascketisempty() => Intl.message(
    'Bascket is Empty.',
    name: 'bascketisempty',
  );

  String totalsum() => Intl.message(
    'Total:',
    name: 'totalsum',
  );
  
  String products() => Intl.message(
    'Products:',
    name: 'products',
  );
  
  String delete() => Intl.message(
    'Delete',
    name: 'delete',
  );
  String sendorder() => Intl.message(
    'Send Order',
    name: 'sendorder',
  );
  String productslist() => Intl.message(
    'Products List:',
    name: 'productslist',
  );
  String usercode() => Intl.message(
    'User Code:',
    name: 'usercode',
  );
  
  String confirmmobile() => Intl.message(
    'Confirm Mobile:',
    name: 'confirmmobile',
  );
  
  

  String confirmSecurityCode() => Intl.message(
    'Confirm Security Code',
    name: 'confirmSecurityCode',
  );

  String newRequest() => Intl.message(
    'New Request',
    name: 'newRequest',
  );
  String forgotPassword() => Intl.message(
    'Forgot Password',
    name: 'forgotPassword',
  );

  String createNew() => Intl.message(
    'Create New',
    name: 'createNew',
  );
  String home() => Intl.message(
    'Home',
    name: 'home',
  );
 
 String offers() => Intl.message(
    'Offers',
    name: 'offers',
  );

 String logout() => Intl.message(
    'LogOut',
    name: 'logout',
  );

   String logoutalarm() => Intl.message(
    'Are you sure to logout?',
    name: 'logoutalarm',
  );


   String productcode() => Intl.message(
    'Product Code',
    name: 'productcode',
  );

  String productcategory() => Intl.message(
    'Product Category',
    name: 'productcategory',
  );
String brands() => Intl.message(
    'Brands',
    name: 'brands',
  );

String existance() => Intl.message(
    'Existance',
    name: 'existance',
  );

  String noimage() => Intl.message(
    'No Image',
    name: 'noimage',
  );

  String confirmrecievecode() => Intl.message(
    'Confirm security code',
    name: 'confirmrecievecode',
  );
  
   String counts() => Intl.message(
    'Counts',
    name: 'counts',
  );

  String productUnitPrice() => Intl.message(
    'Product UnitPrice',
    name: 'productUnitPrice',
  );

    String countincart() => Intl.message(
    'Count in Cart',
    name: 'countincart',
  );
    String enterproductname() => Intl.message(
    'Enter Product Name',
    name: 'enterproductname',
  );

    String productsearch() => Intl.message(
    'Product search',
    name: 'productsearch',
  );
  
  
  
    String productnameisempty() => Intl.message(
    'Product Name is Empty',
    name: 'productnameisempty',
  );
  
  String loadingdata() => Intl.message(
    'Loading data',
    name: 'loadingdata',
  );
  
  String dataloaded() => Intl.message(
    'Data Loaded',
    name: 'dataloaded',
  );
   
  String plzlogin() => Intl.message(
    'Please Login!',
    name: 'plzlogin',
  );
  String plzEnterCode() => Intl.message(
    'plzEnterCode',
    name: 'plzEnterCode',
  );
  String description() => Intl.message(
    'description',
    name: 'description',
  );
  String plzEnterName() => Intl.message(
    'plzEnterName',
    name: 'plzEnterName',
  );
  String productName() => Intl.message(
    'productName',
    name: 'productName',
  );
  String productPic() => Intl.message(
    'productPic',
    name: 'productPic',
  );
  String notYetPickVideo() => Intl.message(
    'notYetPickVideo',
    name: 'notYetPickVideo',
  );
  String errorLoadingVideo() => Intl.message(
    'errorLoadingVideo',
    name: 'errorLoadingVideo',
  );
  String pickImageError() => Intl.message(
    'pickImageError',
    name: 'pickImageError',
  );
  String notYetPickImage() => Intl.message(
    'notYetPickImage',
    name: 'notYetPickImage',
  );
  String errorPickImageVideo() => Intl.message(
    'errorPickImageVideo',
    name: 'errorPickImageVideo',
  );
  String title() => Intl.message('Nardis Shop',
        name: 'title', desc: 'The application title');
}