import 'dart:core' as prefix0;
import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nardis/components/CircleImage.dart';
import 'package:nardis/components/marquee.dart';
import 'package:nardis/components/no_image.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/product_list_vm.dart';
import 'package:nardis/ui/home/home.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class GridViewLayout extends StatelessWidget {

  static List<dynamic> items;
  List<Map> cats;
  static int count_of_grid=items.length;
  String type='';

  GridViewLayout(items,this.type,this.cats);
Widget _gridView(List<dynamic> itemList) {
    return  GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: itemList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return gridView(cats);
  }




 gridView(List<Map> cats) {
  return new GridView.builder(

  scrollDirection: Axis.vertical,
    physics: BouncingScrollPhysics(),
        itemCount: cats.length,
      
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int index) {
          return 
            GridTile(
            child: new GestureDetector(
              child:
            Card(
              child: Column(
              
                children: <Widget>[
                  Expanded(
            child: Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            width: MediaQuery.of(context).size.width/3.0,
            height: 450.0,
            decoration: myBoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //  Expanded(
                  
                //      child: ClipRRect(
                //         borderRadius: BorderRadius.circular(2.0),
                  
                //         child:  CachedNetworkImage(
                //                        placeholder: (context, url) => CircularProgressIndicator(),
                //                         imageUrl:cats[index]['image'],
                //                         fit: BoxFit.cover,
                //                         errorWidget: (context,url,error) => Image.asset('assets/images/no_image.png'),
                //                       )),//Image.asset(collections[index]['image'], fit: BoxFit.cover))
                // ),
    //             new Hero(
              
    // tag: cats[index],
    // child: 
    new Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(new Radius.circular(1.0))
      ),
      height: 100.0,
      child:
     new Container(
       height: 100.0,
       margin: EdgeInsets.all(2.0),
       padding: EdgeInsets.all(1.0),
        child: new CircleImage(height: 80.0,width: 80.0,radius: 50.0, imageUrl: cats[index]['image'],)
      // CircleAvatar(
      //   radius:78.0,
      //    backgroundColor: Colors.pinkAccent,
      //   child:
      //   CachedNetworkImage(
      //                                  placeholder: (context, url) => CircularProgressIndicator(),
      //                                   imageUrl:cats[index]['image'],
      //                                   fit: BoxFit.fill,
      //                                   alignment: AlignmentDirectional.center,
      //                                   errorWidget: (context,url,error) => NoImageAvatar(),
      //                                 )
      // ),
      ),
        ),
     // ),
            
        
              ],
            ),
            ),
                  ), 
                SizedBox(height: 1.0,),
                Text( cats[index]['title'],
                softWrap: false,
                overflow: TextOverflow.fade,
                 style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600,fontSize: 13.0))),
                SizedBox(height: 1.0,),
                        ],
            ),
        ),
            
            onTap: () {
              Navigator.pushReplacementNamed(context, '/subproducts',arguments:   new CategoryItem(cats[index]['title'],cats[index]['image'],
              cats[index]['code'],cats[index]['title'],SoapOpersConstants.SUBCATEGORY));
            },
                  ),
              
          );
        });
}
}
//         CustomScrollView(
//   slivers: List.generate(
//       10,
//       (item) => SliverGrid(
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 150.0,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//               childAspectRatio: 4.0,
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.amber[100 * (index % 9)],
//                   child: Text('grid item $index'),
//                 );
//               },
//               childCount: 6,
//             ),
//           )),
// )
// }


// class ItemCard extends StatelessWidget {
//   const ItemCard({Key key, this.item}) : super(key: key);
//   final ProductCategoryModel item;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//         return Card(
//           color: Colors.white,
//           child: Center(child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Icon(choice.icon, size:80.0, color: textStyle.color),
//                 Text(choice.title, style: textStyle),
//           ]
//         ),
//       )
//     );
//   }
// }