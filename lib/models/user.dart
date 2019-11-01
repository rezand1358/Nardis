

class User {
  String userName;
  String mobile;
  String code;
  String password;
  int admin;
User({this.userName,this.mobile,this.code,this.password,this.admin});


factory User.fromJson(Map<String, dynamic> json) {

  return new User(
    code: json['Code'],
    mobile: json['Mobile'],
    userName: json['Username'],
    password: json['Password'],
    admin: json['Admin']
  );
}

Map<String, dynamic> toJson() => {
  'Code' : this.code,
  'Mobile': this.mobile,
  'Username': this.userName,
  'Password': this.password,
  "Admin": this.admin
};

  factory User.map(dynamic obj)
  {
    return new User(
    mobile:obj["Mobile"],
    code: obj["Code"],
    userName:obj["UserName"],
    password: obj['Password'],
    admin: obj['Admin']);
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Username"]=this.userName;
    map["Mobile"]=this.mobile;
    map["Code"]=this.code;
   map['Password']=this.password;
   map['Admin']=this.admin;
   return map;

  }



}