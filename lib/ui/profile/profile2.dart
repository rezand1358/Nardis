import 'package:flutter/material.dart';
import 'package:nardis/components/CircleImage.dart';
import 'package:nardis/components/GMenu.dart';
import 'package:nardis/data/database_helper.dart';
import 'package:nardis/data/fake_helper.dart';
import 'package:nardis/models/user.dart';
import 'package:nardis/translation_strings.dart';


class ProfileTwoPage extends StatelessWidget {
  List<Map> collections =new List();

  User user;
  User user2;
  String fullName="";

loaduser(Future<User> usr) async
{
    user2=await usr ; 
    fullName=user2.userName;
}
  ProfileTwoPage(this.user)
  {
    // loaduser(this.user);
  }

  @override
  Widget build(BuildContext context) {
  
    return new WillPopScope(
        onWillPop: () async {
      return Navigator.pushReplacementNamed(context, "/home");
    },
    child:
      Scaffold(
        body: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade300, Colors.indigo.shade500]
              ),
            ),
          ),
          ListView.builder(
            physics:new PageScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: _mainListBuilder,
          ),
          new Positioned(
            left: 0.0,
            bottom: 0.0,
            child:
            new Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(10.0),
              child:
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, "/home");
              },
              child: GMenu(),
            ),
          ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if(index==0) return _buildHeader(context);
    if(index==1) return _buildSectionHeader(context);
    //if(index==2) return _buildCollectionsRow();
    if(index==3) return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
      child: Text("",
        style: Theme.of(context).textTheme.title
      )
    );
    //return _buildListItem();
  }

  Widget _buildListItem() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Image.asset('assets/images/user2.png', fit: BoxFit.fill),
      ),
    );
  }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(Translations.of(context).profile(), style: Theme.of(context).textTheme.title,),
          FlatButton(
            onPressed: (){ Navigator.pushReplacementNamed(context, "/home"); },
            child: Text(Translations.of(context).exit(), style: TextStyle(color: Colors.blue),),
          )
        ],
      ),
    );
  }

  Container _buildCollectionsRow() {
    return Container(
      color: Colors.white,
      height: 280.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: collections.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            width: 150.0,
            height: 280.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(collections[index]['image'], fit: BoxFit.cover))
                ),
                SizedBox(height: 5.0,),
                Text(collections[index]['title'], style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600)))
              ],
            )
          );
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      height: 380.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  // SizedBox(height: 50.0,),
                  // Text(fullName, style: Theme.of(context).textTheme.title,),
                  // SizedBox(height: 5.0,),
                  // Text(user2!=null ? user2.mobile : ""),
                  // SizedBox(height: 5.0,),
                  // Text(user2!=null ? user2.code : ""),
                  // SizedBox(height: 16.0,),
                  SizedBox(height: 80.0,),
                  Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(user!=null ? user.mobile : "موبایل",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: Text(Translations.of(context).mobile(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0,color: Colors.redAccent) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(user!=null ? user.code : 'کد کاربری',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(Translations.current.usercode().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0) ),
                          ),
                        ),
                       
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ClipOval(
              
                child: new Container(
                  width: 120.0,
                  height: 120.0,
                child:
                new Image.asset( 'assets/images/user.jpg',),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}