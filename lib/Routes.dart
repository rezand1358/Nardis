import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nardis/ScopeModelWrapper.dart';
import 'package:nardis/TranslationsDelegate.dart';
import 'package:nardis/authentication/authentication.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart' as gbloc;
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/search/index.dart';
import 'package:nardis/bloc/search/search_screen.dart';
import 'package:nardis/components/UploadImage.dart';
import 'package:nardis/components/loading_indicator.dart';
import 'package:nardis/components/login_page.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_brand_group.dart';
import 'package:nardis/data/soaps/soap_category.dart';
import 'package:nardis/data/soaps/soap_message.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/special_offers.dart';
import 'package:nardis/models/app_state.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/viewmodels/upload_model.dart';
import 'package:nardis/repository/user/user_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/product/product_details.dart';
import 'package:nardis/ui/product/products_list.dart';
import 'package:nardis/ui/profile/profile2.dart';
import 'package:nardis/ui/screens/AnimatedSplashScreen.dart';
import 'package:nardis/ui/screens/add_product_screen.dart';
import 'package:nardis/ui/screens/loading_screen.dart';
import 'package:nardis/ui/screens/register_screen.dart';
import 'package:nardis/ui/screens/sub_category_products_screen.dart';
import 'package:nardis/ui/shopping/shopping_cart_screen.dart';

import 'package:scoped_model/scoped_model.dart';
import 'ui/login/index.dart';
import 'ui/home/index.dart';

class Routes {
  Routes() {
    runApp(new ScopeModelWrapperState(userRepository: UserRepository(),));
  }
}


class MyApp extends StatefulWidget {

  final UserRepository userRepository;

   MyApp({Key key, this.userRepository}) : super(key: key);

  @override
  _MyAppState createState() {
    
    return _MyAppState();
  }

}
class _MyAppState extends State<MyApp>
{

  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;
  String message='';

AppState appState;

Future buildLoading() {
    return new Future.delayed(
        const Duration(seconds: 1), ()  {
        SoapCategory category=new SoapCategory(context: context);
                category.call(SoapConstants.METHOD_NAME_CATEGORY, context);
        });
  }


   @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
   // _authenticationBloc.dispatch(AppStarted());
    super.initState();
    //registerBus();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
     return  BlocProvider<AuthenticationBloc>(
      
      builder :(BuildContext context) => _authenticationBloc,
      child: 
      gbloc.BlocProvider<GlobalBloc>(
        bloc: GlobalBloc(),
        child:
             /*BlocProvider<SearchBloc> (
              builder: (context) => new SearchBloc(),
             child:*/
     new  MaterialApp(

        locale: model.appLocal,
        localizationsDelegates: [
         // _localeOverrideDelegate,
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fa', ''), // Farsi
          const Locale('en', ''), // English
        ],
       //supportedLocales: applic.supportedLocales(),
       onGenerateTitle: (BuildContext context) =>
       Translations.of(context).title(),
        debugShowCheckedModeBanner: false,
       theme: ThemeData(fontFamily: 'IranSans'),
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
              if(state is AuthenticationUninitialized)
              {
                return new AnimatedSplashScreen(_authenticationBloc);//LoginPage(userRepository: UserRepository());

              }
              if(state is AuthenticationAuthenticated)
              {
                 //Navigator.pushReplacementNamed(context, '/loading');
                return LoadingScreen();
              }
              if(state is AuthenticationLoading)
              {
                return LoadingIndicator();
                
              }
              if(state is AuthenticationUnauthenticated)
              {
                return new LoginPage(userRepository: UserRepository());

              }
                return LoadingScreen();
          },
        ),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/login':
              return new MyCustomRoute(
                builder: (_) => new LoginPage(userRepository: UserRepository()),
                settings: settings,
              );

            case '/home':
              return new MyCustomRoute(
                builder: (_) => new HomeScreen(),
                settings: settings,
              );
            
            case '/register':
              return new MyCustomRoute(
                builder: (_) => new RegisterScreen(),
                settings: settings,
              );
            
            case '/myprofile':
              return new MyCustomRoute(
                builder: (_) => new ProfileTwoPage(settings.arguments),
                settings: settings,
              );
            case '/productdetails':
              return new MyCustomRoute(
                builder: (_) => new ProductDetails(null,SoapOpersConstants.OFFERS, settings.arguments,false ),
                settings: settings,
              );
              case '/loading':
              return new MyCustomRoute(
                builder: (_) => new LoadingScreen(),
                settings: settings,
              );
              case '/shoppingcart':
              return new MyCustomRoute(
                builder: (_) => new ShoppingCartScreen(),
                settings: settings,
              );
              case '/subproducts':
              return new MyCustomRoute(
                builder: (_) => new SubCategoryProductsScreen(item: settings.arguments),
                settings: settings,
              );
               case '/productslist':
              return new MyCustomRoute(
                builder: (_) => new ProductsList(item: settings.arguments),
                settings: settings,
              );
               case '/search':
              return new MyCustomRoute(
                builder: (_) => new SearchPage(),
                settings: settings,
              );
            case '/addproduct':
              return new MyCustomRoute(
                builder: (_) => new AddProductScreen(),
                settings: settings,
              );
            case '/uploadscreen':
              return new MyCustomRoute(
                builder: (_) => new UploadImage(model: settings.arguments),
                settings: settings,
              );
          }
        },
        
       // },
        ),
     // ),
      ),
      );
    //}
    //)
  });
  }

}


class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    return new ScaleTransition(scale: animation, child: child);
  }
}
