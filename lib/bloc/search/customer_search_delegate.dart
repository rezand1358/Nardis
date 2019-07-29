
import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/models/viewmodels/product_list_vm.dart';
//import 'package:nardis/bloc/search/inherited_blocs.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/ui/product/products_list.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "لطفا نام محصول را برای جستجو وارد نمایید",
            ),
          )
        ],
      );
    }

    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using

    BlocProvider.of<GlobalBloc>(context)
    .searchBloc
    .addition
        .add(query);

    return Column(
      children: <Widget>[
        //Build the results based on the searchResults stream in the searchBloc
        StreamBuilder(
          stream: BlocProvider.of<GlobalBloc>(context).searchBloc.productsStream,//InheritedBlocs.of(context).searchBloc.searchResults,
          builder: (context, AsyncSnapshot<List<ProductSummary>> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (snapshot.data.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Results Found.",
                  ),
                ],
              );
            } else {
              List<ProductSummary> results = snapshot.data;
              ProductListVM productListVM=new ProductListVM();
              productListVM.products=results;
              productListVM.isFromCart=false;
              productListVM.catItem=new CategoryItem('', '', '', SoapOpersConstants.SEARCHDONE, '');
              return new Container(
                height: MediaQuery.of(context).size.height/1.2,
              child:
                   ProductsList(item: productListVM),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}