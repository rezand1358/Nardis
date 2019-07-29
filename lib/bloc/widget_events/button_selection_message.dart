



import 'package:nardis/bloc/widget_events/ButtonDefinition.dart';

class ButtonSelectionMessage
{

  final ButtonDefinition buttonDefinition;
  final bool isSelected;

  ButtonSelectionMessage(this.buttonDefinition,this.isSelected);
}