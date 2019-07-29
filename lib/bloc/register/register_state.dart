import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterState extends Equatable {
  RegisterState([Iterable props]) : super(props);

  /// Copy object for use in action
  RegisterState getStateCopy();
}

class UnRegisterState extends RegisterState {
@override
  String toString() => 'UnRegisterState';

  @override
  RegisterState getStateCopy() {
    return UnRegisterState();
  }

}

class InRegisterState extends RegisterState {

  @override
  String toString() => 'InRegisterState';

  @override
  RegisterState getStateCopy() {
    return InRegisterState();
  }
}

class RegisteredState extends RegisterState {

  @override
  String toString() => 'RegisteredState';

  @override
  RegisterState getStateCopy() {
    return RegisteredState();
  }
}

class ErrorRegisterState extends RegisterState {
  final String errorMessage;

  ErrorRegisterState(this.errorMessage);
  
  @override
  String toString() => 'ErrorRegisterState';

  @override
  RegisterState getStateCopy() {
    return ErrorRegisterState(this.errorMessage);
  }
}