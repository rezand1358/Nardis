import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState extends Equatable {
  SearchState([Iterable props]) : super(props);

  /// Copy object for use in action
  SearchState getStateCopy();
}

/// UnInitialized
class UnSearchState extends SearchState {
  @override
  String toString() => 'UnSearchState';

  @override
  SearchState getStateCopy() {
    return UnSearchState();
  }
}

/// Initialized
class InSearchState extends SearchState {
  @override
  String toString() => 'InSearchState';

  @override
  SearchState getStateCopy() {
    return InSearchState();
  }
}
class DoneSearchState extends SearchState {
  @override
  String toString() => 'DoneSearchState';

  @override
  SearchState getStateCopy() {
    return DoneSearchState();
  }
}

class ErrorSearchState extends SearchState {
  final String errorMessage;

  ErrorSearchState(this.errorMessage);
  
  @override
  String toString() => 'ErrorSearchState';

  @override
  SearchState getStateCopy() {
    return ErrorSearchState(this.errorMessage);
  }
}
