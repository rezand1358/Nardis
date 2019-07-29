// import 'package:flutter/material.dart';
// import 'package:nardis/components/DropDownButton.dart';

// import './InputFields.dart';

// class DropDownListRequestContainer extends StatelessWidget {

//   List _dropDownMenuCoachItems;
//   List _dropDownMenuGoalItems;
//   List _dropDownMenuSPFItems;
//   List _dropDownMenuLevelItems;

//   Coach onChanged;

//   double width=0.0;

//   DropDownListRequestContainer(this._dropDownMenuCoachItems, this._dropDownMenuGoalItems,
//       this._dropDownMenuSPFItems, this._dropDownMenuLevelItems, this.onChanged);

//   @override
//   Widget build(BuildContext context) {

//     width=MediaQuery.of(context).size.width-40.0;
//     return
//       /*Builder(
//           builder: (BuildContext context) {*/
//            // return
//               /* new CustomScrollView(
//               scrollDirection: Axis.vertical,
//               slivers: <Widget>[*/
//               new Container(
//                 margin: new EdgeInsets.symmetric(horizontal: 20.0),
//                 child: new Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     new Form(
//                         child: new Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                               new MyDropDownButton(_dropDownMenuCoachItems,onChanged),
//                               new MyDropDownButton(_dropDownMenuGoalItems,onChanged),
//                               new MyDropDownButton(_dropDownMenuLevelItems,onChanged),
//                               new MyDropDownButton(_dropDownMenuSPFItems,onChanged),

//                           ],
//                         )),
//                   ],
//                 ),
//                 // )],
//               );
//          // }

//       //);


//   }



// }
