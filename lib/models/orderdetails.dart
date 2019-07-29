
 class OrderDetails {
  
     String ObjectId;
     double Price;
    int AllT;
    //int masterId;

    OrderDetails({this.ObjectId,this.AllT,this.Price});

factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return new OrderDetails(
      //id: json['Id'],
      ObjectId: json['ObjectId'],
      Price: json['Price'],
      AllT: json['AllT'],
     // masterId: json['MasterId']
    );

  }

Map<String, dynamic> toJson() => {
 //'Id': this.id,
 'ObjectId': this.ObjectId,
  'Price': this.Price,
  'AllT': this.AllT,
  //'MasterId':this.masterId,
};

Map<String, dynamic> toSendJson() => {
 'ObjectId': this.ObjectId,
  'Price': this.Price,
  'AllT': this.AllT,
};

    OrderDetails.map(Map<String, dynamic> obj)
  {
    var map = new Map<String, dynamic>();
    //this.id=obj["id"];
    this.ObjectId=obj["ObjectId"];
    this.Price=obj["Price"];
    //this.masterId=obj["MasterId"];
    this.AllT=obj["AllT"];

  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    //map["id"]=this.id;
    map["ObjectId"]=this.ObjectId;
    map["Price"]=this.Price;
    //map["MasterId"]=this.masterId;
    map["AllT"]=this.AllT;
   
   return map;

  }
}