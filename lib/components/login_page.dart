import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/authentication/authentication.dart';
import 'package:nardis/bloc/login/login.dart';
import 'package:nardis/bloc/register/register.dart';
import 'package:nardis/repository/user/user_repository.dart';
import 'package:nardis/ui/login/login_form.dart';






class LoginPage extends StatefulWidget {
final UserRepository userRepository;

LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

 
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      statusBarColor:Colors.blueAccent.shade200,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.blueAccent,
      systemNavigationBarDividerColor: Colors.pinkAccent,
      systemNavigationBarIconBrightness: Brightness.light ));
  
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      
      return Scaffold(
                body: LoginForm(authenticationBloc: _authenticationBloc,loginBloc: _loginBloc,)
      
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}