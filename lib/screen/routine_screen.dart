import 'package:flutter/material.dart';

import '../component/card_component.dart';
import '../model/Routine.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _RoutineScreenState();
  }
}

class _RoutineScreenState extends State<RoutineScreen> {
  List<Routine> routines = [];

  @override
  Widget build(BuildContext context) {
    routines = [];
    for (int i = 0; i < 10; i++) {
      var routine = Routine();
      routine.key = i;
      routine.name = '물먹기';
      routine.description = '아침에 물을 마시고 아침밥을 먹는다';
      routine.icon = Icon(Icons.water_drop_rounded, color: Colors.white);
      routine.dragItem = i.toDouble();
      routines.add(routine);
    }

    List<RoutineCard> routineCards = routines
        .map((e) {
          return RoutineCard(
            routine: e,
            doneCallback: (value) {
            },
    );
        })
        .toList();

    return Container(
      color: Colors.white,
      child: ListView(
          // 간격 조절
          padding: const EdgeInsets.all(8),
          // 간격 조절
          children: [
            _WrapCard(title: '☀️', cards: routineCards),
          ]),
    );
  }
}

class _WrapCard extends StatelessWidget {
  const _WrapCard({Key? key, required this.title, required this.cards})
      : super(key: key);

  final String title;
  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    // add first card
    final firstCard = TitleCard(
      title: title,
      color: Colors.transparent,
    );
    List<Widget> cardList = [firstCard];

    cardList.addAll(cards);

    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: cardList,
    );
  }
}
