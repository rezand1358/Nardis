// import 'dart:async';

// import 'package:nardis/bloc/dropdown_bloc/ValueProvider.dart';



// class DropDownChangedBlob<T> {


//   final changedController = StreamController();

//   Stream get getCount => changedController.stream;
//   WrapValueProvider<T> _value=new WrapValueProvider<T>();

//   void updateCount(T nVal) {
//     _value.newValue=nVal;
//     changedController.sink.add(_value.changedValue); // add whatever data we want into the Sink
//   }

//   void dispose() {
//     changedController.close(); // close our StreamController to avoid memory leak
//   }
// }

// final coachBloc = DropDownChangedBlob<Coach>();