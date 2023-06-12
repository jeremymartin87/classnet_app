abstract class TranslateEvent {

  TranslateEvent(this.selectedValue);
  final String selectedValue;
}

class TranslateChangedRequested extends TranslateEvent {
  TranslateChangedRequested(super.selectedValue);
}
