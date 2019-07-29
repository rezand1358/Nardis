// import 'package:flutter/material.dart';


// class RequestStepScreen extends StatefulWidget
// {

//   RequestStepScreen({Key key}) : super(key: key);

//   @override
//   _RequestStepState createState() {
//     // TODO: implement createState
//     return _RequestStepState();
//   }


// }

// class _RequestStepState extends State<RequestStepScreen> with TickerProviderStateMixin
// {

//   _pickFrontImage()
//   {
//    //_showModalBottomSheet();
//   }
//  _pickBackImage()
//   {
//    //_showModalBottomSheet(context);

//   }
//   _pickSideImage()
//   {
//    //_showModalBottomSheet(context);

//   }
//   var animationStatus = 0;
//   int currStep = 0;
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

//  static ValueChanged<Coach> onChanged;

//   AnimationController _loginButtonController;

//   ScrollController _controller;
//   List _coachs =
//   [new Coach(1,
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
//       "desc"), new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc")];

//   List<DropdownMenuItem<Coach>> _dropDownMenuItems;
//   Coach _currentCoach;

//  static List _spfs =
//   [new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc")];

//   List<DropdownMenuItem<Coach>> _dropDownMenuSPFItems;
//   Coach _currentSPF;

//   List _plevels =
//   [new Coach(1,
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
//       "desc"),
//     new Coach(1,
//         "Reza",
//         "Naderi",
//         "1"
//         ,"Reza",
//         "123456",
//         "09121234567",
//         "0214587859",
//         "test@mail.com",
//         "1",
//         "10",
//         "rerttrtrtr",
//         "10101010",
//         "2030300405",
//         "",
//         "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),];

//   List<DropdownMenuItem<Coach>> _dropDownMenuLevelItems;
//   Coach _currentLevel;

//   List _sportgoals =
//   [new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc"),new Coach(1,
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
//       "desc")];

//   List<DropdownMenuItem<Coach>> _dropDownMenuSportGoalsItems;
//   Coach _currentGoal;

//   List<DropdownMenuItem<Coach>> _getDropDownMenuSPFItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _spfs) {
//       items.add(new DropdownMenuItem<Coach>(
//         value: city,
//         child: new Text(city.firstname,
//           textAlign: TextAlign.center,
//           style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }

//   List<Step> requestSteps;
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

//             StreamBuilder(
//                 stream: coachBloc.getCount,
//                 initialData: new WrapValueProvider<Coach>().newValue=_value,
//                 builder: (context, snapshot) =>
//                     Builder(
//                         builder: (BuildContext context) {

//                           return
//                             new Container(
//                               decoration: new BoxDecoration(
//                                 //image: backgroundImage,
//                               ),
//                               child: new Container(
//                                 decoration: new BoxDecoration(
//                                  color: Color(0xfffafafa)
//                                     /*gradient: new LinearGradient(
//                                       colors: <Color>[
//                                         const Color.fromRGBO(162, 146, 199, 0.8),
//                                         const Color.fromRGBO(51, 51, 63, 0.9),
//                                       ],
//                                       stops: [0.2, 1.0],
//                                       begin: const FractionalOffset(0.0, 0.0),
//                                       end: const FractionalOffset(0.0, 1.0),
//                                     )*/),
//                                 child:
//                                 new Column(
//                                   children: <Widget>[
//                                     new Container(
//                                       height:MediaQuery.of(context).size.height-100.0,
//                                       child: new Stepper(
//                                         steps: requestSteps,
//                                         type: StepperType.vertical,
//                                         physics: BouncingScrollPhysics(),
//                                         currentStep: this.currStep,
//                                         onStepCancel: () {
//                                         setState(() {
//                                         if (currStep > 0) {
//                                         currStep = currStep - 1;
//                                         } else {
//                                         currStep = 0;
//                                         }
//                                         });
//                                         },
//                                         onStepContinue: () {
//                                           setState(() {
//                                             if (currStep < requestSteps.length - 1) {
//                                               currStep = currStep + 1;
//                                             } else {
//                                               currStep = 0;
//                                             }

//                                           });

//                                         },
//                                         onStepTapped: (step)
//                                         {
//                                           setState(() { currStep = step;});
//                                         },
//                                       ),
//                                       //new ScrollPageWithAppBar(createContentList(snapshot.data),this._controller,clr,Translations.of(context).newRequest()),

//                                     ),
//                                     animationStatus == 0
//                                         ? new Row(
//                                      crossAxisAlignment: CrossAxisAlignment.center,
//                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                      children: <Widget>[
//                                     new Padding(
//                                       padding: const EdgeInsets.only(bottom: 5.0),
//                                       child: new InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               animationStatus = 1;

//                                             });
//                                             _playAnimation();



//                                           },
//                                           child: new SendRequest(MediaQuery.of(context).size.width/4.5,48.0)),
//                                     ),
//                                       new BorderedButton(MediaQuery.of(context).size.width/4.5,48.0, Translations.current.exit(), null),
//                          ],
//                                     )
//                                         : new StaggerAnimation(
//                                         buttonController:
//                                         _loginButtonController.view),
//                                     // ],
//                                     // ),

//                                   ],
//                                 ),
//                               ),
//                             );
//                         }
//                     )
//             )
//         )

//     );
//   }

//   Step createStep1()
//   {
//     return new Step(title: const Text('رشته ورزشی'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new MyDropDownButton(_getDropDownMenuSPFItems(),onChanged),
//                     ],
//                   )),
//             ],
//           ),
//           // )],
//         ));
//   }

//   Step createStep2()
//   {
//    return new Step(title: const Text('هدف برنامه'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new MyDropDownButton(_getDropDownMenuSPFItems(),onChanged),
//                       /*new MyDropDownButton(_dropDownMenuGoalItems,onChanged),
//                       new MyDropDownButton(_dropDownMenuLevelItems,onChanged),
//                       new MyDropDownButton(_dropDownMenuSPFItems,onChanged),*/

//                     ],
//                   )),
//             ],
//           ),
//           // )],
//         ));
//   }

//   Step createStep3()
//   {
//     return new Step(title: const Text('مربی'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new MyDropDownButton(_getDropDownMenuSPFItems(),onChanged),
//                     ],
//                   )),
//             ],
//           ),
//           // )],
//         ));
//   }

//   Step createStep4()
//   {
//     return  new Step(title: const Text('جنسیت'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new MyDropDownButton(_getDropDownMenuSPFItems(),onChanged),
//                     ],
//                   )),
//             ],
//           ),
//           // )],
//         ));
//   }
//   Step createStep5()
//   {
//     return new Step(title: const Text('قد'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                        new TextFormField(
//                          keyboardType: TextInputType.number,
//                          autocorrect: false,
//                         onSaved: (String value){

//                         },
//                          maxLines: 1,

//                     decoration: new InputDecoration(
//                         labelText: 'لطفا قد خود را وارد کنید',
//                         hintText: Translations.current.height(),
//                         //filled: true,
//                         border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
//                         icon: const Icon(Icons.perm_identity,color: Colors.blueAccent,),
//                         labelStyle:
//                         new TextStyle(decorationStyle: TextDecorationStyle.solid),
//                   )
//                       ),

//                     ],
//                   )),
//             ],
//           ),
//         ));
//   }

//   Step createStep6()
//   {
//     return new Step(title: const Text('وزن'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new TextFormField(
//                           keyboardType: TextInputType.number,
//                           autocorrect: false,
//                           onSaved: (String value){

//                           },
//                           maxLines: 1,

//                           decoration: new InputDecoration(
//                             labelText: 'لطفا وزن خود را وارد کنید',
//                             hintText: Translations.current.weight(),
//                             //filled: true,
//                             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
//                             icon: const Icon(Icons.line_weight,color: Colors.blueAccent,),
//                             labelStyle:
//                             new TextStyle(decorationStyle: TextDecorationStyle.solid),
//                           )
//                       ),

//                     ],
//                   ),

//               ),
//             ],
//           ),
//         ));
//   }
//   Step createStep7(){
//     return new Step(title: const Text('تاریخ تولد'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new TextFormField(
//                           keyboardType: TextInputType.number,
//                           autocorrect: false,
//                           onSaved: (String value){

//                           },
//                           maxLines: 1,

//                           decoration: new InputDecoration(
//                             labelText: 'لطفا تاریخ تولد را وارد کنید',
//                             //hintText: Translations.current.(),
//                             //filled: true,
//                             border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
//                             icon: const Icon(Icons.date_range,color: Colors.blueAccent,),
//                             labelStyle:
//                             new TextStyle(decorationStyle: TextDecorationStyle.solid),
//                           )
//                       ),

//                     ],
//                   )),
//             ],
//           ),
//         ));
//   }
//   Step createStep8()
//   {
//     return new Step(title: const Text('تصاویر'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[

//                       new BorderedButton(120.0,48.0,Translations.current.frontImage(),_pickFrontImage),

//                       new BorderedButton(120.0,48.0,Translations.current.backImage(),_pickBackImage),

//                       new BorderedButton(120.0,48.0,Translations.current.sideImage(),_pickSideImage),


//                     ],
//                   )),
//             ],
//           ),
//           // )],
//         ));
//   }

//   Step createStep9()
//   {
//     return new Step(title: const Text('اطلاعات تکمیلی'),
//         content: new Container(
//           margin: new EdgeInsets.symmetric(horizontal: 20.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               new Form(
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       new MyDropDownButton(_getDropDownMenuSPFItems(),onChanged),
//                       /*new MyDropDownButton(_dropDownMenuGoalItems,onChanged),
//                       new MyDropDownButton(_dropDownMenuLevelItems,onChanged),
//                       new MyDropDownButton(_dropDownMenuSPFItems,onChanged),*/

//                     ],
//                   )),
//             ],
//           ),
//           // )],
//         ));
//   }
//   @override
//   void initState() {
//     super.initState();

//     requestSteps=[
//       createStep1(),
//       createStep2(),
//       createStep3(),
//     createStep4(),
//     createStep5(),
//     createStep6(),
//     createStep7(),
//     createStep8(),
//       createStep9(),
//     ];


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
//         value:  city,
//         child: new Text(city.firstname,
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
//         value: city,
//         child: new Text(city.firstname,
//           textAlign: TextAlign.center,
//           style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }

//   List<DropdownMenuItem<Coach>> getDropDownMenuLevelItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _plevels) {
//       items.add(new DropdownMenuItem<Coach>(
//         value: city,
//         child: new Text(city.firstname,
//           textAlign: TextAlign.center,
//           style: new TextStyle(color: Colors.redAccent),),
//       ));
//     }
//     return items;
//   }
//   List<DropdownMenuItem<Coach>> getDropDownMenuGoalItems() {
//     List<DropdownMenuItem<Coach>> items = new List();
//     for (Coach city in _sportgoals) {
//       items.add(new DropdownMenuItem<Coach>(
//         value:  city,
//         child: new Text(city.firstname,
//           textAlign: TextAlign.center,
//           style: new TextStyle(color: Colors.redAccent),),
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

//  _showModalBottomSheet(BuildContext context) {
//   showModalBottomSheet<void>(context: context,
//       builder: (BuildContext context) {
//        return
//         new Container(
//          height: 350.0,
//          color: Colors.transparent,
//          child: new Container(
//           decoration: new BoxDecoration(
//               color: Colors.white,
//               borderRadius: new BorderRadius.only(
//                   topLeft: const Radius.circular(10.0),
//                   topRight: const Radius.circular(10.0))),
//           child:
//             new UploadImage()
//          ),
//         );

//       });
//  }
// }