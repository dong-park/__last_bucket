import 'package:flutter/material.dart';

import 'SelectDateItem.dart';

enum TimeType { morning, lunch, dinner }

class Routine {
  String name = "";
  String description = "";
  List<SelectDateItem> days = [
    SelectDateItem(day: "월", types: ["매일", "주중"]),
    SelectDateItem(day: "화", types: ["매일", "주중"]),
    SelectDateItem(day: "수", types: ["매일", "주중"]),
    SelectDateItem(day: "목", types: ["매일", "주중"]),
    SelectDateItem(day: "금", types: ["매일", "주중"]),
    SelectDateItem(day: "토", types: ["매일", "주말"]),
    SelectDateItem(day: "일", types: ["매일", "주말"]),
    SelectDateItem(day: "매일", types: ["매일"]),
    SelectDateItem(day: "주중", types: ["주중"]),
    SelectDateItem(day: "주말", types: ["주말"]),
  ];
  List<SelectDateItem> sections = [
    SelectDateItem(day: "아침", types: []),
    SelectDateItem(day: "점심", types: []),
    SelectDateItem(day: "저녁", types: []),
  ];
  double dragItem = 0;
  double currentDragItem = 0;
  Icon icon = Icon(Icons.local_drink);
  Color color = Colors.blue;
  bool isDone = false;
  int key = 0;

  Routine();

  void addRoutine() {

  }

  void setPreset({required String name, required String description}) {
    this.name = name;
    this.description = description;
    days = [
      SelectDateItem(day: "월", types: ["매일", "주중"]),
      SelectDateItem(day: "화", types: ["매일", "주중"]),
      SelectDateItem(day: "수", types: ["매일", "주중"]),
      SelectDateItem(day: "목", types: ["매일", "주중"]),
      SelectDateItem(day: "금", types: ["매일", "주중"]),
      SelectDateItem(day: "토", types: ["매일", "주말"]),
      SelectDateItem(day: "일", types: ["매일", "주말"]),
      SelectDateItem(day: "매일", types: ["매일"]),
      SelectDateItem(day: "주중", types: ["주중"]),
      SelectDateItem(day: "주말", types: ["주말"]),
    ];

    sections = [
      SelectDateItem(day: "아침", types: [], isSelected: name == "아침" ? true : false),
      SelectDateItem(day: "점심", types: [], isSelected: name == "점심" ? true : false),
      SelectDateItem(day: "저녁", types: [], isSelected: name == "저녁" ? true : false),
    ];
    dragItem = 0;
  }

  getIcon() {
    return icon;
  }
}
