// import 'package:flutter/material.dart';
// import 'package:healthy_style/components/CoachListItem.dart';
// import 'package:healthy_style/data/fake_helper.dart';
// import 'package:healthy_style/models/fake/coach_model.dart';
// import 'package:healthy_style/notifiers/Provider.dart';
// import 'package:healthy_style/ui/home/coach_list.dart';
// import 'package:healthy_style/ui/program/programs_list.dart';
// import 'package:healthy_style/widgets/curved_navigation_bar.dart';
// import 'package:healthy_style/widgets/drawer/menu_page.dart';
// import 'package:healthy_style/widgets/drawer/zoom_scaffold.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/animation.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

// class ProgramsScreen extends StatefulWidget {
//    final int isDiet;
//    ProgramsScreen(this.isDiet);// : super(key: key);

//   @override
//   ProgramsScreenState createState() => new ProgramsScreenState( );
// }

// class ProgramsScreenState extends State<ProgramsScreen> with TickerProviderStateMixin {
//   //final int isDiet;
//   //ProgramsScreenState(this.isDiet);

//   Animation<double> containerGrowAnimation;
//   AnimationController _screenController;
//   AnimationController _buttonController;
//   Animation<double> buttonGrowAnimation;
//   Animation<double> listTileWidth;
//   Animation<Alignment> listSlideAnimation;
//   Animation<Alignment> buttonSwingAnimation;
//   Animation<EdgeInsets> listSlidePosition;
//   Animation<Color> fadeScreenAnimation;
//   var animateStatus = 0;






//   List<String> months = [
//     "January",
//     "February",
//     "March",
//     "April",
//     "May",
//     "June",
//     "July",
//     "August",
//     "September",
//     "October",
//     "November",
//     "December"
//   ];
//   String month = new DateFormat.MMMM().format(
//     new DateTime.now(),
//   );
//   int index = new DateTime.now().month;
//   void _selectforward() {
//     if (index < 12)
//       setState(() {
//         ++index;
//         month = months[index - 1];
//       });
//   }

//   void _selectbackward() {
//     if (index > 1)
//       setState(() {
//         --index;
//         month = months[index - 1];
//       });
//   }

//   @override
//   void initState() {
//     super.initState();

//     _screenController = new AnimationController(
//         duration: new Duration(milliseconds: 2000), vsync: this);
//     _buttonController = new AnimationController(
//         duration: new Duration(milliseconds: 1500), vsync: this);

//     fadeScreenAnimation = new ColorTween(
//       begin: const Color.fromRGBO(247, 64, 106, 1.0),
//       end: const Color.fromRGBO(247, 64, 106, 0.0),
//     ).animate(
//       new CurvedAnimation(
//         parent: _screenController,
//         curve: Curves.ease,
//       ),
//     );
//     containerGrowAnimation = new CurvedAnimation(
//       parent: _screenController,
//       curve: Curves.easeIn,
//     );

//     buttonGrowAnimation = new CurvedAnimation(
//       parent: _screenController,
//       curve: Curves.easeOut,
//     );
//     containerGrowAnimation.addListener(() {
//       this.setState(() {});
//     });
//     containerGrowAnimation.addStatusListener((AnimationStatus status) {});

//     listTileWidth = new Tween<double>(
//       begin: 1000.0,
//       end: 600.0,
//     ).animate(
//       new CurvedAnimation(
//         parent: _screenController,
//         curve: new Interval(
//           0.225,
//           0.600,
//           curve: Curves.bounceIn,
//         ),
//       ),
//     );

//     listSlideAnimation = new AlignmentTween(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//     ).animate(
//       new CurvedAnimation(
//         parent: _screenController,
//         curve: new Interval(
//           0.325,
//           0.700,
//           curve: Curves.ease,
//         ),
//       ),
//     );
//     buttonSwingAnimation = new AlignmentTween(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomRight,
//     ).animate(
//       new CurvedAnimation(
//         parent: _screenController,
//         curve: new Interval(
//           0.225,
//           0.600,
//           curve: Curves.ease,
//         ),
//       ),
//     );
//     listSlidePosition = new EdgeInsetsTween(
//       begin: const EdgeInsets.only(bottom: 16.0),
//       end: const EdgeInsets.only(bottom: 80.0),
//     ).animate(
//       new CurvedAnimation(
//         parent: _screenController,
//         curve: new Interval(
//           0.325,
//           0.800,
//           curve: Curves.ease,
//         ),
//       ),
//     );
//     _screenController.forward();
//   }

//   @override
//   void dispose() {
//     _screenController.dispose();
//     _buttonController.dispose();
//     super.dispose();
//   }

//   Future<Null> _playAnimation() async {
//     try {
//       await _buttonController.forward();
//     } on TickerCanceled {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     timeDilation = 0.3;
//     Size screenSize = MediaQuery.of(context).size;

//     return /*Provider(
//         initialValue: isDiet,
//       child:*/
//       new WillPopScope(
//         onWillPop: () async {
//           return true;
//         },
//         child:  new Center(
//                   child: loadPrograms(),
//                   //new ProgramsList(Helper.getExercisePrograms(),false),
//                 )
//        // ),
//     );
//   }

//   Widget loadPrograms()
//   {
//    return new ProgramsList( Helper.getFoodPrograms(),widget.isDiet);
//   }
//   void onNavButtonTap(int index)
//   {
//     if(index==0)
//     {

//     }
//   }


// }
