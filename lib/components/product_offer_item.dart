
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class ProductOfferItem {

BuildContext context;
ProductOfferItem(this.context,this.item,this.imageUrl,this.mapItem);
CategoryItem item;
Map mapItem;
String imageUrl;
 
buildOfferItem(){
    return    Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent[100],style: BorderStyle.solid,width: 0.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                      color: Color(0xF8BBD0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 0.0
                        )
                      ]
                    ),
                    child:
                      
                     Row(children: <Widget>[
                      new Icon(Icons.category,color: Colors.pinkAccent[100],size:22.0 ,),
                      new Text(mapItem['title'],style: new TextStyle(color: Colors.blueAccent,fontSize:12.0 ) ,)
                     ],) 
                     
                    
                    
                 
                  
    );
  }
//  Widget get catImage {
//   var catAvatar = new Hero(
//     tag: item,
//     child: new Container(
//       width: 100.0,
//       height: 100.0,
//       decoration: new BoxDecoration(
//         shape: BoxShape.circle,
//         image:  CachedNetworkImage(
//                                        placeholder: (context, url) => CircularProgressIndicator(),
//                                         imageUrl: imageUrl,
//                                         errorWidget: (context,url,error) => Image.asset('assets/food/meal.jpg'),
                                      
//                                       ),
      
//       ),
//     ),
//   );
//  }
  Widget get categoryCard {

  return new Positioned(
    right: 0.0,
    top: 0.0,
    child: new Container(
      margin: EdgeInsets.all(3.0),
      width: MediaQuery.of(context).size.width-50.0,
      height: 135.0,
      child: new Card(
        margin: EdgeInsets.only(top: 10.0, bottom: 18.0),
        color: Color(0x100288D1),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(70.0),bottomLeft: Radius.circular(3.0) ),
        ),
        child: new Padding(
          padding: const EdgeInsets.only(
            top: 2.0,
            bottom: 0.0,
            left: 2.0,
          ),
          child: new Container(
              constraints: new BoxConstraints.expand(
                height: 210.0,
              ),
              padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
              decoration: new BoxDecoration(

              ),
              child: new Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  new Container(
                    constraints: new BoxConstraints.expand(
                      height: 180.0,
                      width: 200.0,
                    ),
                    margin: EdgeInsets.only(right: 105.0,bottom: 2.0),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                     new Text(item.title,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        )
                    ),

                 
            ]
                      ),

                  ),
                  /*new Positioned(
                    left: 0.0,
                    bottom: -20.0,
                    child:*/
                  new Positioned(
                    right: 0.0,
                    bottom: -25.0,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                            new Icon(Icons.stars,color: Colors.greenAccent,size: 54.0,),
                        new Text('پیشرفته',style: new TextStyle(color: Colors.blueAccent[100],fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ]
                  )
                  ),
                  new Positioned(
                    left: 0.0,
                      bottom: -20.0,
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: <Widget>[

                      /*new Stack(
                    overflow: Overflow.visible ,
                        children: <Widget>[*/

                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: new Text('20000',style: new TextStyle(color: Colors.pink[100],fontSize: 12.0,
                          letterSpacing: 1.0,
                          wordSpacing: 5.0,
                        fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(
                          left: 8.0,
                          bottom: 0.0,
                          right: 0.0,
                          top: 0.0
                        ),
                        child: new Icon(Icons.monetization_on,color: Colors.blueAccent[200],size: 26.0,),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          bottom: 0.0,
                          right: 8.0,
                          top: 0.0
                      ),
                        child: new Icon(Icons.thumb_up,color: Colors.amber[200],size: 30.0,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.0,
                          bottom: 0.0,
                          right: 8.0,
                          top: 0.0
                      ),
                        child: new Icon(Icons.add_comment,color: Colors.black45,size: 30.0,),
                      ),

                  ],

                 // ),

               // ],
              )



        ),
  ],
      ),
        ),
        ),
      ),
    ),
  );
}

}