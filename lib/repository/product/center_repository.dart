
import 'dart:collection';

import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/models/viewmodels/shopping_cart_vm.dart';

class CenterRepository {

  static final CenterRepository _repository = new CenterRepository._internal();

  factory CenterRepository(){
    return _repository;
  }

  CenterRepository._internal();

  String topMessage='';
   List<ProductCategoryModel> categoryList=new List();
   List<ProductCategoryModel> brandCategoryList=new List();

   //for admin
  List<ProductCategoryModel> adminCategoryList=new List();
  List<ProductCategoryModel> adminBrandCategoryList=new List();

   HashMap<String,List<ProductSummary>> mapOfProductsInCategory=new HashMap();
   HashMap<String,List<ProductCategoryModel>> mapOfGroupsInCategory=new HashMap();
  HashMap<String,List<ProductCategoryModel>> mapOfAdminGroupsInCategory=new HashMap();

  HashMap<String,List<ProductCategoryModel>> mapOfSubBrandsInBrands=new HashMap();
  HashMap<String,List<ProductCategoryModel>> mapOfSubAdminBrandsInBrands=new HashMap();

   HashMap<String,List<ProductSummary>> mapOfProductOffers=new HashMap();
   HashMap<String,List<ProductSummary>> mapOfSubProducts=new HashMap();
   HashMap<String,List<ProductSummary>> mapOfSearchProducts=new HashMap();

  List<ShoppingCartProductVM> listOfProductsInShoppingList=new List();
  ShoppingCartVM shoppingCartVM=new ShoppingCartVM();

  setListOfShoppingCartProductsIntoShoppingCart(List<ShoppingCartProductVM> products)
  {
    this.shoppingCartVM.products=products;
  }

 List<ShoppingCartProductVM> getShoppingListOfProductsInShoppingCart()
  {
    return this.shoppingCartVM.products;
  }

 List<ShoppingCartProductVM> getListOfProductsInShoppingList()
  {
    if(listOfProductsInShoppingList==null)
      {
        listOfProductsInShoppingList=new List();
      }
    return this.listOfProductsInShoppingList;
  }

 ShoppingCartVM getShoppingCartVM()
 {
   return this.shoppingCartVM;
 }

HashMap<String, List<ProductSummary>>  getListOfProductOffers()
  {
    return this.mapOfProductOffers;
  }

HashMap<String, List<ProductSummary>>  getMapOfSearchProducts()
  {
    return this.mapOfSearchProducts;
  }

HashMap<String, List<ProductSummary>>  getListOfSubProducts()
  {
    return this.mapOfSubProducts;
  }

  setProductOffers(List<ProductSummary> offers,String key)
  {
      getListOfProductOffers().putIfAbsent(key, () => offers );
      getMapOfProductsInCategory().putIfAbsent(key, () => getListOfProductOffers()[key] );
  }

setSearchProducts(List<ProductSummary> products,String key)
{
  getMapOfSearchProducts().putIfAbsent(key, ()=>products);
  getMapOfProductsInCategory().putIfAbsent(key, () => getMapOfSearchProducts()[key] );
}

  List<ProductSummary> getSearchProductsListFromCategoryMap()
  {
    return getMapOfProductsInCategory()[SoapOpersConstants.SEARCH];
  }
  
   setSubProducts(List<ProductSummary> products,String key)
  {
      getListOfSubProducts().putIfAbsent(key, () => products );
      getMapOfProductsInCategory().putIfAbsent(key, () => getListOfSubProducts()[key] );
  }
 Map<String,List<ProductSummary>> getMapOfProductsInCategory()
  {
    return this.mapOfProductsInCategory;
  }

 Map<String,List<ProductCategoryModel>> getMapOfGroupsInCategory()
  {
    return this.mapOfGroupsInCategory;
  }
  Map<String,List<ProductCategoryModel>> getMapOfAdminGroupsInCategory()
  {
    return this.mapOfAdminGroupsInCategory;
  }
  Map<String,List<ProductCategoryModel>> getMapOfSubBrandsInBrands()
  {
    return this.mapOfSubBrandsInBrands;
  }
  Map<String,List<ProductCategoryModel>> getMapOfSubAdminBrandsInBrands()
  {
    return this.mapOfSubAdminBrandsInBrands;
  }
  setMapOfProductsInCategory(HashMap<String,List<ProductSummary>> mapOfProductsInCategory)
  {
    this.mapOfProductsInCategory=mapOfProductsInCategory;
  }
  List<ProductCategoryModel> getListOfAdminCategory()
  {
    if(adminCategoryList==null)
    {
      adminCategoryList=new List();
    }
    return this.adminCategoryList;
  }
 List<ProductCategoryModel> getListOfCategory()
  {
    if(categoryList==null)
    {
      categoryList=new List();
    }
    return this.categoryList;
  }

  List<ProductCategoryModel> getListOfBrandCategory()
  {
     if(brandCategoryList==null)
     {
       brandCategoryList=new List();
     }
    return this.brandCategoryList;
  }
  List<ProductCategoryModel> getListOfAdminBrandCategory()
  {
    if(adminBrandCategoryList==null)
    {
      adminBrandCategoryList=new List();
    }
    return this.adminBrandCategoryList;
  }
  setListOfCategory(List<ProductCategoryModel> categoryList)
  {
    this.categoryList=categoryList;
  }
  setListOfAdminCategory(List<ProductCategoryModel> categoryList)
  {
    this.adminCategoryList=categoryList;
  }
  setListOfBrandCategory(List<ProductCategoryModel> categoryList)
  {
    this.brandCategoryList=categoryList;
  }
  setListOfAdminBrandCategory(List<ProductCategoryModel> categoryList)
  {
    this.adminBrandCategoryList=categoryList;
  }

}

CenterRepository repository=new CenterRepository();