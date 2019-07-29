
import 'package:nardis/models/orderdetails.dart';

 class Order {


  //int id;
  int customerId;
  
  List<OrderDetails> orderDetails;

 Order({this.customerId,this.orderDetails})
 {
   orderDetails=new List();
 }
factory Order.fromJson(Map<String, dynamic> json) {
    return new Order(
      customerId: json['CustomerId'],
      orderDetails: json['OrderDetails']
    );
  }

Map<String, dynamic> toJson() => {
 'CustomerId': this.customerId,
 'OrderDetails': this.orderDetails

};

Map<String, dynamic> toSendJson() => {
 'CustomerId': this.customerId,  
 'OrderDetails': this.orderDetails
};

Order.map(Map<String, dynamic> obj)
  {
    var map = new Map<String, dynamic>();
    this.customerId=obj["CustomerId"];
    this.orderDetails=obj['OrderDetails'];
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["CustomerId"]=this.customerId;
    map['OrderDetails']=this.orderDetails;
   return map;

  }

}