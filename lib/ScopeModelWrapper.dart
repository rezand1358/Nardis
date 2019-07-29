import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nardis/Routes.dart';

import 'package:nardis/repository/user/user_repository.dart';
import 'package:nardis/translation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'application.dart';

class ScopeModelWrapperState extends StatefulWidget {

  final UserRepository userRepository;

   ScopeModelWrapperState({Key key, this.userRepository}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    
    return new _MyAppState();
  }

}
 class _MyAppState extends State<ScopeModelWrapperState> {
   SpecificLocalizationDelegate _localeOverrideDelegate;

  //AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;

   @override
   void initState() {
     super.initState();
     _localeOverrideDelegate = new SpecificLocalizationDelegate(null);

     ///
     /// Let's save a pointer to this method, should the user wants to change its language
     /// We would then call: applic.onLocaleChanged(new Locale('en',''));
     ///
     applic.onLocaleChanged = onLocaleChange;
   }

   onLocaleChange(Locale locale) {
     setState(() {
       _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
     });
   }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child:   MyApp(userRepository: _userRepository,));
  }
  
  @override
  void dispose() {
    super.dispose();
  }

 }

// class ScopeModelWrapper extends StatelessWidget {
//   AuthenticationBloc _authenticationBloc;
//   ScopeModelWrapper(this._authenticationBloc);
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel<AppModel>(model: AppModel(), child:   MyApp(userRepository: _,));
//   }
// }


class AppModel extends Model {
  Locale _appLocale = Locale('fa');
  Locale get appLocal => _appLocale ?? Locale("fa");

  void changeDirection() {
    if (_appLocale == Locale("fa")) {
      _appLocale = Locale("en");
    } else {
      _appLocale = Locale("fa");
    }
    notifyListeners();
  }
}