import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/search/index.dart';
import 'package:nardis/translation_strings.dart';

class SearchPage extends StatelessWidget {
  static const String routeName = "/search";

  @override
  Widget build(BuildContext context) {
    var _searchBloc = new SearchBloc();//BlocProvider.of<SearchBloc>(context);
    return  WillPopScope(
        onWillPop: () async {
      return Navigator.pushReplacementNamed(context, "/home");
    },
    child:
    Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
           icon:Icon( Icons.arrow_forward_ios),
          onPressed: ()=> 
              Navigator.pushReplacementNamed(context, '/home')
          ,)
        ],
        title: new Text(Translations.current.search()),
      ),
      body: BlocProvider<SearchBloc>(
        builder: (context) =>_searchBloc,
        child:  new SearchScreen(searchBloc:_searchBloc ),
      ),
    ),
    );
  }
}
