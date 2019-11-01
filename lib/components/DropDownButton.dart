
import 'package:flutter/material.dart';
import 'package:nardis/bloc/values/notify_value.dart';


class  MyDropDownButton<T> extends StatefulWidget{
  List<DropdownMenuItem<T>> _dropDownMenuItems;
  final onChangedValue;
  T value;
  NotyBloc notyBloc;
  MyDropDownButton(this._dropDownMenuItems,this.onChangedValue,this.notyBloc);

  @override
  _MyDropDownButtonState createState() {
    // TODO: implement createState
    return _MyDropDownButtonState<T>();
  }

}
class _MyDropDownButtonState<T> extends State<MyDropDownButton>
{
  //List _dropDownMenuItems;
  double width=0.0;
 // WrapValueProvider provider=WrapValueProvider();
  _MyDropDownButtonState();


  var _value;

  @override
  void initState() {
    if(widget._dropDownMenuItems==null ||
        widget._dropDownMenuItems.length==0)
      {
        _value=new DropdownMenuItem(child: new Text('No Item'));
      }
    else {
      _value = widget._dropDownMenuItems[0].value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    width=MediaQuery.of(context).size.width-40.0;

      //_value=_dropDownMenuItems[0].value;
    return
  /*StreamBuilder(
    stream: coachBloc.getCount,
      initialData: new WrapValueProvider<Coach>().newValue=_value,
      builder: (context, snapshot) =>*/
      new Container(

        padding: new EdgeInsets.all(5.0),
        margin: new EdgeInsets.all(5.0),
        height: 48.0,
        width:width ,
        decoration: new BoxDecoration(
            border: new Border.all(color: Colors.blueAccent,width: 0.5),
            borderRadius: new BorderRadius.all(Radius.circular(2.0)),
            gradient: new LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(255,559,255, 0.8),
                const Color.fromRGBO(255,255,255, 0.9),
              ],
              stops: [0.2, 1.0],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 0.0),
            )),
        child:

          new DropdownButton(
            isExpanded: true,
            iconSize: 18.0,
            style: new TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,),
            elevation: 0,
            value: _value,
            items: widget._dropDownMenuItems!=null && widget._dropDownMenuItems.length>0 ? widget._dropDownMenuItems : new DropdownMenuItem(child: new Text('No Item')),
            onChanged: (data) {
              _value = data;
              widget.onChangedValue(data);
              setNewValue(data);


            },
          ),
     // ),
      );
  }


  void setNewValue(T data)
  {
   /* setState(() {
    _value=data;
    });*/
   // widget.notyBloc.updateValue(data);
    //coachBloc.updateCount(data);
  }
}
