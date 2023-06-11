abstract class DropdownEvent {

  DropdownEvent(this.selectedValue);
  final String selectedValue;
}

class DropdownChangedRequested extends DropdownEvent {
  DropdownChangedRequested(super.selectedValue);
}
