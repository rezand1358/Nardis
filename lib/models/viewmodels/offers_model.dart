
 import 'package:nardis/data/soap_constants.dart';

class ProductOffers {
  String description;
  String code;
  String name;
  String allt; 
  String priceC;
  String priceB;
  String imageUrl;
  ProductOffers({this.name,this.code,this.allt,this.priceB,this.priceC,this.description,this.imageUrl});


  ProductOffers.map(dynamic obj)
  {
    var map = new Map<String, dynamic>();
    this.name=obj["Name"];
    this.code=obj["Code"];
    this.priceB=obj["PriceB"];
    this.priceC=obj["PriceC"];
    this.description=obj["Description"];
    this.allt=obj["Allt"];
    this.imageUrl=obj["ImageUrl"];

  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Name"]=this.name;
    map["Code"]=this.code;
    map["PriceB"]=this.priceB;
    map["PriceC"]=this.priceC;
    map["Description"]=this.description;
    map["Allt"]=this.allt;
    map["ImageUrl"]=this.imageUrl;

   
   return map;

  }

  factory ProductOffers.fromJson(Map<String, dynamic> json) {
    return new ProductOffers(
      name: json['Name'],
      code: json['Code'],
      priceB: json['PriceB'],
      priceC: json['PriceC'],
      description: json['Description'],
      allt: json['AllT'],
      imageUrl: json['ImageUrl']
    );

  }

Map<String, dynamic> toJson() => {
 'Name': this.name,
 'Code': this.code,
  'PriceB': this.priceB,
  'PriceC': this.priceC,
  'AllT': this.allt,
  'Description':this.description,
  'ImageUrl': this.imageUrl
};

  String get p_name => name;
  String get p_code => code;
  String get p_priceb => priceB;
  String get p_pricec => priceC;
  String get p_allt => allt;
  String get p_description => description;
  String get image_Url => SoapConstants.URL_IMAGE+'.'+code;

}