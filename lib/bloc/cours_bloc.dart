import 'package:bloc/bloc.dart';
import 'package:classnet_app/model/hive/hive_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:classnet_app/main.dart';
import '../course/view/cours.dart';

part 'cours_event.dart';
part 'cours_state.dart';

class CoursBloc extends Bloc<CoursEvent, CoursState> {
  CoursBloc() : super(CoursInitial()) {
    on<CoursEvent>((event, emit) async {
    if (event is FetchCours) {
      var hiveBoxes = HiveConfig.getHiveBoxes();
       Hive.box<Cours>(hiveBoxes).close();
       print( Hive.box<Cours>(hiveBoxes).close() );// Fermer la boîte ici
        final coursBox = Hive.box<Cours>(hiveBoxes); // Réouvrir la boîte ici
        final coursList = coursBox.values.toList();

        print(coursList);



      emit(CoursLoaded(coursBox.values.toList()));
    }
    });
  }
}
