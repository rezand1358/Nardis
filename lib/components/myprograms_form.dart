// import 'package:flutter/material.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// import 'package:after_layout/after_layout.dart';


// class MyPrograms extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {


//     // TODO: implement build
//     return new Provider(
//     initialValue: 0,
//     child:
//       ProgramsPage(),
//     );

//   }
// }

// class ProgramsPage extends StatefulWidget {

//   @override
//   ProgramsPageState createState() {
//     return ProgramsPageState();
//   }
// }

// class ProgramsPageState extends State<ProgramsPage>
//     with SingleTickerProviderStateMixin ,
//         AfterLayoutMixin<ProgramsPage>{
//   int _index = 0;
//  // TabController _controller;
//   ScrollController _controller;
//   //Color clr;
//   int selectedPos = 0;
//   double height;
//   double width;
//   static double bottomNavBarHeight = 60;

//   static List<TabItem> tabItems=List.of([
//   new TabItem(Icons.home, Translations.current.home(), Colors.blue),
//   new TabItem(Icons.fastfood,Translations.current.foodProgram() , Colors.orange),
//   new TabItem(Icons.transfer_within_a_station,Translations.current.sportProgram() , Colors.red),
//   new TabItem(Icons.search,Translations.current.search() , Colors.cyan),
//   ]);

//  static CircularBottomNavigationController _navigationController;

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
//   List<String> pages(BuildContext context)  {
//     List<String> pags=[
//     'ورزشی',
//     'جستجو',
//     'رزیمی',
//       'خانه',

//   ];
//     return pags;
//   }

//   @override
//   void initState() {
//     super.initState();
//     /*_controller = TabController(
//         vsync: this,
//         length: 4,
//       initialIndex: _index
//     );*/
//     _controller = ScrollController();
//     _controller.addListener(_scrollListener);
//     _navigationController = new CircularBottomNavigationController(selectedPos);
//   }


//   @override
//   void dispose() {
//     super.dispose();
//     _navigationController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//    final int _diet=Provider.of(context).value;
//     return Scaffold(
//       body:Container(
//         constraints: new BoxConstraints.expand(
//           height: MediaQuery.of(context).size.height-100,
//         ),
//         padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 0.0),
//         decoration: new BoxDecoration(

//         ),
//         child:
//         Stack(
//           overflow: Overflow.visible,
//           children: <Widget>[
//             /* new Positioned(
//             top: 10.0,
//           right: 0.0 ,
//             child:
//           Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
//     ),*/
//             /*new Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                  CircularBottomNavigation(
//                   tabItems,
//                   controller: _navigationController,
//                   barHeight: bottomNavBarHeight,
//                   circleStrokeWidth: 2.5,
//                   barBackgroundColor: Color(0xfffafafa),
//                   animationDuration: Duration(milliseconds: 500),
//                   selectedCallback: (int selectedPos) {
//                      doActionOnTabSelected();
//                   },
//                 ),*/

//               Align(alignment: Alignment.topCenter, child: bottomNav(context)),


//               Align(alignment: Alignment.bottomCenter,
//                 child:
//                 Padding(padding: EdgeInsets.only(top: 85.0),
//               child:
//               bodyContainer(_diet),
//                 ),
//               ),
//         ],
//             ),

//          // ],
//         //),
//       ),
//       //AppBarMyProgramsCollaps(scrollContents,_controller,clr),


//       /*TabBarView(
//         controller: _controller,
//         children: pages(context).map((title) {
//           return Center(
//             child: Text(
//               '$title',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 52),
//             ),
//           );
//         }).toList(),
//       ),*/
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(Translations.of(context).program()),
//         actions: <Widget>[
//           Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ],
//       ),
//       floatingActionButton: GestureDetector(
//         onTap: (){
//           Navigator.push(context,
//           MaterialPageRoute(
//             fullscreenDialog: true,
//             builder: (c)=> GDialog()
//           )
//           );
//         },
//           child: GMenu(),
//       ),
//       /*bottomNavigationBar: BottomNavyBar(
//         onItemSelected: (index) => setState(() {
//             _index = index;
//             _controller.animateTo(_index);
//         }),
//         items: [
//           BottomNavyBarItem(
//             icon: Icon(Icons.accessibility_new),
//             title: Text(Translations.of(context).sportProgram()),
//             activeColor: Colors.red,
//           ),
//           BottomNavyBarItem(
//               icon: Icon(Icons.search),
//               title: Text(Translations.of(context).search()),
//               activeColor: Colors.green
//           ),
//           BottomNavyBarItem(
//               icon: Icon(Icons.fastfood),
//               title: Text(Translations.of(context).foodProgram()),
//               activeColor: Colors.deepPurple
//           ),
//           BottomNavyBarItem(
//               icon: Icon(Icons.home),
//               title: Text(Translations.of(context).home()),
//               activeColor: Colors.blue
//           ),
//         ],
//       ),*/

//     );
//   }


//    void doActionOnTabSelected(BuildContext context)
//   {
//     setState(() {
//       this.selectedPos = selectedPos;
//       //print(_navigationController.value);
//       doSelectedTab(context, selectedPos);
//     });
//   }
//   Widget bodyContainer(int diet) {
//    // Color selectedColor = tabItems[selectedPos].color;
//     Widget page;

//     switch (diet) {
//       case 0:
//         page = new ProgramsScreen( 1);
//         break;
//       case 1:
//         page = new ProgramsScreen( 1);
//         break;
//       case 2:
//         page=new ProgramsScreen(2);
//         break;
//       case 3:
//         page=new ProgramsScreen(1);
//         break;
//     }

//     return GestureDetector(
//       child: Container(
//           height: MediaQuery.of(context).size.height-140.0,
//           padding: EdgeInsets.only(top: 15.0),
//           child: page,

//       ),
//       onTap: () {
//         if (_navigationController.value == tabItems.length - 1) {
//           _navigationController.value = 0;
//         } else {
//           _navigationController.value++;
//         }
//       },
//     );
//   }

//   Widget bottomNav(BuildContext context) {
//     return
//       CircularBottomNavigation(
//       tabItems,
//       controller: _navigationController,
//       barHeight: bottomNavBarHeight,
//       circleStrokeWidth: 2.5,
//       barBackgroundColor: Color(0xfffafafa),
//       animationDuration: Duration(milliseconds: 1000),
//       selectedCallback: (int selectedPos) {
//         setState(() {
//           this.selectedPos = selectedPos;
//           //print(_navigationController.value);
//           doSelectedTab(context, selectedPos);
//         });
//       },
//     );
//   }

//   @override
//   void afterFirstLayout(BuildContext context) {
//     // TODO: implement afterFirstLayout
//    tabItems = List.of([
//     new TabItem(Icons.home, Translations.of(context).home(), Colors.blue),
//     new TabItem(Icons.fastfood, Translations.of(context).foodProgram(), Colors.orange),
//     new TabItem(Icons.transfer_within_a_station, Translations.of(context).sportProgram(), Colors.red),
//     new TabItem(Icons.search, Translations.of(context).search(), Colors.cyan),
//     ]);
//   }

//   void doSelectedTab(BuildContext context, int selectedPos)
//   {

//     Provider.of(context).value=selectedPos;

//   }
// }



// class GMenu extends StatefulWidget {
//   @override
//   _GMenuState createState() => _GMenuState();
// }
// class _GMenuState extends State<GMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(50)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 15
//           )
//         ]
//       ),
//       child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
//         child: Column(
//           children: <Widget>[
//             Hero(
//               tag: Translations.of(context).sportProgram(),
//               child: Container(
//                 color: Colors.orange,
//                 width: double.maxFinite,
//                 height: 5,
//               ),
//             ),
//             Hero(
//               tag: Translations.of(context).search(),
//               child: Container(
//                 margin: EdgeInsets.only(top: 3, bottom: 3),
//                 color: Colors.blue,
//                 width: double.maxFinite,
//                 height: 5,
//               ),
//             ),
//             Hero(
//               tag: Translations.of(context).foodProgram(),
//               child: Container(
//                 color: Colors.green,
//                 width: double.maxFinite,
//                 height: 5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GDialog extends StatefulWidget {
//   @override
//   _GDialogState createState() => _GDialogState();
// }

// class _GDialogState extends State<GDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           height: 200,
//           width: 300,
//           child: Column(
//             children: <Widget>[
//               Hero(
//                 tag: Translations.of(context).sportProgram(),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Container(
//                     color: Colors.orange,
//                     width: double.maxFinite,
//                     height: 50,
//                     child: Center(
//                       child: Text(Translations.of(context).sportProgram()),
//                     ),
//                   ),
//                 ),
//               ),
//               Hero(
//                 tag: Translations.of(context).search(),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Container(
//                     margin: EdgeInsets.only(top: 20, bottom: 20),
//                     color: Colors.blue,
//                     width: double.maxFinite,
//                     height: 50,
//                     child: Center(
//                       child: Text(Translations.of(context).search()),
//                     ),
//                   ),
//                 ),
//               ),
//               Hero(
//                 tag: Translations.of(context).foodProgram(),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Container(
//                     color: Colors.green,
//                     width: double.maxFinite,
//                     height: 50,
//                     child: Center(
//                       child: Text(Translations.of(context).foodProgram()),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
