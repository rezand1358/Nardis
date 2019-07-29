import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nardis/components/MySubCategoryProductItem.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class SubCategoryProductsScreen extends StatefulWidget
{

  String cat_name='';
  String code='';
  String cat_key='';
  CategoryItem item;
  List<ProductCategoryModel> productList=new List();
  List<CategoryItem> catItems=new List();
  List<CategoryItem> brandItems=new List();

SubCategoryProductsScreen({@required this.item})
{
  productList=new List();
  catItems=new List();
  brandItems=new List();
  cat_name=item.catname;
  cat_key=item.cattype;
  productList=repository.getMapOfGroupsInCategory()[cat_name];
  
  catItems=productList.map((item) =>
    new CategoryItem(item.name, '',item.code,this.cat_name,this.cat_key)).toList();

}

  @override
  _SubCategoryProductsState createState() {
    return _SubCategoryProductsState();
  }

}

class _SubCategoryProductsState extends State<SubCategoryProductsScreen>
{

 List<ProductSummary> products=new List();
//List<ProductOffers> offerItems=new List();

void registerBus() {
    RxBus.register<ChangeEvent>().listen((ChangeEvent event)  {
      
      if( event.message=='SUBPRODUCTS_LOADED')
      {

      }
        // loadProductsList();
      setState(()  => { 
    
    });
    });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
           icon:Icon( Icons.arrow_forward_ios),
          onPressed: ()=> 
              Navigator.popAndPushNamed(context, '/home')
          ,)
        ],
        title: Text(Translations.current.productslist()),
      ),
      body: _buildList(context)
    );
  }
  


ListView _buildList(BuildContext context) {
   
    return new ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: widget.catItems.length,
      itemBuilder: (context, index) {
        return new MySubCategoryProductItem(widget.catItems[index]);
      },
    );
  }

}