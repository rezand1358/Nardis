// import 'package:flutter/material.dart';
// import 'package:healthy_style/components/CoachListItem.dart';
// import 'package:healthy_style/components/MyProgramsItem.dart';
// import 'package:healthy_style/data/fake_helper.dart';
// import 'package:healthy_style/models/fake/coach_model.dart';
// import 'package:healthy_style/models/viewmodel/myprograms_vm.dart';
// class ProgramsList extends StatelessWidget
// {
//    List<MyProgramsVM> myProgramsList;
//   final  int isDiet;
//   ProgramsList(this.myProgramsList,this.isDiet);

//   ListView _buildList(BuildContext context,int diet) {
//     if(diet==1)
//       {
//         myProgramsList=Helper.getFoodPrograms();
//       }
//     else if(diet==2)
//       {
//         myProgramsList=Helper.getExercisePrograms();
//       }
//     return new ListView.builder(
//       physics: BouncingScrollPhysics(),
//       itemCount: myProgramsList.length,
//       itemBuilder: (context, int) {
//         return new MyProgramsItem(myProgramsList[int],isDiet);
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return _buildList(context,isDiet);
//   }

// }