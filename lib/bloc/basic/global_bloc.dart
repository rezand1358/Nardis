

import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/message_bloc.dart';
import 'package:nardis/bloc/search/SearchBloc.dart';
import 'package:nardis/bloc/shopcart/shoppingcart_bloc.dart';
import 'package:nardis/bloc/search/index.dart' as searchbloc2;

class GlobalBloc implements BlocBase {
  ShoppingCartBloc shoppingCartBloc;
  MessageBloc messageBloc;
  SearchBloc searchBloc;
  searchbloc2.SearchBloc searchEventBloc;
  GlobalBloc() {
    shoppingCartBloc = ShoppingCartBloc();
    messageBloc = MessageBloc();
    searchBloc=SearchBloc();
    searchEventBloc=new searchbloc2.SearchBloc();
  }

  void dispose() {
    shoppingCartBloc.dispose();
    messageBloc.dispose();
    searchBloc.dispose();
  }
}