part of 'errors_bloc.dart';

const List<String> list = ['Initialisation Hive', 'Erreur Flutter', 'Autres'];

@immutable
abstract class ErrorsState {}

class ErrorsInitial extends ErrorsState {
  ErrorsInitial(this.selectedValue);
  final String selectedValue;
}


