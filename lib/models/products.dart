
 class Product {

  String description;
  String code;
  String name;
  String allt; 
  String priceC;
  String priceB;
  String imageAdd;
  Product({this.name,this.code,this.allt,this.priceB,this.priceC,this.description,this.imageAdd});


  Product.map(Map<String, dynamic> obj)
  {
    var map = new Map<String, dynamic>();
    this.name=obj["Name"];
    this.code=obj["Code"];
    this.priceB=obj["PriceB"];
    this.priceC=obj["PriceC"];
    this.description=obj["Description"];
    this.allt=obj["Allt"];
    this.imageAdd=obj["ImageAdd"];

  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Name"]=this.name;
    map["Code"]=this.code;
    map["PriceB"]=this.priceB;
    map["PriceC"]=this.priceC;
    map["Description"]=this.description;
    map["Allt"]=this.allt;
    map["ImageAdd"]=this.imageAdd;
   
   return map;

  }


  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
      name: json["Name"],
      code: json["Code"],
      priceB: json["PriceB"],
      priceC: json["PriceC"],
      description: json["Description"],
      allt: json["AllT"],
      imageAdd: json["ImageAdd"]
    );

  }

Map<String, dynamic> toJson() => {
 "Name": this.name,
 "Code": this.code,
  "PriceB": this.priceB,
  "PriceC": this.priceC,
  "AllT": this.allt,
  "Description":this.description,
  "ImageAdd" : this.imageAdd
};

  String get p_name => name;
  String get p_code => code;
  String get p_priceb => priceB;
  String get p_pricec => priceC;
  String get p_allt => allt;
  String get p_description => description;
  String get P_imageadd =>imageAdd;

}