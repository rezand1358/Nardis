import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PressedState extends Equatable {
  PressedState([List props = const []]) : super(props);
}
  
class InitialPressedState extends PressedState {}

class DoClick extends PressedState {
  final BuildContext context;
  DoClick(this.context) : super([context]);
}
