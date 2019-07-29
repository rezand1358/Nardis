
// import 'package:flutter/material.dart';


// class MyDropDownButton extends StatefulWidget{
//   List _dropDownMenuItems;
//   final onChanged;

//   MyDropDownButton(this._dropDownMenuItems,this.onChanged);

//   @override
//   _MyDropDownButtonState createState() {
//     // TODO: implement createState
//     return _MyDropDownButtonState(null);
//   }

// }
// class _MyDropDownButtonState extends State<MyDropDownButton>
// {
//   //List _dropDownMenuItems;
//   double width=0.0;
//  // WrapValueProvider provider=WrapValueProvider();
//   _MyDropDownButtonState(this.onChanged);

  
//   final onChanged;


//   @override
//   void initState() {
//   _value=  widget._dropDownMenuItems[0].value;
//   }

//   @override
//   Widget build(BuildContext context) {

//     width=MediaQuery.of(context).size.width-40.0;

//       //_value=_dropDownMenuItems[0].value;
//     return
//   /*StreamBuilder(
//     stream: coachBloc.getCount,
//       initialData: new WrapValueProvider<Coach>().newValue=_value,
//       builder: (context, snapshot) =>*/
//       new Container(

//         padding: new EdgeInsets.all(5.0),
//         margin: new EdgeInsets.all(5.0),
//         height: 48.0,
//         width:width ,
//         decoration: new BoxDecoration(
//             border: new Border.all(color: Colors.white,width: 0.5),
//             borderRadius: new BorderRadius.all(Radius.circular(2.0)),
//             gradient: new LinearGradient(
//               colors: <Color>[
//                 const Color.fromRGBO(162, 146, 199, 0.8),
//                 const Color.fromRGBO(51, 51, 63, 0.9),
//               ],
//               stops: [0.2, 1.0],
//               begin: const FractionalOffset(0.0, 0.0),
//               end: const FractionalOffset(0.0, 0.0),
//             )),
//         child:

//           new DropdownButton(
//             isExpanded: true,
//             iconSize: 18.0,
//             style: new TextStyle(color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16.0,),
//             elevation: 0,
//             value: _value,
//             items: widget._dropDownMenuItems,
//             onChanged: (Coach data) {
//               _value = data;
//              // onChanged(data);
//               setNewValue(data);

//             },
//           ),
//      // ),
//       );
//   }


//   void setNewValue(Coach data)
//   {
//     setState(() {
//     _value=data;
//     });
//     //coachBloc.updateCount(data);
//   }
// }
