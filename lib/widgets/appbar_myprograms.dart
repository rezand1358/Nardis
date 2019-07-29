

import 'package:flutter/material.dart';
import 'package:nardis/translation_strings.dart';


class AppBarMyProgramsCollaps extends StatelessWidget {

  List contents;
  ScrollController _controller;
  Color clr;
  static Size screenSize;

  AppBarMyProgramsCollaps(this.contents, this._controller, this.clr);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          elevation: 0.0,
          leading: new IconButton(
              icon: new Icon(Icons.info, color: Colors.white,),
              onPressed: () {

              }
          ),
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(Translations.of(context).title(),
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                )),
            // background: Colors.blueAccent,
            collapseMode: CollapseMode.parallax,
          ),
          backgroundColor: clr,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, pos) => _buildRows(context,pos),
              childCount:1,


            )

        ),

      ],
    );

  }



  Widget _buildRows(BuildContext context,int pos)
  {
    screenSize = MediaQuery
        .of(context)
        .size;
    //List scrollList=createScrollContents(context);
    return  contents[pos];

  }
}