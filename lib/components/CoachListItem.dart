// import 'package:flutter/material.dart';
// import 'package:healthy_style/models/viewmodel//coach_model.dart';
// import 'package:healthy_style/ui/coach_detail_page.dart';

// class CoachListItem extends StatefulWidget
// {

//   final Coach coach;


//   CoachListItem(this.coach);

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return new CoachListItemState(coach);
//   }

// }

// class CoachListItemState extends State<CoachListItem>
// {
//   Coach coach;
//   String renderUrl;
//   Size screenSize;

//   CoachListItemState(this.coach);


//   @override
//   void initState() {
//     super.initState();
//     renderCoachPic();
//   }


//   void renderCoachPic() async {
//    // await coach.getImageUrl();
//     setState(() {
//       renderUrl=coach.description;
//     });
//   }


// Widget get coachImage {
//   var coachAvatar = new Hero(
//     tag: coach,
//     child: new Container(
//       width: 100.0,
//       height: 100.0,
//       decoration: new BoxDecoration(
//         shape: BoxShape.circle,
//         image: new DecorationImage(
//           fit: BoxFit.cover,
//           image: new AssetImage(renderUrl),//new NetworkImage( ?? ''),
//         ),
//       ),
//     ),
//   );

//   var placeholder = new Container(
//       width: 100.0,
//       height: 100.0,
//       decoration: new BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: new LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Colors.black54, Colors.black, Colors.blueGrey[600]],
//         ),
//       ),
//       alignment: Alignment.center,
//       child: new Text(
//         'COACHGO',
//         textAlign: TextAlign.center,
//       ));

//   var crossFade = new AnimatedCrossFade(
//     firstChild: placeholder,
//     secondChild: coachAvatar,
//     crossFadeState: renderUrl == null
//         ? CrossFadeState.showFirst
//         : CrossFadeState.showSecond,
//     duration: new Duration(milliseconds: 1000),
//   );

//   return crossFade;
// }

// Widget get coachCard {
//   return new Positioned(
//     right: 0.0,
//     top: 0.0,
//     child: new Container(
//       margin: EdgeInsets.all(3.0),
//       width: screenSize.width-50.0,
//       height: 135.0,
//       child: new Card(
//         margin: EdgeInsets.only(top: 10.0, bottom: 18.0),
//         color: Color(0x100288D1),
//         elevation: 0.0,
//         shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(bottomRight: Radius.circular(70.0),bottomLeft: Radius.circular(3.0) ),
//         ),
//         child: new Padding(
//           padding: const EdgeInsets.only(
//             top: 2.0,
//             bottom: 0.0,
//             left: 2.0,
//           ),
//           child: new Container(
//               constraints: new BoxConstraints.expand(
//                 height: 210.0,
//               ),
//               padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
//               decoration: new BoxDecoration(

//               ),
//               child: new Stack(
//                 overflow: Overflow.visible,
//                 children: <Widget>[
//                   new Container(
//                     constraints: new BoxConstraints.expand(
//                       height: 180.0,
//                       width: 200.0,
//                     ),
//                     margin: EdgeInsets.only(right: 105.0,bottom: 2.0),
//                     child: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,

//                         children: <Widget>[
//                      new Text(widget.coach.firstname,
//                         style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12.0,
//                         )
//                     ),

//                    new Text(widget.coach.lastname,
//                         style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12.0,
//                         )

//                   ),
//                   new Text(widget.coach.description,
//                         style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12.0,
//                         )

//                   ),
//                    new Text('Title',
//                         style: new TextStyle(color: Colors.pink[200],
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12.0,
//                         )

//                   ),
//             ]
//                       ),

//                   ),
//                   /*new Positioned(
//                     left: 0.0,
//                     bottom: -20.0,
//                     child:*/
//                   new Positioned(
//                     right: 0.0,
//                     bottom: -25.0,
//                     child: new Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[

//                             new Icon(Icons.stars,color: Colors.greenAccent,size: 54.0,),
//                         new Text('پیشرفته',style: new TextStyle(color: Colors.blueAccent[100],fontSize: 14.0,fontWeight: FontWeight.bold),),
//                       ]
//                   )
//                   ),
//                   new Positioned(
//                     left: 0.0,
//                       bottom: -20.0,
//                     child: new Row(
//                       mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.end,

//                     children: <Widget>[

//                       /*new Stack(
//                     overflow: Overflow.visible ,
//                         children: <Widget>[*/

//                       Padding(
//                         padding: const EdgeInsets.all(0.0),
//                         child: new Text('20000',style: new TextStyle(color: Colors.pink[100],fontSize: 12.0,
//                           letterSpacing: 1.0,
//                           wordSpacing: 5.0,
//                         fontWeight: FontWeight.bold),),
//                       ),
//                       Padding(
//                         padding:
//                         EdgeInsets.only(
//                           left: 8.0,
//                           bottom: 0.0,
//                           right: 0.0,
//                           top: 0.0
//                         ),
//                         child: new Icon(Icons.monetization_on,color: Colors.blueAccent[200],size: 26.0,),
//                       ),

//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 8.0,
//                           bottom: 0.0,
//                           right: 8.0,
//                           top: 0.0
//                       ),
//                         child: new Icon(Icons.thumb_up,color: Colors.amber[200],size: 30.0,),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 0.0,
//                           bottom: 0.0,
//                           right: 8.0,
//                           top: 0.0
//                       ),
//                         child: new Icon(Icons.add_comment,color: Colors.black45,size: 30.0,),
//                       ),

//                   ],

//                  // ),

//                // ],
//               )



//         ),
//   ],
//       ),
//         ),
//         ),
//       ),
//     ),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   screenSize=MediaQuery.of(context).size;

//   return new InkWell(
//     onTap: () => showCoachDetailPage(context,coach),
//     child: new Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//       child: new Container(
//         padding: EdgeInsets.all(3.0),
//         margin: EdgeInsets.all(4.0),
//         height: 125.0,
//         child: new Stack(
//           overflow: Overflow.visible,
//           children: <Widget>[
//             coachCard,
//             new Positioned(top: -14.0,right: -10.0, child: coachImage),

//           ],
//         ),
//       ),
//     ),
//   );
// }

// showCoachDetailPage(BuildContext context,Coach ch) {
//   Navigator.pushReplacementNamed(context, '/coachdetail',arguments: coach);
// }

// }
