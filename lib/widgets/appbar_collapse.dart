

import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/search/customer_search_delegate.dart';
import 'package:nardis/bloc/shopcart/shoppingcart.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/home/home.dart';



class AppBarCollaps extends StatelessWidget {

  ScrollController _controller;
  Color clr;
  static Size screenSize;
  List<dynamic> categorys=new List();
  List<CategoryItem> items=new List();
  List menus=new List();
  AppBarCollaps(this._controller, this.clr,this.menus)
  {
    categorys=repository.getListOfCategory();
   items= categorys.map((item) =>
    new CategoryItem(item.name, item.imageAdd,item.code,item.name,SoapOpersConstants.CATEGORY)).toList();
  }

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[

        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          elevation: 1.0,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.check_circle_outline, color: Colors.white,),
                onPressed: () {

                }
            ),
        new Align(
          alignment: Alignment.centerRight,
          child:
          new Text(repository.topMessage,style: TextStyle(fontSize: 14.0,color: Colors.white),)
        ),
          ],
          leading:
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),


          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title:StreamBuilder(
        stream:
            BlocProvider.of<GlobalBloc>(context).shoppingCartBloc.cartStream,
        initialData: ShoppingCart(),
        builder: (context, snapshot) {
          double amount=0;
          if (snapshot.hasData) {
            if (snapshot.data is ShoppingCart) {
              amount = snapshot.data.priceNet;
            }
          }
           return  Text( (amount==null || amount==0) ? "" : Translations.current.totalsum()+" "+ amount.toString(),
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ));
        },),
           // background: Colors.blueAccent,
            collapseMode: CollapseMode.parallax,
          ),
          backgroundColor: clr,
        ),
        /*SliverFloatingBar(
          backgroundColor: Colors.blueAccent[100],
          trailing: CircleAvatar(
            child: Text("NS"),
          ),
          floating: true,
          pinned: false,
          elevation: 1.5,
          leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
          snap: true,
          title: Text(Translations.current.search()),
          automaticallyImplyLeading: true,
        ),*/
        SliverList(

            delegate: SliverChildBuilderDelegate(
        (context, pos) => _buildRows(menus,context,pos),
                childCount:menus.length,


            )

        ),

      ],
    );

  }

  List createScrollContents(BuildContext context) {
    final List scrollContents = [
      /*Container(
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
                      viewportFraction: 1.0,
                      pauseAutoPlayOnTouch: Duration(seconds: 3),
                      enlargeCenterPage: false,
                      aspectRatio: 2.0,
                      autoPlayCurve: Curves.easeIn,
                      *//*onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },*//*
                    )
                  ]
              )
          )
      ),*/
      Container(
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

        child:
        new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.adjust, size: 35.0, color: Colors.pink),

            Align(
                alignment: Alignment.centerRight,
               child: Text(
                Translations.of(context).product(),
                style: TextStyle(color: Colors.pink,
                    fontSize: 15,

                    fontWeight: FontWeight.w400),

            )
            )
            ]
        ),

      ),
      buildCollectionsRow(items.map((item) =>
    item.toMap(item)).toList())
      /*Container(
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

          child:
          HorizontalListView(
            items: childListView,
            horizontal: true,
            width: 150,
            height: 150,
          )

      )*/,
      Container(
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

        child:
        new Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Icon(Icons.adjust, size: 35.0, color: Colors.pink),
        Align(
            alignment: Alignment.center,
              child:
              new Text(
                Translations.of(context).product(),
                style: TextStyle(color: Colors.pink,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )
        )
            ]
        ),

      ),
      buildCollectionsRow(items.map((item) =>
    item.toMap(item)).toList())
      /*Container(
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
                    HorizontalListView(
                      items: childListView,
                      horizontal: true,
                      width: 150,
                      height: 150,
                    )
                  ]
              )
          )
      )*/
    ];
    return scrollContents;
  }

  Widget _buildRows(List menues, BuildContext context,int pos)
  {
     screenSize = MediaQuery
        .of(context)
        .size;
    List scrollList=menues;//createScrollContents(context);
   return  scrollList[pos];
  /* break;
      case 2:
        return
HorizontalListView(
items: childListView,
horizontal: true,
width:screenSize.width-10,
height:150,
);
        break;

    case 3:
 return HorizontalListView(
   items: childListView,
   horizontal: true,
   width:screenSize.width-10,
   height:150,
 );
  }*/
  }
}


class CategoryItem {
  String title;
  String image;
  String code;
  String catname='';
  String cattype='';
CategoryItem(this.title,this.image,this.code,this.catname,this.cattype);

CategoryItem.map(Map<String, dynamic> obj)
 {


    this.title=obj["title"];
    this.image=obj["image"];
    this.code=obj['code'];
    this.catname=obj['catname'];
    this.cattype=obj['cattype'];
 }

 Map<String, dynamic> toMap(CategoryItem item) {
    var map = new Map<String, dynamic>();
    map["title"]=this.title;
    map["image"]=this.image;
    map['code']=this.code;
    map['catname']=this.catname;
    map['cattype']=this.cattype;
    return map;
  }

  Map<String, dynamic> toSubMap(CategoryItem item) {
    var map = new Map<String, dynamic>();
    map["title"]=this.title;
    map["image"]=this.image;
    map['code']=this.code;
    map['catname']=this.catname;
    map['cattype']=this.cattype;
    return map;
  }

}
