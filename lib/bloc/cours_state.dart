part of 'cours_bloc.dart';

@immutable
abstract class CoursState {}

class CoursInitial extends CoursState {}




class CoursEmpty extends CoursState {}

class CoursLoaded extends CoursState {
  final List<Cours> coursList;

  CoursLoaded(this.coursList);
}