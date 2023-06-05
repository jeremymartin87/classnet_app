import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



const List<String> list = ['English', 'Français'];

abstract class DropdownEvent {
  final String selectedValue;

  DropdownEvent(this.selectedValue);

}

class DropdownState {
  final String selectedValue;
  final Locale locale;
  DropdownState(this.selectedValue,this.locale);
}

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(DropdownState(list.first, Locale('en', ''))) {
    on<DropdownChangedRequested>((event, emit) async {
      Locale language = Locale('en', '');
      switch (event.selectedValue) {
        case 'English':
          language = Locale('en', '');
          break;
        case 'Français':
          language = Locale('fr', '');
          break;
      }
      emit(DropdownState(event.selectedValue, language));
    });
  }
}

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: const Center(
          child: DropdownButtonExample(),
        ),
    );
  }
}
class DropdownChangedRequested extends DropdownEvent{
  DropdownChangedRequested(super.selectedValue);
}
class DropdownButtonExample extends StatelessWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropdownBloc = BlocProvider.of<DropdownBloc>(context);

    return BlocBuilder<DropdownBloc, DropdownState>(
      builder: (context, state) {

        return DropdownButton<String>(
          value: state.selectedValue,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            if (value != null) {
              dropdownBloc.add(DropdownChangedRequested(value));

            }
          },
          items: list.map<DropdownMenuItem<String>>((String value) {

            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(super.initialState);

  void changeLang(String data) async {
    emit(Locale(data, ''));
  }
}
