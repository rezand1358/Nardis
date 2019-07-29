

class User {
  String userName;
  String mobile;
  String code;
  String password;

User({this.userName,this.mobile,this.code,this.password});


factory User.fromJson(Map<String, dynamic> json) {

  return new User(
    code: json['Code'],
    mobile: json['Mobile'],
    userName: json['Username'],
    password: json['Password']
  );
}

Map<String, dynamic> toJson() => {
  'Code' : this.code,
  'Mobile': this.mobile,
  'Username': this.userName,
  'Password': this.password,
};

  factory User.map(dynamic obj)
  {
    return new User(
    mobile:obj["Mobile"],
    code: obj["Code"],
    userName:obj["UserName"],
    password: obj['Password']);
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Username"]=this.userName;
    map["Mobile"]=this.mobile;
    map["Code"]=this.code;
   map['Password']=this.password;
   return map;

  }



}