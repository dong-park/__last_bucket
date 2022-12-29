class SelectDateItem {
  final String day;
  final List<String> types;
  bool? isSelected = false;

  bool getSelected() {
    return isSelected ?? false;
  }

  void select() {
    isSelected = !getSelected();
  }

  SelectDateItem({required this.day, required this.types, this.isSelected});

}
