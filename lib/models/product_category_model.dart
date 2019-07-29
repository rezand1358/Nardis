

 class ProductCategoryModel 
{

  String name;
  String code;
  String parent_id;

  ProductCategoryModel({this.name,this.code,this.parent_id});

factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return new ProductCategoryModel(
      name: json['Name'],
      code: json['Code'],
      parent_id: json['ParentId'],
    );

  }

Map<String, dynamic> toJson() => {
 'Name': this.name,
 'Code': this.code,
  'ParentId': this.parent_id,
  
};

 ProductCategoryModel.map(Map<String, dynamic> obj)
 {

   var map = new Map<String, dynamic>();
    this.name=obj['Name'];
    this.code=obj['Code'];
    this.parent_id=obj['ParentId'];
 }
 
 Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Name"]=this.name;
    map["Code"]=this.code;
    map["ParentId"]=this.parent_id;
    return map;
  }

 

}