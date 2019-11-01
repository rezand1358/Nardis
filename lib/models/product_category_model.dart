

 class ProductCategoryModel 
{

  String name;
  String code;
  String parent_id;
  String id;
  String imageAdd;
  ProductCategoryModel({this.id,this.name,this.code,this.parent_id,this.imageAdd});

factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return new ProductCategoryModel(
      name: json["Name"],
      code: json["Code"],
      id: json["Id"],
      parent_id: json["ParentId"],
        imageAdd:json["ImageAdd"],
    );

  }

Map<String, dynamic> toJson() => {
 "Name": this.name,
 "Code": this.code,
  "Id": this.id,
  "ParentId": this.parent_id,
  "ImageAdd": this.imageAdd
};

 ProductCategoryModel.map(Map<String, dynamic> obj)
 {

   var map = new Map<String, dynamic>();
    this.name=obj['Name'];
    this.code=obj['Code'];
    this.id=obj['Id'];
    this.parent_id=obj['ParentId'];
   this.imageAdd=obj["ImageAdd"];
 }
 
 Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Name"]=this.name;
    map["Code"]=this.code;
    map["Id"]=this.id;
    map["ParentId"]=this.parent_id;
    map["ImageAdd"]=this.imageAdd;
    return map;
  }

 

}