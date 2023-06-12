import 'package:classnet_app/translate/bloc/translate_event.dart';
import 'package:classnet_app/translate/bloc/translate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  TranslateBloc() : super(TranslateState(list.first, const Locale('en', ''))) {
    on<TranslateChangedRequested>((event, emit) async {
      var language = const Locale('en', '');
      switch (event.selectedValue) {
        case 'English':
          language = const Locale('en', '');
          break;
        case 'Français':
          language = const Locale('fr', '');
          break;
      }
      emit(TranslateState(event.selectedValue, language));
    });
  }
}

class TranslateButtonApp extends StatelessWidget {
  const TranslateButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TranslateButtons(),
      ),
    );
  }
}

class TranslateButtons extends StatelessWidget {
  const TranslateButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final dropdownBloc = BlocProvider.of<TranslateBloc>(context);

    return BlocBuilder<TranslateBloc, TranslateState>(
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
              dropdownBloc.add(TranslateChangedRequested(value));
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

  Future<void> changeLang(String data) async {
    emit(Locale(data, ''));
  }
}
