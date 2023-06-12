part of 'errors_bloc.dart';

@immutable
abstract class ErrorsEvent {
  ErrorsEvent(this.selectedValue);
  final String selectedValue;
}

class FetchErrors extends ErrorsEvent {
  FetchErrors(super.selectedValue);
}
