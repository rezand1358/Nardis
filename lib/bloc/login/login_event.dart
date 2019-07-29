import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final String code;

  LoginButtonPressed({
    @required this.username,
    @required this.password,
    @required this.code,

  }) : super([username, password,code]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password, code: $code }';
}