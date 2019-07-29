class Customer {

 String firstName;
     String lastName;
     String address;
     String tel;
     String mobile;
     String socialNo;
     String postalCode;
     String lat;
     String long;
     String password;
     int kind;
     String code;
     String email;

Customer({this.firstName,this.lastName,this.mobile,this.password,this.code,this.tel,this.address,this.kind,this.postalCode,this.socialNo,this.lat,this.long,this.email});

factory Customer.fromJson(Map<String, dynamic> json) {

  return new Customer(
    code: json['Code'],
    mobile: json['Mobile'],
    firstName: json['FirstName'],
lastName: json['LastName'],
address: json['Address'],
kind: json['Kind'],
lat: json['Lat'],
long: json['Long'],
password: json['Password'],
postalCode: json['PostalCode'],
socialNo: json['SocialNo'],
tel: json['Tel'],
email: json['Email']
  );
}

Map<String, dynamic> toJson() => {
  'Code' : this.code,
  'Mobile': this.mobile,
  'FirstName': this.firstName,
  'LastName' :this.lastName,
  'Address': this.address,
  'Kind' : this.kind,
  'Lat': this.lat,
  'Long' : this.long,
  'Password' : this.password,
  'PostalCode' : this.postalCode,
  'SocialNo' : this.socialNo,
  'Tel' : this.tel,
  'Email': this.email
};

factory Customer.map(dynamic obj)
  {
    //var map = new Map<String, dynamic>();
    return new Customer(
    firstName:obj["FirstName"],
    lastName:obj["LastName"],
    code:obj["Code"],
    mobile:obj["Mobile"],
    password:obj["Password"],
    tel:obj["Tel"],
    address:obj["Address"],
    kind:obj["Kind"],
    postalCode:obj["PostalCode"],
    lat:obj["Lat"],
    long:obj["Long"],
    socialNo:obj["SocialNo"],
    email: obj["Email"]);
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["FirstName"]=this.firstName;
    map["LastName"]=this.lastName;
    map["Code"]=this.code;
    map["Password"]=this.password;
    map["PostalCode"]=this.postalCode;
    map["SocialNo"]=this.socialNo;
    map["Lat"]=this.lat;
    map["Long"]=this.long;
    map["Kind"]=this.kind;
    map["Tel"]=this.tel;
    map["Mobile"]=this.mobile;
    map["Address"]=this.address;
    map["Email"]=this.email;
   
   return map;

  }

}