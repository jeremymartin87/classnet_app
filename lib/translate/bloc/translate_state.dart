import 'package:flutter/material.dart';

const List<String> list = ['English', 'Français'];

class DropdownState {

  DropdownState(this.selectedValue, this.locale);
  final String selectedValue;
  final Locale locale;
}
