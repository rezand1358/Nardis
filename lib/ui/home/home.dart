

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/shopcart/cart.dart';
import 'package:nardis/components/CircleImage.dart';
import 'package:nardis/components/GridView.dart';

import 'package:nardis/components/marquee_flutter.dart';
import 'package:nardis/components/no_image.dart';
import 'package:nardis/components/product_category_item.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/models/viewmodels/offers_model.dart';
import 'package:nardis/models/viewmodels/product_details_vm.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/utils/autoscroll_text.dart';
import 'package:nardis/utils/marquee_widget.dart';
import 'package:nardis/widgets/appbar_collapse.dart';
import 'package:nardis/widgets/drawer/circular_image.dart';
import 'package:nardis/widgets/slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

final List<String> imgList = [
  "assets/food/meal.jpg",
  "assets/img/2.jpg",
  "assets/travel/fishtail.jpg",
  "assets/travel/kathmandu2.jpg"
];



final CarouselSlider touchDetectionDemo = CarouselSlider(
  viewportFraction: 1,
  aspectRatio: 2.0,
  autoPlay: true,
  enlargeCenterPage: false,
  pauseAutoPlayOnTouch: Duration(seconds: 3),
  items: imgList.map(
        (url) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      );
    },
  ).toList(),
);

Container buildCollectionsRow(List<Map> categorys) {
  return Container(
    color: Colors.transparent,
    height: 80.0,
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categorys.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            width: 180.0,
            height: 70.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Expanded(
                //     child: ClipRRect(
                //         borderRadius: BorderRadius.circular(5.0),
                //         child:  CachedNetworkImage(
                //                        placeholder: (context, url) => CircularProgressIndicator(),
                //                         imageUrl: categorys[index]['image'],
                //                         errorWidget: (context,url,error) =>ProductCategoryItem(context, new CategoryItem.map(categorys[index]), '',categorys[index]).buildCategoryItem() ),
                //                       //Image.asset(collections[index]['image'], fit: BoxFit.cover))
                // ),
                // ),
                // SizedBox(height: 5.0,),
                // Text(categorys[index]['title'], style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600))),
                ProductCategoryItem(context, new CategoryItem.map(categorys[index]), '',categorys[index]).buildCategoryItem(),
              ],
            )
        );
      },
    ),
  );
}


BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 0.5,
      color: Colors.pinkAccent,
    ),

    borderRadius: BorderRadius.all(
        Radius.circular(5.0) //         <--- border radius here
    ),
  );
}

Container buildBrandsRow(List<Map> cats) {
  return Container(
    //color: Colors.white,
    
    height: 500.0,
    padding: EdgeInsets.symmetric(horizontal: 2.0),
    child: new GridViewLayout(null, SoapOpersConstants.BRANDGROUPS, cats)
    ,
  );
}

Container buildOffersRow( List<Map> products) {
  return  
  Container(
    //color: Colors.white,
    alignment: Alignment.center,
    height:160.0,
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child:
       ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context,  index){
        return  GestureDetector(
          onTap: () {
            ProductSummary productSummary=new ProductSummary.map(products[index]);
            Navigator.pushNamed(context, '/productdetails',arguments: new ProductDetailsVM(productSummary: productSummary ,position: index)) ;
          } ,  
          child:
         Container(
            margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            width: 90.0,
            height: 110.0,
            decoration: myBoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                new Hero(
    tag: products[index],
    child: new Container(
      margin: EdgeInsets.all(2.0),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.all(new Radius.circular(3.0))
      ),
      constraints: BoxConstraints(
        maxHeight: 88.0
        ),
      height: 88.0,
      child:
      new Container(
        margin: EdgeInsets.all(2.0),
        child: new CircleImage(width: 90.0,height: 90.0,imageUrl: products[index]['ImageAdd'],)
      // CircleAvatar(
      //   radius: 85.0,
      //   child:
      //   CachedNetworkImage(
      //                                  placeholder: (context, url) => CircularProgressIndicator(),
      //                                   imageUrl:products[index]['ImageUrl'],
      //                                   fit: BoxFit.fill,
      //                                   errorWidget: (context,url,error) => NoImageAvatar(),
      //                                 )
      //   ),
      ),
    ),
      ),
    
  
                    //  ClipRRect(
                    //     borderRadius: BorderRadius.circular(2.0),

                    //     child:  CachedNetworkImage(
                    //                    placeholder: (context, url) => CircularProgressIndicator(),
                    //                     imageUrl:products[index]['ImageUrl'],
                    //                     fit: BoxFit.cover,
                    //                     errorWidget: (context,url,error) => Image.asset('assets/images/no_image.png'),
                    //                   )),//Image.asset(collections[index]['image'], fit: BoxFit.cover))
                SizedBox(height: 1.0,),
                
                Marquee(
                  direction: Axis.horizontal,
                  animationDuration: Duration(seconds: 10),
                  backDuration: Duration(milliseconds: 10000),
                  pauseDuration: Duration(milliseconds: 5000),
                  textDirection: TextDirection.rtl,
                  child:
                      Text( products[index]['Name'], 
                      softWrap: false,
                      overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600,fontSize: 13.0))),
                  
                  ),
                //scrollAxis: Axis.horizontal,),
                SizedBox(height: 1.0,),
                Text( products[index]['PriceB'], style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600,fontSize: 13.0))),

                //new ProductCategoryItem(context, new CategoryItem.map(categorys[index]), '',categorys[index]).buildCategoryItem(),
              ],
            )
         )
        );
      },
    //);
            //},
    ),
  );
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}



final List childTouch=imgList.map(
      (url) {
    return Container(
      margin: EdgeInsets.all(0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: 1000.0,
        ),
      ),
    );
  },
).toList();



final List childListView=imgList.map(
      (url) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: 100.0,
        ),
      ),
    );
  },
).toList();

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();


/*
CustomScrollView(
controller: _controller,
slivers: <Widget>[
SliverAppBar(
pinned: true,
expandedHeight: 250.0,
flexibleSpace: FlexibleSpaceBar(
title: Text("Demo",
style: const TextStyle(
fontSize: 10.0,
fontWeight: FontWeight.w900,
color: Colors.green,
)),
background: FlutterLogo(
size: 20.0,
colors: Colors.blue,
),
),
backgroundColor: clr,
),
SliverFixedExtentList(
itemExtent: 50.0,
delegate: SliverChildBuilderDelegate(
(BuildContext context, int index) {
return Container(
alignment: Alignment.center,
color: Colors.lightBlue[100 * (index % 9)],
child: Text('list item $index'),
);
},
childCount: 50,
),
),
],
),
),
),
*/



///////////////////////////
///////////////////////////
/*
new Container(
decoration: new BoxDecoration(
gradient: new LinearGradient(
begin: Alignment.topRight,
end: Alignment.bottomLeft,
stops: [0.1, 0.5, 0.7, 0.9],
colors: [
Colors.grey[50],
Colors.grey[50],
Colors.grey[50],
Colors.grey[50],
],
),
),
child: new Center(
child: new Column(

children: <Widget>[
CarouselSlider(
items: childTouch,
autoPlay: true,
viewportFraction: 0.9,
pauseAutoPlayOnTouch: Duration(seconds: 3),
enlargeCenterPage: true,
aspectRatio: 2.5,
onPageChanged: (index) {
setState(() {
_current = index;
});
},

),
HorizontalListView(
horizontal: false,
width:150,
height:250,
items: <Widget>[
new Row(
children: <Widget>[
new Container(
constraints: new BoxConstraints.expand(
height: 65.0,
width: 65.0
),

alignment: Alignment.center,
// padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
decoration: new BoxDecoration(
image: new DecorationImage(
image:  AssetImage("assets/images/best-1.png"),
fit: BoxFit.cover,
),
),

// child:
*/
/* Stack(
                        children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/items-1.png"),
                          fit: BoxFit.fill,
                        )
                        ,
                  new Positioned(*//*

child: Text(
"برترین ها",
style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),
)
// )
//   ]
)
]),
HorizontalListView(
items: childListView,
horizontal: true,
width:screenSize.width-10,
height:150,
),

new Row(
children: <Widget>[
new Container(
constraints: new BoxConstraints.expand(
height: 65.0,
width: 65.0
),
alignment: Alignment.center,
// padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
decoration: new BoxDecoration(
image: new DecorationImage(
image:  AssetImage("assets/images/tutorial-1.png"),
fit: BoxFit.cover,
),
),
),
// child:
*/
/* Stack(
                        children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/items-1.png"),
                          fit: BoxFit.fill,
                        )
                        ,
                  new Positioned(*//*

new Container(
constraints: new BoxConstraints.expand(
height: 65.0,
width: 65.0
),
alignment: Alignment.center,
// padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
decoration: new BoxDecoration(
*/
/*image: new DecorationImage(
                                    image:  AssetImage("assets/images/tutorial-1.png"),
                                    fit: BoxFit.cover,
                                  ),*//*

),

child:   new Text(
"آموزش ها",
style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),
)
// )
//   ]

),
])
,
new BorderedBox(
items: HorizontalListView(
items: childListView,
horizontal: true,
width:screenSize.width-10,
height:150,
),
),

]
),
]), //new CoachList(initialCoachs),
)
),*/
