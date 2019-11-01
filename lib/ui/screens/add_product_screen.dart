import 'dart:convert';
import 'dart:convert' as prefix0;
import 'dart:io';
import 'package:nardis/models/message.dart';
import 'package:path/path.dart' as pat;
import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/values/notify_value.dart';
import 'package:nardis/bloc/widget_events/ButtonDefinition.dart';
import 'package:nardis/components/BorderedButton.dart';
import 'package:nardis/components/DropDownButton.dart';
import 'package:nardis/components/RegisterButton.dart';
import 'package:nardis/components/UploadImage.dart';
import 'package:nardis/components/form_field_state_persister.dart';
import 'package:nardis/components/text_form_field.dart';
import 'package:nardis/components/text_input_form_field.dart';
import 'package:nardis/constants/constants.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_add_product.dart';
import 'package:nardis/data/soaps/soap_get_last_object_code.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_upload_image.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/new_object.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/imagefile_model.dart';
import 'package:nardis/models/viewmodels/upload_image_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';


import 'package:nardis/translation_strings.dart';
import 'package:nardis/widgets/appbar_collapse.dart';
import 'package:nardis/widgets/bottom_sheet_fix.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:http/http.dart' as http;


class AddProductScreen extends StatefulWidget {



  @override
  AddProductScreenState createState() {
    return new AddProductScreenState();
  }

  AddProductScreen({key: Key});
}

class AddProductScreenState extends State<AddProductScreen>
{

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //static final _formKey = new GlobalKey<FormState>();
  static final int CODE_TYPE=1;
  static final int NAME_TYPE=2;
  static final int PRICE_TYPE=6;

  static final int PRODUCTGROUP_TYPE=3;
  static final int BRAND_TYPE=4;
  static final int DESCRIPTION_TYPE=5;


  String code='';
  String name='';
  String price='';
  String productGroup='';
  String brand='';
  String description='';
  int productGroupId;
  int brandId;

  String catName='';
  String brandName='';

  var valueNotyCodeBloc=new NotyBloc<Message>();

  var valueNotyCatBloc=new NotyBloc<ProductCategoryModel>();
  var valueNotySubCatBloc=new NotyBloc<ProductCategoryModel>();
  var valueNotyBrandBloc=new NotyBloc<ProductCategoryModel>();
  var valueNotySubBrandBloc=new NotyBloc<ProductCategoryModel>();

  var valueNotyImageBloc=new NotyBloc<UploadedImageFile>();

  final codeEditingController=new TextEditingController();
  final nameEditingController=new TextEditingController();
  final priceEditingController=new TextEditingController();
  final descEditingController=new TextEditingController();

  //static ValueChanged onChangedCat;
  bool _autoValidate=false;

  static File productImage;

  List<ProductCategoryModel> categorys=new List();//=[new ProductCategoryModel(name: 'گروه اصلی',code: '-1',parent_id: '-1')];
  List<ProductCategoryModel> subCategorys=new List();//=[new ProductCategoryModel(name: 'گروه اصلی',code: '-1',parent_id: '-1')];

  List<CategoryItem> catItems=new List();



  List<CategoryItem> brandItems=new List();
  List<ProductCategoryModel> brands=new List();//=[new ProductCategoryModel(name: 'گروه فرعی',code: '-1',parent_id: '-1')];
  List<ProductCategoryModel> subBrands=new List();//=[new ProductCategoryModel(name: 'گروه فرعی',code: '-1',parent_id: '-1')];


  List<DropdownMenuItem<ProductCategoryModel>> scItems = new List();
  List<DropdownMenuItem<ProductCategoryModel>> sbItems = new List();

  ProductCategoryModel _currentGroup;//=new ProductCategoryModel(name: 'گروه اصلی محصول',code: '-1', parent_id: '-1');
  ProductCategoryModel _currentSubCat;//=new ProductCategoryModel(name: 'گروه فرعی محصول',code: '-1', parent_id: '-1');
  ProductCategoryModel _currentBrand;//=new ProductCategoryModel(name: ' گروه اصلی برند',code: '-1', parent_id: '-1');
  ProductCategoryModel _currentSubBrand;//=new ProductCategoryModel(name: ' گروه فرعی برند',code: '-1', parent_id: '-1');

  onChangedCat(value)
  {
    setState(() {
      _currentGroup=value;

      catName=_currentGroup.name;
      getDropDownMenuSubCatItems();
    });

  }

  onChangedSubCat(value)
  {

  }

  onChangedBrand(value)
  {

  }

  onChangedSubBrand(value)
  {

  }


  List<DropdownMenuItem<ProductCategoryModel>> _getDropDownMenuGroupsItems() {
    List<DropdownMenuItem<ProductCategoryModel>> groupItems = new List();
    for (ProductCategoryModel c in categorys) {
      groupItems.add(new DropdownMenuItem<ProductCategoryModel>(
        value: c,
        child: new Text(c.name,
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.redAccent),),
      ));
    }
    return groupItems;
  }

  List<DropdownMenuItem<ProductCategoryModel>> _getDropDownMenuBrandItems() {
    List<DropdownMenuItem<ProductCategoryModel>> brandItems = new List();
    for (ProductCategoryModel c in brands) {
      brandItems.add(new DropdownMenuItem<ProductCategoryModel>(
        value: c,
        child: new Text(c.name,
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.redAccent),),
      ));
    }
    return brandItems;
  }



  onValueChanged(String value,int type)
  {
    if(type==CODE_TYPE)
    {
      //code=value;
    }
    else if(type==NAME_TYPE)
    {
      name=value;
    }
    else if(type==DESCRIPTION_TYPE)
    {
      description=value;
    }
    else if(type==PRICE_TYPE)
      {
        price=value;
      }
    else if(type==BRAND_TYPE)
    {
      brandId=int.tryParse(value);
    }
    else if(type==PRODUCTGROUP_TYPE)
    {
      productGroupId=int.tryParse(value);
    }


  }


  static FormFieldStatePersister fieldStatePersister;
  static bool _formWasEdited = false;
  //final _formKey = GlobalKey<FormState>();

  double h=10;double w=30;


  setNewValue(ProductCategoryModel data)
  {
    setState(() {

     // _currentSubCat=new ProductCategoryModel(name: 'گروه اصلی',code: '-1',parent_id: '-1');

      //subCategorys;//=[new ProductCategoryModel(name: 'گروه فرعی محصول',code: '-1',parent_id: '-1')];
      _currentGroup=data;
      catName=_currentGroup.name;
      //subCategorys=List.from(subCategorys)..addAll(repository.getMapOfAdminGroupsInCategory()[catName]);
      if(subCategorys!=null  &&
          subCategorys.length>0)
        subCategorys.clear();
      subCategorys..addAll(repository.getMapOfAdminGroupsInCategory()[catName]);

      if(subCategorys!=null &&
          subCategorys.length>0)
      _currentSubCat=subCategorys[0];
      //getDropDownMenuSubCatItems();
    });
  }


  setNewBrandValue(ProductCategoryModel data)
  {
    setState(() {


      //subBrands=[new ProductCategoryModel(name: 'گروه فرعی برند',code: '-1',parent_id: '-1')];
      _currentBrand=data;
      brandName=_currentBrand.name;
      if(subBrands!=null &&
      subBrands.length>0)
        subBrands.clear();
      subBrands=List.from(subBrands)..addAll(repository.getMapOfAdminGroupsInCategory()[brandName]);
      if(subBrands!=null &&
          subBrands.length>0)
        _currentSubBrand=subBrands[0];
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextInputFormField codeField = new TextInputFormField(

        controller: fieldStatePersister['Code'].persister,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          onValueChanged(value,CODE_TYPE);
          },

        decoration:  new InputDecoration(
          enabled: true,
          contentPadding: EdgeInsets.symmetric(vertical: h,horizontal: w),
          labelText: Translations.current.productcode(),
          hintText: Translations.current.productcode(),
          //filled: true,
          border: OutlineInputBorder(gapPadding: 2.0, borderSide: BorderSide(color: Colors.blueAccent)),
          icon: const Icon(Icons.info,color: Colors.blueAccent,),
          labelStyle:
          new TextStyle(decorationStyle: TextDecorationStyle.solid),
          errorText: null,
        ),
        validator: _validateNumber);

    TextInputFormField descField = new TextInputFormField(
        controller: fieldStatePersister['Description'].persister,
        keyboardType: TextInputType.text,
        onSaved: (value)=> onValueChanged(value,DESCRIPTION_TYPE),

        decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: h,horizontal: w),
          labelText: Translations.current.description(),
          //filled: true,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
          icon: const Icon(Icons.info,color: Colors.blueAccent,),
          labelStyle:
          new TextStyle(decorationStyle: TextDecorationStyle.solid),

          errorText: null,
        ),
        validator: _validateName);
    TextInputFormField priceField = new TextInputFormField(
        controller: fieldStatePersister['Price'].persister,
        keyboardType: TextInputType.number,
        onSaved: (value)=> onValueChanged(value,PRICE_TYPE),
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: h,horizontal: w),
          labelText: Translations.current.productUnitPrice(),
          //filled: true,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
          icon: const Icon(Icons.info,color: Colors.blueAccent,),
          labelStyle:
          new TextStyle(decorationStyle: TextDecorationStyle.solid),

          errorText: null,
        ),
        validator: _validateNumber);

    TextInputFormField nameField = new TextInputFormField(
        controller: fieldStatePersister['Name'].persister,
        keyboardType: TextInputType.text,
        onSaved: (value)=> onValueChanged(value,NAME_TYPE),

        decoration: new InputDecoration(

          contentPadding: EdgeInsets.symmetric(vertical: h,horizontal: w),
          labelText: Translations.current.plzEnterName(),
          hintText: Translations.current.productName(),
          //filled: true,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
          icon: const Icon(Icons.info,color: Colors.blueAccent,),
          labelStyle:
          new TextStyle(decorationStyle: TextDecorationStyle.solid),

          errorText: null,
        ),
        validator: _validateName);


    return
    Scaffold(
      key: _scaffoldKey,
      body:
      new ListView (
        children: <Widget>[
          Column(
            //margin: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container (
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child:
                Form (
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child:
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: new Column(
                      children: <Widget>[

                    Container(
                    //height: 45,
                    padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
                    child:
                          //codeField,
                          StreamBuilder<Message>(
                              stream: valueNotyCodeBloc.noty,
                              initialData: null,
                              builder: (BuildContext c, AsyncSnapshot<Message> data) {
                                if (data != null && data.hasData) {
                                  Message val = data.data;
                                  code = val.text;
                                }
                                return

                                  TextFormField(
                                      /*initialValue:
                                      code.isNotEmpty ? code :
                                       '',*/
                                      controller: codeEditingController,
                                      keyboardType: TextInputType.number,

                                      decoration:
                                      InputDecoration(
                                          labelText: code.isNotEmpty ? code : Translations.current
                                              .productcode()),
                                      //controller: codeEditingController,
                                      enabled: false,
                                      onEditingComplete: (){

                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return Translations.current
                                              .plzEnterCode();
                                        }
                                        return null;
                                      },

                                      onSaved: (String value) {
                                        // onValueChanged(value, SizeOfHeight_TYPE);
                                        // setState(() {
                                        onValueChanged(value, CODE_TYPE);
                                        //});
                                      }
                                 // ),
                                  );
                              }
                                ),

                        ),
                        Container(
                          // height: 45,
                          padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
                          child:
                          //nameField,
                          TextFormField(
                            controller: nameEditingController,
                              decoration:
                              InputDecoration(labelText: Translations.current.productName()),
                              keyboardType: TextInputType.text,

                              validator: (value) {
                                if (value.isEmpty) {
                                  return Translations.current.plzEnterName();
                                }
                                return null;
                              },
                              onSaved: (String value)
                              {
                                // onValueChanged(value, SizeOfHeight_TYPE);
                               // setState(() {
                                 onValueChanged(value, NAME_TYPE);
                                //});
                              }
                          ),
                        ),
                        Container(
                          //height: 45,
                          padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
                          child:
                          //priceField,
                          TextFormField(
                            controller: priceEditingController,
                              decoration:
                              InputDecoration(labelText: Translations.current.productUnitPrice()),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return Translations.current.productUnitPrice();
                                }
                                return null;
                              },
                              onSaved: (String value)
                              {
                                // onValueChanged(value, SizeOfHeight_TYPE);
                                //setState(() {
                                  onValueChanged(value, PRICE_TYPE);
                                //});
                              }
                          ),

                        ),
                        Container(
                          // height: 45,
                          padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
                          child:
                          //descField,
                          TextFormField(
                            controller: descEditingController,
                              decoration:
                              InputDecoration(labelText: Translations.current.description()),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return null;//Translations.current.description();
                                }
                                return null;
                              },
                              onSaved: (String value)
                              {
                                // onValueChanged(value, SizeOfHeight_TYPE);
                               // setState(() {
                                  onValueChanged(value, DESCRIPTION_TYPE);
                                //});
                              }
                          ),
                        ),


                        new Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                             /* Container (
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                child:
                                StreamBuilder<ProductCategoryModel>(
                                    stream: valueNotyCatBloc.noty,
                                    initialData: null,
                                    builder: (BuildContext c, AsyncSnapshot<ProductCategoryModel> data) {
                                      if(data!=null && data.hasData)
                                      {


                                        _currentGroup=data.data;

                                          catName=_currentGroup.name;
                                          //getDropDownMenuSubCatItems();


                                      }
                                      return*/

                                        // MyDropDownButton<ProductCategoryModel>(_getDropDownMenuGroupsItems(),onChangedCat,valueNotyCatBloc);
                                        new Container(

                                          padding: new EdgeInsets.all(5.0),
                                          margin: new EdgeInsets.all(5.0),
                                          height: 48.0,
                                          width:MediaQuery.of(context).size.width-40.0 ,
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

                                           DropdownButton<ProductCategoryModel>(
                                            isExpanded: true,
                                            iconSize: 18.0,
                                            style: new TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,),
                                            elevation: 0,
                                            items: categorys.map((p) {
                                                return
                                                 DropdownMenuItem<ProductCategoryModel>(
                                                  value: p,
                                                  child: new Text(p.name,
                                                    textAlign: TextAlign.center,
                                                    style: new TextStyle(color: Colors.redAccent),),
                                                );

                                            }).toList(),
                                            value: _currentGroup,
                                            onChanged: (data) {

                                              setNewValue(data);


                                            },
                                          ),
                                           ),
                                       // );
                                  //  }
                               // ),
                             // ),
                            ],
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                             /* Container (
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                child:
                                StreamBuilder<ProductCategoryModel>(
                                    stream: valueNotySubCatBloc.noty,
                                    initialData: null,
                                    builder: (BuildContext c, AsyncSnapshot<ProductCategoryModel> data) {
                                      if(data!=null && data.hasData)
                                      {
                                        _currentSubCat=data.data;

                                      }
                                      return*/
                                        // MyDropDownButton<ProductCategoryModel>(getDropDownMenuSubCatItems(),onChangedSubCat,valueNotySubCatBloc);
                                        new Container(

                                          padding: new EdgeInsets.all(5.0),
                                          margin: new EdgeInsets.all(5.0),
                                          height: 48.0,
                                          width:MediaQuery.of(context).size.width-40.0 ,
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

                                           DropdownButton<ProductCategoryModel>(
                                            isExpanded: true,
                                            iconSize: 18.0,
                                            style: new TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,),
                                            elevation: 0,

                                            items: subCategorys.map((ProductCategoryModel p) {
                                      return
                                       DropdownMenuItem<ProductCategoryModel>(
                                      value: p,
                                      child: new Text(p.name,
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(color: Colors.redAccent),),
                                      );
                                      }).toList(),
                                            value: _currentSubCat,
                                            onChanged: (data) {

                                             // setNewValue(data);
                                            setState(() {
                                              _currentSubCat=data;
                                            });

                                            },

                                          ),
                                          // ),
                                       // );
                                   // }
                               // ),
                              ),
                            ]
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /* Container (
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                child:
                                StreamBuilder<ProductCategoryModel>(
                                    stream: valueNotySubCatBloc.noty,
                                    initialData: null,
                                    builder: (BuildContext c, AsyncSnapshot<ProductCategoryModel> data) {
                                      if(data!=null && data.hasData)
                                      {
                                        _currentSubCat=data.data;

                                      }
                                      return*/
                              // MyDropDownButton<ProductCategoryModel>(getDropDownMenuSubCatItems(),onChangedSubCat,valueNotySubCatBloc);
                              new Container(

                                padding: new EdgeInsets.all(5.0),
                                margin: new EdgeInsets.all(5.0),
                                height: 48.0,
                                width:MediaQuery.of(context).size.width-40.0 ,
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

                                DropdownButton<ProductCategoryModel>(
                                  isExpanded: true,
                                  iconSize: 18.0,
                                  style: new TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,),
                                  elevation: 0,

                                  items: brands.map((ProductCategoryModel p) {
                                    return
                                      DropdownMenuItem<ProductCategoryModel>(
                                        value: p,
                                        child: new Text(p.name,
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(color: Colors.redAccent),),
                                      );
                                  }).toList(),
                                  value: _currentBrand,
                                  onChanged: (data) {

                                    // setNewValue(data);
                                    setNewBrandValue(data);

                                  },

                                ),
                                // ),
                                // );
                                // }
                                // ),
                              ),
                            ]
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /* Container (
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                child:
                                StreamBuilder<ProductCategoryModel>(
                                    stream: valueNotySubCatBloc.noty,
                                    initialData: null,
                                    builder: (BuildContext c, AsyncSnapshot<ProductCategoryModel> data) {
                                      if(data!=null && data.hasData)
                                      {
                                        _currentSubCat=data.data;

                                      }
                                      return*/
                              // MyDropDownButton<ProductCategoryModel>(getDropDownMenuSubCatItems(),onChangedSubCat,valueNotySubCatBloc);
                              new Container(

                                padding: new EdgeInsets.all(5.0),
                                margin: new EdgeInsets.all(5.0),
                                height: 48.0,
                                width:MediaQuery.of(context).size.width-40.0 ,
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

                                DropdownButton<ProductCategoryModel>(
                                  isExpanded: true,
                                  iconSize: 18.0,
                                  style: new TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,),
                                  elevation: 0,

                                  items: subBrands.map((ProductCategoryModel p) {
                                    return
                                      DropdownMenuItem<ProductCategoryModel>(
                                        value: p,
                                        child: new Text(p.name,
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(color: Colors.redAccent),),
                                      );
                                  }).toList(),
                                  value: _currentSubBrand,
                                  onChanged: (data) {

                                    // setNewValue(data);
                                    setState(() {
                                      _currentSubBrand=data;
                                    });

                                  },

                                ),
                                // ),
                                // );
                                // }
                                // ),
                              ),
                            ]
                        ),
                       /* new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container (
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                child:
                                StreamBuilder<ProductCategoryModel>(
                                    stream: valueNotyBrandBloc.noty,
                                    initialData: null,
                                    builder: (BuildContext c, AsyncSnapshot<ProductCategoryModel> data) {
                                      if(data!=null && data.hasData)
                                      {


                                        _currentBrand=data.data;

                                          brandName=_currentBrand.name;
                                          getDropDownMenuSubBrandItems();


                                      }
                                      return
                                        new MyDropDownButton<ProductCategoryModel>(_getDropDownMenuBrandItems(),onChangedBrand,valueNotyBrandBloc);
                                    }
                                ),
                              ),
                            ]
                        ),*/
                     /*   new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container (
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                child:
                                StreamBuilder<ProductCategoryModel>(
                                    stream: valueNotySubCatBloc.noty,
                                    initialData: null,
                                    builder: (BuildContext c, AsyncSnapshot<ProductCategoryModel> data) {
                                      if(data!=null && data.hasData)
                                      {
                                        _currentSubBrand=data.data;

                                      }
                                      return
                                        new MyDropDownButton<ProductCategoryModel>(sbItems,onChangedSubBrand,valueNotySubBrandBloc);
                                    }
                                ),
                              ),
                            ]
                        ),*/
                    StreamBuilder<UploadedImageFile>(
                        stream: valueNotyImageBloc.noty,
                        initialData: null,
                        builder: (BuildContext c, AsyncSnapshot<UploadedImageFile> data) {
                          if(data!=null && data.hasData)
                          {
                            UploadedImageFile result=data.data;
                            if(result!=null)
                              productImage=result.file;
                                saveProductImage(productImage);
                          }
                          return
                        new BorderedButton(60.0,48.0,60.0,10.0,
                            Translations.current.productPic(),
                            _pickProductImage,
                            onSelected(new ButtonDefinition(selectedId: 1,selectedTitle: Translations.current.productPic(),
                                taskId: 1,message: "PRODUCTPIC")));
                        }),
                        new GestureDetector(

                          onTap:() { sendProduct(context);},
                          child:
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 50.0),
                                child:
                          new SendRegister(),
                                  ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      );
  }


  saveProductImage(File image) async
  {
    // getting a directory path for saving
    final String path = (await getExternalStorageDirectory()).path;
    String ext=pat.extension(image.path);
    final imageName=code+ext;
   // copy the file to a new path
    final File newImage = await image.copy('$path/$imageName');
  }
  sendProduct(BuildContext context)
  {
    final FormState form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      List<String> branIds=_currentSubBrand.code.split(',');
      String bId='';
      List<String> prodIds=_currentSubCat.code.split(',');
      String pId='';

      if(branIds!=null &&
      branIds.length==2 )
        {
          bId=branIds[0];
        }
      if(prodIds!=null &&
      prodIds.length==2)
        {
          pId=prodIds[0];
        }
     NewObject newObject=new NewObject(
         code: code,
         name: name,
         brandId: _currentSubBrand.id,
         productId: _currentSubCat.id,
         price: price,
         description: description);
     List<NewObject> inputString=[newObject];
     String json=jsonEncode(inputString);
      new SoapAddProduct(contex: context).call(SoapConstants.METHOD_SAVE_NEW_OBJECT, json);

    }
    else
    {
      _autoValidate=true;
      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('خطا در ورود اطلاعات .لطفا بررسی کنید')));
    }
  }

  onSelected(ButtonDefinition btnDefinition)
  {

  }
  _pickProductImage()
  {

    Navigator.pushNamed(context, '/uploadscreen',arguments: new UploadImageModel(title: '', type: AppConstants.IMAGE_FROM_GALLERY_TYPE,
        forWhich: 'PRODUCT', valueNotyImageBloc: valueNotyImageBloc));
  }

  loadNewCode(BuildContext ctx)
  {
    new SoapLastObjectCode(context: ctx,noty: valueNotyCodeBloc).call(SoapConstants.METHOD_NAME_LASTOBJECT_CODE);

  }

  void registerBus() {
    RxBus.register<ChangeEvent>().listen((ChangeEvent event)  {

      if( event.message=='OBJECT_CODE_LOADED') {
        code = event.value;
        codeEditingController.text=code;
        // fieldStatePersister['Code'].persister.value=code;
        //fieldStatePersister['Code'].persister.notifyListeners();
        setState(() {

        });
      }
      else if(event.message=='OBJECT_SAVED')
        {
          Upload(productImage);
        }
      else if(event.message=='UPLOAD_SUCCESS')
        {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('انتقال تصویر و ذخیره کالا با موفقیت انجام شد'),));
          productImage=null;
          nameEditingController.text='';
          priceEditingController.text='';
          descEditingController.text='';
          loadNewCode(context);
        }
    });
  }
  @override
  void initState() {


    registerBus();
    //codeEditingController=new TextEditingController();
    /*codeEditingController.addListener((){
      final cde=codeEditingController.text;
      codeEditingController.value=codeEditingController.value.copyWith(
      text: cde,
      );
    });*/
    loadNewCode(context);
    fieldStatePersister = new FormFieldStatePersister(_update);
    valueNotyCodeBloc=new NotyBloc<Message>();
    valueNotyCatBloc=new NotyBloc<ProductCategoryModel>();
    valueNotySubCatBloc=new NotyBloc<ProductCategoryModel>();
    valueNotyBrandBloc=new NotyBloc<ProductCategoryModel>();
    valueNotySubBrandBloc=new NotyBloc<ProductCategoryModel>();

    valueNotyImageBloc=new NotyBloc<UploadedImageFile>();
    fieldStatePersister.addSimplePersister('Code', code);
    fieldStatePersister.addSimplePersister('Name', '');
    fieldStatePersister.addSimplePersister('Description', '');
    fieldStatePersister.addSimplePersister('Price', '');

    //_currentGroup;//=new ProductCategoryModel(name: 'گروه اصلی محصول',code: '-1', parent_id: '-1');
    //_currentBrand;//=new ProductCategoryModel(name: 'گروه اصلی برند',code: '-1', parent_id: '-1');

    categorys=new List();
    subCategorys=new List();
    subBrands=new List();
    brands=new List();
     catItems=new List();



     brandItems=new List();


     scItems = new List();
     sbItems = new List();

     //_currentGroup;//=new ProductCategoryModel(name: 'گروه اصلی محصول',code: '-1', parent_id: '-1');
     //_currentSubCat;//=new ProductCategoryModel(name: 'گروه فرعی محصول',code: '-1', parent_id: '-1');
     //_currentBrand;//=new ProductCategoryModel(name: ' گروه اصلی برند',code: '-1', parent_id: '-1');
     //_currentSubBrand;//=new ProductCategoryModel(name: ' گروه فرعی برند',code: '-1', parent_id: '-1');


    //categorys=List.from(categorys)..addAll( repository.getListOfAdminCategory());
    categorys..addAll( repository.getListOfAdminCategory());

    if(categorys!=null &&
    categorys.length>0)
    _currentGroup=categorys[0];
    else
      _currentGroup=new ProductCategoryModel(name: 'گروه اصلی محصول',code: '-1', parent_id: '-1');
    _currentBrand=new ProductCategoryModel(name: 'گروه اصلی برند',code: '-1', parent_id: '-1');

    _currentSubCat=new ProductCategoryModel(name: 'گروه فرعی محصول',code: '-1', parent_id: '-1');
    _currentSubBrand=new ProductCategoryModel(name: 'گروه فرعی برند',code: '-1', parent_id: '-1');

    //subCategorys=List.from(subCategorys)..addAll(repository.getMapOfAdminGroupsInCategory()[_currentGroup.name]);
    subCategorys..addAll(repository.getMapOfAdminGroupsInCategory()[_currentGroup.name]);

    if(subCategorys!=null &&
      subCategorys.length>0)
        _currentSubCat=subCategorys[0];
    catItems=categorys.map((item) =>
    new CategoryItem(item.name, item.imageAdd,item.code,item.name,SoapOpersConstants.OPERS_ADMINCATEGORY)).toList();


    //brands=List.from(brands)..addAll(repository.getListOfAdminBrandCategory());
    brands..addAll(repository.getListOfAdminBrandCategory());

    if(brands!=null &&
    brands.length>0)
      _currentBrand=brands[0];
    //subBrands=List.from(subBrands)..addAll(repository.getMapOfAdminGroupsInCategory()[_currentBrand.name]);
    subBrands..addAll(repository.getMapOfAdminGroupsInCategory()[_currentBrand.name]);

    if(subBrands!=null &&
    subBrands.length>0)
      _currentSubBrand=subBrands[0];

    brandItems=brands.map((item) =>
    new CategoryItem(item.name,
        item.imageAdd,
        item.code,
        item.name,
        SoapOpersConstants.ADMINBRANDGROUPS)).toList();

    //getDropDownMenuSubCatItems();
   // getDropDownMenuSubBrandItems();
    super.initState();

  }
  void _update() {
    setState((){});
  }

  void dispose() {
    codeEditingController.dispose();
    super.dispose();
  }
  Upload(File imageFile) async {
    String base64Image='';
    base64Image = base64Encode(imageFile.readAsBytesSync());
    String imgName=code+pat.extension(imageFile.path);//pat.basename(imageFile.path);
    new SoapUploadImage(context: context).call( SoapConstants.METHOD_SAVE_IMAGE, base64Image, imgName);

  }

  List<DropdownMenuItem<ProductCategoryModel>> getDropDownMenuSubCatItems() {

    if(catName.isEmpty)
      catName=categorys[0].name;
    List<ProductCategoryModel> tempList=repository.getMapOfAdminGroupsInCategory()[catName];
    if(scItems.length>0)
      scItems.clear();
    for (ProductCategoryModel c in tempList) {
      scItems.add(new DropdownMenuItem<ProductCategoryModel>(
        value: c,
        child: new Text(c.name,
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.redAccent),),
      ));
    }
    return scItems;
  }

  List<DropdownMenuItem<ProductCategoryModel>> getDropDownMenuSubBrandItems() {

    if(brandName.isEmpty)
      brandName=brands[0].name;
    List<ProductCategoryModel> tempList= repository.getMapOfSubAdminBrandsInBrands()[brandName];
    if(sbItems.length>0)
      sbItems.clear();
    for(ProductCategoryModel c in tempList) {
      sbItems.add(new DropdownMenuItem<ProductCategoryModel>(
        value: c,
        child: new Text(c.name,
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.redAccent),),
      ));
    }
    return sbItems;
  }

  Future<bool> _warnUserAboutInvalidData(BuildContext context) async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
      context: context,
      child: new AlertDialog(
        title: const Text('This form has errors'),
        content: const Text('Really leave this form?'),
        actions: <Widget>[
          new FlatButton(
            child: const Text('YES'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          new FlatButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    ) ??
        false;
  }

  void _reset() {
    fieldStatePersister.resetToInitialValues();
    _update();
    new Future.delayed(new Duration(milliseconds:50)).then((dynamic a) {
      _formKey.currentState.reset();
    });
  }

  void _handleSubmitted(FormFieldStatePersister fieldStatePersister,BuildContext context) {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.',context);
      _update();
    } else {
      showInSnackBar('${fieldStatePersister['Name']} is a ${fieldStatePersister['Sex']},\n'
          '  eye color is ${fieldStatePersister['EyeColor']},\n'
          '  education level is ${fieldStatePersister['Education']}\n'
          '  can contact parents? ${fieldStatePersister['ContactParents']}',context);
    }
  }



  static String _validateNumber(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'ورود کد الزامی است';
    final RegExp nameExp = new RegExp(r'^[0-9 ]+$');
    if (!nameExp.hasMatch(value))
      return 'لطفا مقدار عددی وارد نمایید';
    return null;
  }
  static String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'ورود متن الزامی است';
    final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'لطفا مقدار متنی وارد نمایید';
    return null;
  }
  void showInSnackBar(String value,BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
