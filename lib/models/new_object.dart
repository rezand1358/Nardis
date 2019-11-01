import 'package:flutter/material.dart';

class NewObject {
  String code;
  String name;
  String brandId;
  String productId;
  String price;
  String description;

  NewObject({
    @required this.code,
    @required this.name,
    @required this.brandId,
    @required this.productId,
    @required this.price,
    @required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'Code': this.code,
      'Name': this.name,
      'BrandId': this.brandId,
      'ProductId': this.productId,
      'Price': this.price,
      'Description': this.description,
    };
  }

  factory NewObject.fromMap(Map<String, dynamic> map) {
    return new NewObject(
      code: map['Code'],
      name: map['Name'] ,
      brandId: map['BrandId'] ,
      productId: map['ProductId'] ,
      price: map['Price'] ,
      description: map['Description'],
    );
  }

  factory NewObject.fromJson(Map<String, dynamic> json) {
    return NewObject(code: json["Code"],
      name: json["Name"],
      brandId: json["BrandId"],
      productId: json["ProductId"],
      price: json["Price"],
      description: json["Description"],);
  }

  Map<String, dynamic> toJson() {
    return {
      "Code": this.code,
      "Name": this.name,
      "BrandId": this.brandId,
      "ProductId": this.productId,
      "Price": this.price,
      "Description": this.description,
    };
  }


}
