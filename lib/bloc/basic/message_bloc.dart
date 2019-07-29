import 'dart:async';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/models/message.dart';
import 'package:rxdart/rxdart.dart';

class MessageBloc implements BlocBase {
  /// Sinks
  Sink<Message> get addition => messageAdditionController.sink;
  final messageAdditionController = StreamController<Message>();

  /// Streams
  Stream<Message> get messageStream => _message.stream;
  final _message = BehaviorSubject<Message>();

  MessageBloc() {
    messageAdditionController.stream.listen(handleMessageAdd);
  }

  ///
  /// Logic for message added .
  ///
  void handleMessageAdd(Message msg) {
    _message.add(msg);
    return;
  }

  @override
  void dispose() {
    messageAdditionController.close();
  }
}