import 'package:flutter/material.dart';

const List<String> list = ['English', 'Français'];

class TranslateState {

  TranslateState(this.selectedValue, this.locale);
  final String selectedValue;
  final Locale locale;
}
