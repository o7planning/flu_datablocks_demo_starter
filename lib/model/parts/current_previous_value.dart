class CurrentPreviousValue {
  late String dataName;
  late double currentValue;
  late double previousValue;
  late bool isMoney;

  CurrentPreviousValue({
    required this.dataName,
    required this.currentValue,
    required this.previousValue,
    required this.isMoney,
  });

  factory CurrentPreviousValue.zero(String dataName) {
    return CurrentPreviousValue(
      dataName: dataName,
      currentValue: 0,
      previousValue: 0,
      isMoney: false,
    );
  }
}
