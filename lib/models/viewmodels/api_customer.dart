class ApiCustomer {

 String firstName;
     String lastName;
     String address;
     //String tel;
     String mobile;
    //  String socialNo;
    //  String postalCode;
    //  String lat;
    //  String long;
  
    
    //  String email;

ApiCustomer({this.firstName,this.lastName,this.mobile,this.address});

factory ApiCustomer.fromJson(Map<String, dynamic> json) {

  return new ApiCustomer(
   
    mobile: json['Mobile'],
    firstName: json['FirstName'],
lastName: json['LastName'],
address: json['Address'],


  );
}

Map<String, dynamic> toJson() => {
  
  'Mobile': this.mobile,
  'FirstName': this.firstName,
  'LastName' :this.lastName,
  'Address': this.address,
  
  
};

factory ApiCustomer.map(dynamic obj)
  {
    //var map = new Map<String, dynamic>();
   return new ApiCustomer(
      firstName:obj["FirstName"],
    lastName:obj["LastName"],
    mobile:obj["Mobile"],
    address:obj["Address"]);
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["FirstName"]=this.firstName;
    map["LastName"]=this.lastName;
    map["Mobile"]=this.mobile;
    map["Address"]=this.address;
  
   
   return map;

  }

}