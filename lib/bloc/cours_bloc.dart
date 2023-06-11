import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../course/view/cours.dart';

part 'cours_event.dart';
part 'cours_state.dart';

class CoursBloc extends Bloc<CoursEvent, CoursState> {
  CoursBloc() : super(CoursInitial()) {
    on<CoursEvent>((event, emit) {
    if (event is FetchCours) {
      final box = Hive.box<Cours>('courbox4');
      final coursList = box.values.toList();
      emit(CoursLoaded(coursList));
    }
    });
  }
}
