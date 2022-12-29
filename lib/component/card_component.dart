import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animator/flutter_animator.dart';

import '../model/Routine.dart';

abstract class CardInterface extends StatelessWidget {
  width(context) => MediaQuery.of(context).size.width;

  height() => 90.0;
  final double? customHeight;

  Widget rednerWidget();

  const CardInterface({Key? key, this.customHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: customHeight ?? height(),
      child: rednerWidget(),
    );
  }
}

class TitleCard extends CardInterface {
  final String title;
  final Color color;

  TitleCard({Key? key, required this.title, required this.color})
      : super(key: key, customHeight: 50);

  @override
  Widget rednerWidget() {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(title,
              style: const TextStyle(fontSize: 30, color: Colors.white))),
    );
  }
}

class RoutineCard extends StatefulWidget {
  // final String title;
  // final String subtitle;
  // final IconData icon;
  // final Color color;
  final Function(String) doneCallback;
  final double? customHeight;
  final Routine routine;

  RoutineCard(
      {Key? key,
      required this.routine,
      required this.doneCallback,
      this.customHeight})
      : super(key: key);

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  final GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  final animPreference =
      const AnimationPreferences(autoPlay: AnimationPlayStates.None);

  width(context) => MediaQuery.of(context).size.width;

  height() => 90.0;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: widget.customHeight ?? height(),
      child: rednerWidget(),
    );
  }

  Widget rednerWidget() {
    return GestureDetector(
      onTap: () {
        if (widget.routine.dragItem > widget.routine.currentDragItem) {
          setState(() {
            widget.routine.currentDragItem++;
          });
          if (widget.routine.dragItem == widget.routine.currentDragItem) {
            _key.currentState?.forward();
            setState(() {
              widget.routine.isDone = !widget.routine.isDone;
            });
          }
        } else {
          _key.currentState?.forward();
          setState(() {
            if (widget.routine.isDone) {
              widget.routine.currentDragItem = 0;
            } else {
              widget.routine.currentDragItem = widget.routine.dragItem;
            }
            widget.routine.isDone = !widget.routine.isDone;
          });
        }
      },
      child: AnimatorWidget(
        key: _key,
        definition: HeadShakeAnimation(preferences: animPreference),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.routine.dragItem > 0)
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: // absoulte로 아이콘 위치를 잡아줘야 한다.
                        Stack(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                                widget.routine.dragItem.toInt(),
                                (index) => Container(
                                      // dragItem limit 칸이 존재한다
                                      width: widget.routine.dragItem.toInt() > 0
                                          ? 50 / widget.routine.dragItem.toInt()
                                          : 100,
                                      decoration: BoxDecoration(
                                        color: widget.routine.currentDragItem >
                                            index
                                            ? Colors.green
                                            : Colors.transparent,
                                        borderRadius: widget.routine.dragItem
                                            .toInt() ==
                                            1
                                            ? BorderRadius.circular(10)
                                            :
                                        // 양 끝은 둥글게, 홀수도 감안 해서, 1인경우 전체 둥글게
                                        index == 0
                                            ? const BorderRadius.only(
                                            topLeft:
                                            Radius.circular(10),
                                            bottomLeft:
                                            Radius.circular(10))
                                            : index ==
                                            widget.routine.dragItem
                                                .toInt() -
                                                1
                                            ? const BorderRadius.only(
                                            topRight:
                                            Radius.circular(10),
                                            bottomRight:
                                            Radius.circular(10))
                                            : BorderRadius.zero,
                                      ),
                                    )),
                          ),
                        ),
                        Center(child: widget.routine.icon),
                      ],
                    ),
                  )
                else
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: widget.routine.isDone
                          ? Colors.green
                          : Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: widget.routine.icon),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.routine.name,
                          style: const TextStyle(fontSize: 20)),
                      Text(widget.routine.description,
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                // 횟수
              ],
            ),
          ),
        ),
      ),
    );
  }
}
