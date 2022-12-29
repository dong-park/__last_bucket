import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bucket/layout/search_layout.dart';
import 'package:last_bucket/screen/add_screen_one.dart';

import '../main.dart';
import '../model/Routine.dart';

class PresetScreen extends ConsumerWidget {
  const PresetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Routine firstPresets = Routine();
    firstPresets.name = 'First Preset';
    firstPresets.description = 'First Preset Description';

    List<Widget> presetCards = List.generate(50, (index) => index + 1)
        .map((e) => _PresetCard(
              routine: firstPresets,
              onTap: () {
                ref
                    .watch(routineProvider)
                    .setPreset(name: '아침', description: '아침에 물을 마시고 아침밥을 먹는다');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddOneScreen()),
                );
              },
            ))
        .toList();

    return SearchLayout(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: presetCards,
            )
          ]),
        ));
  }
}

class _PresetCard extends StatelessWidget {
  final Routine routine;
  final VoidCallback onTap;

  const _PresetCard({
    Key? key,
    required this.routine,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: onTap,
    //   child: RoutineCard(
    //     title: routine.name,
    //     subtitle: routine.description,
    //     icon: routine.icon.icon ?? Icons.ac_unit,
    //     color: routine.color,
    //     isDone: routine.isDone,
    //     doneCallback: () {},
    //   ),
    // );
    return Container();
  }
}
