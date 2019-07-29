import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PressedEvent extends Equatable {
    PressedEvent([List props = const []]) : super(props);
}


class StartPressed extends PressedEvent {}

class Pressed extends PressedEvent 
{
 final BuildContext context;
   Pressed(this.context) : super([context]);

}
