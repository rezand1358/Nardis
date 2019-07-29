// import 'package:flutter/material.dart';


// class RequestScreen extends StatefulWidget
// {

//   RequestScreen({Key key}) : super(key: key);

//   @override
//   _RequestState createState() {
//     // TODO: implement createState
//     return _RequestState();
//   }


// }

// class _RequestState extends State<RequestScreen> with TickerProviderStateMixin
// {

//   var animationStatus = 0;
//   Coach _value=new Coach(1,
//       "Reza",
//       "Naderi",
//       "1"
//       ,"Reza",
//       "123456",
//       "09121234567",
//       "0214587859",
//       "test@mail.com",
//       "1",
//       "10",
//       "rerttrtrtr",
//       "10101010",
//       "2030300405",
//       "",
//       "desc");

//   ValueChanged<Coach> onChanged;
//   AnimationController _loginButtonController;

//   ScrollController _controller;
//   List _coachs =
//   [new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"), new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc")];

//   List<DropdownMenuItem<Coach>> _dropDownMenuItems;
//   Coach _currentCoach;

//   List _spfs =
//   [new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc")];

//   List<DropdownMenuItem<Coach>> _dropDownMenuSPFItems;
//   Coach _currentSPF;

//   List _plevels =
//   [new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),
//   new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),];

//   List<DropdownMenuItem<Coach>> _dropDownMenuLevelItems;
//   Coach _currentLevel;

//   List _sportgoals =
//   [new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc"),new Coach(1,
//   "Reza",
//   "Naderi",
//   "1"
//   ,"Reza",
//   "123456",
//   "09121234567",
//   "0214587859",
//   "test@mail.com",
//   "1",
//   "10",
//   "rerttrtrtr",
//   "10101010",
//   "2030300405",
//   "",
//   "desc")];

//   List<DropdownMenuItem<Coach>> _dropDownMenuSportGoalsItems;
//   Coach _currentGoal;


//   Color clr = Colors.lightBlueAccent;
//   _scrollListener() {
//     if (_controller.offset > _controller.position.minScrollExtent &&
//         !_controller.position.outOfRange) {
//       setState(() {
//         clr = Colors.blueAccent;
//       });
//     }

//     if (_controller.offset <= _controller.position.minScrollExtent &&
//         !_controller.position.outOfRange) {
//       setState(() {
//         clr = Colors.lightBlueAccent;
//       });
//     }

//   }

//   Future<Null> _playAnimation() async {
//     try {
//       await _loginButtonController.forward();
//       await _loginButtonController.reverse();
//     } on TickerCanceled {}
//   }
//   Future<bool> _onWillPop() {
//     return showDialog(
//       context: context,
//       child: new AlertDialog(
//         title: new Text('از خروج مطمئن هستید؟'),
//         actions: <Widget>[
//           new FlatButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: new Text('خیر'),
//           ),
//           new FlatButton(
//             onPressed: () =>
//                 Navigator.pushReplacementNamed(context, "/home"),
//             child: new Text('بله'),
//           ),
//         ],
//       ),
//     ) ??
//         false;
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return new WillPopScope(
//         onWillPop: _onWillPop,
//         child: new Scaffold(
//             key: _scaffoldKey,
//             body:

//         StreamBuilder(
//         stream: coachBloc.getCount,
//         initialData: new WrapValueProvider<Coach>().newValue=_value,
//     builder: (context, snapshot) =>
//             Builder(
//                 builder: (BuildContext context) {

//                   return
//                     new Container(
//                       decoration: new BoxDecoration(
//                         //image: backgroundImage,
//                       ),
//                       child: new Container(
//                           decoration: new BoxDecoration(
//                               gradient: new LinearGradient(
//                                 colors: <Color>[
//                                   const Color.fromRGBO(162, 146, 199, 0.8),
//                                   const Color.fromRGBO(51, 51, 63, 0.9),
//                                 ],
//                                 stops: [0.2, 1.0],
//                                 begin: const FractionalOffset(0.0, 0.0),
//                                 end: const FractionalOffset(0.0, 1.0),
//                               )),
//                           child:
//                         new Column(
//                           children: <Widget>[
//                             new Container(
//                               height:MediaQuery.of(context).size.height-80.0,
//                               child:new ScrollPageWithAppBar(createContentList(snapshot.data),this._controller,clr,Translations.of(context).newRequest()),
//                         /*new ListView(
//                             padding: const EdgeInsets.all(0.0),
//                             children: <Widget>[
//                               new Stack(
//                                 alignment: AlignmentDirectional.bottomCenter,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: <Widget>[

//                                       new Header(image: tick,title: "درخواست جدید"),

//                                     ],
//                                   ),
//                         ],
//                       ),
//                       ]
//                       )*/
//                     ),
//                                   animationStatus == 0
//                                       ? new Padding(
//                                     padding: const EdgeInsets.only(bottom: 5.0),
//                                     child: new InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             animationStatus = 1;

//                                           });
//                                           _playAnimation();



//                                         },
//                                         child: new SendRequest(MediaQuery.of(context).size.width/2.5,48.0)),
//                                   )
//                                       : new StaggerAnimation(
//                                       buttonController:
//                                       _loginButtonController.view),
//                                // ],
//                              // ),
//                             ],
//                           ),
//                       ),
//                     );
//                 }
//             )
//         )
//         )

//     );
//   }

//   @override
//   void initState() {
//     super.initState();

//     _controller = ScrollController();
//     _controller.addListener(_scrollListener);

//     _loginButtonController = new AnimationController(
//         duration: new Duration(milliseconds: 3000), vsync: this);

//     _dropDownMenuItems = getDropDownMenuItems();
//     _currentCoach = _dropDownMenuItems[0].value;

//     _dropDownMenuSPFItems = getDropDownMenuSPFItems();
//     _currentSPF = _dropDownMenuSPFItems[0].value;

//     _dropDownMenuLevelItems = getDropDownMenuLevelItems();
//     _currentLevel= _dropDownMenuLevelItems[0].value;

//     _dropDownMenuSportGoalsItems = getDropDownMenuGoalItems();
//     _currentGoal = _dropDownMenuSportGoalsItems[0].value;

//   }

//   List<DropdownMenuItem<Coach>> getDropDownMenuItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _coachs) {
//       items.add(new DropdownMenuItem<Coach>(
//           value:  city,
//           child: new Text(city.firstname,
//           textAlign: TextAlign.center,
//           style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }

//   @override
//   void dispose() {
//     _loginButtonController.dispose();
//     super.dispose();
//   }
//   List<DropdownMenuItem<Coach>> getDropDownMenuSPFItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _spfs) {
//       items.add(new DropdownMenuItem<Coach>(
//           value: city,
//           child: new Text(city.firstname,
//             textAlign: TextAlign.center,
//             style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }

//   List<DropdownMenuItem<Coach>> getDropDownMenuLevelItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _plevels) {
//       items.add(new DropdownMenuItem<Coach>(
//           value: city,
//           child: new Text(city.firstname,
//             textAlign: TextAlign.center,
//             style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }
//   List<DropdownMenuItem<Coach>> getDropDownMenuGoalItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _sportgoals) {
//       items.add(new DropdownMenuItem<Coach>(
//           value:  city,
//           child: new Text(city.firstname,
//             textAlign: TextAlign.center,
//             style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }


//   void changedDropDownItem(Coach selectedCity) {
//     setState(() {
//       _value=selectedCity;
//     });
//   }

//   List<Widget> createContentList(Coach val)
//   {
//     ;
//     List<Widget> content=[
//       new DropDownListRequestContainer(_dropDownMenuItems,
//           _dropDownMenuSportGoalsItems,
//           _dropDownMenuLevelItems,
//           _dropDownMenuSPFItems,val),
//       new RequestContainer(_dropDownMenuItems,
//           _dropDownMenuSportGoalsItems,
//           _dropDownMenuLevelItems,
//           _dropDownMenuSPFItems,val),
//     ];
//     return content;
//   }
// }