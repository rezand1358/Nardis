import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
abstract class CartEvent extends Equatable {
  CartEvent([List props = const []]) : super(props);
}

class StartEvent extends CartEvent
{
  int count=0;
  double amount;

  StartEvent({@required this.count,@required this.amount}) : super([count,amount]);
  
  @override
  String toString() => "Start { count: $count,amount: $amount }";
}

class IncrementEvent extends CartEvent {

  int count;
  double amount;
  String code;
IncrementEvent({this.count,this.amount,this.code});

  @override
  String toString() => "Increment { count: $count,amount: $amount ,code: $code}";
}

class DecrementEvent extends CartEvent {
  
  int count;
  double amount;
  String code;
  DecrementEvent({this.count,this.amount,this.code});

    @override
  String toString() => "Decrement { count: $count,amount: $amount , code: $code}";
}

class ResetCartEvent extends CartEvent {
  int count;
  double amount;
  String code;
  ResetCartEvent({this.count,this.amount,this.code});

    @override
  String toString() => "Reset { count: $count,amount: $amount, code: $code }";
}

