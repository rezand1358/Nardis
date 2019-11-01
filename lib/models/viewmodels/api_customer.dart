class ApiCustomer {

 String firstName;
     String lastName;
     String address;
     String tel;
     String mobile;
      String socialNo;
      String postalCode;
      String lat;
      String long;
  
    
      String email;

ApiCustomer({this.firstName,this.lastName,this.mobile,this.address,this.email,this.lat,this.long,this.postalCode,this.socialNo,this.tel});

factory ApiCustomer.fromJson(Map<String, dynamic> json) {

  return new ApiCustomer(
   
    mobile: json['Mobile'],
    firstName: json['FirstName'],
lastName: json['LastName'],
address: json['Address'],
    tel:json['Tel'],
    email: json['Email'],
    lat: json["Lat"],
    long: json['Long'],
    socialNo: json['SocialNo'],
    postalCode: json['PostalCode']


  );
}

Map<String, dynamic> toJson() => {
  
  'Mobile': this.mobile,
  'FirstName': this.firstName,
  'LastName' :this.lastName,
  'Address': this.address,
  'PostalCode':this.postalCode,
  'Email': this.email,
  'Tel':this.tel,
  'SocialNo': this.socialNo,
  'Lat':this.lat,
  'Long':this.long
  
};

factory ApiCustomer.map(dynamic obj)
  {
    //var map = new Map<String, dynamic>();
   return new ApiCustomer(
      firstName:obj["FirstName"],
    lastName:obj["LastName"],
    mobile:obj["Mobile"],
    address:obj["Address"],
       tel:obj['Tel'],
       email: obj['Email'],
       lat: obj["Lat"],
       long: obj['Long'],
       socialNo: obj['SocialNo'],
       postalCode: obj['PostalCode']);

  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["FirstName"]=this.firstName;
    map["LastName"]=this.lastName;
    map["Mobile"]=this.mobile;
    map["Address"]=this.address;
    map['PostalCode']=this.postalCode;
    map['Email']= this.email;
    map['Tel']=this.tel;
    map['SocialNo']= this.socialNo;
    map['Lat']=this.lat;
    map['Long']=this.long;
   
   return map;

  }

}