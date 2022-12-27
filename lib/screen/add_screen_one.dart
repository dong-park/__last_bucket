import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/Routine.dart';
import '../model/WeekItem.dart';
import 'main_screen.dart';

class AddOneScreen extends ConsumerStatefulWidget {
  const AddOneScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddOneScreenState();
  }
}

class _AddOneScreenState extends ConsumerState<AddOneScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Routine routine = ref.watch(routineProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const _Title(),
              // select imoji and input text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                                child: _DropDownEmoticons()),
                            Expanded(
                              flex: 8,
                              child: _InputText(
                                hintText: '루틴명을 입력해주세요',
                                value: routine.name,
                                onChanged: (value) {
                                  routine.name = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _InputText(
                          hintText: '상세설명',
                          value: routine.description,
                          onChanged: (value) {
                            routine.description = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _SelectTimes(),
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: ref.watch(weekItemsProvider).map((day) {
                          // 홀수 짝수에 따라 색상 변경
                          return _SelectTime(
                              time: day,
                              onTap: () {
                                renderSelectTime(day);
                              });
                        }).toList(),
                      ),
                      // _DragProgressBar(
                      //   count: count,
                      //   onChanged: onChangeCount,
                      // ),
                    ],
                  ),
                ),
              ),
              // bottom button
              _BottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  void renderSelectTime(day) {
    setState(() {
      {
        // all check
        day.isSelected = !day.isSelected;
        List weekItems = ref.watch(weekItemsProvider);
        if (day.day == "매일") {
          weekItems
              .where((element) => element.types.contains('매일'))
              .forEach((element) {
            element.isSelected = day.isSelected;
          });
          weekItems
              .where((element) => !element.types.contains('매일'))
              .forEach((element) {
            element.isSelected = false;
          });
        } else if (day.day == "주중") {
          weekItems
              .where((element) => element.types.contains(day.day))
              .forEach((element) {
            element.isSelected = day.isSelected;
          });
          weekItems
              .where((element) => !element.types.contains(day.day))
              .forEach((element) {
            element.isSelected = false;
          });
        } else if (day.day == "주말") {
          weekItems
              .where((element) => element.types.contains(day.day))
              .forEach((element) {
            element.isSelected = day.isSelected;
          });
          weekItems
              .where((element) => !element.types.contains(day.day))
              .forEach((element) {
            element.isSelected = false;
          });
        } else {
          weekItems
              .where((element) => element.day == day.day)
              .forEach((element) {
            element.isSelected = day.isSelected;
          });
        }

        if (day.day != '매일' || day.day != '주중' || day.day != '주말') {
          List selectedWeekItems =
              weekItems.where((element) => element.isSelected).toList();
          bool isCheckMonday = selectedWeekItems
              .where((element) => element.day == '월')
              .toList()
              .isNotEmpty;
          bool isCheckTuesday = selectedWeekItems
              .where((element) => element.day == '화')
              .toList()
              .isNotEmpty;
          bool isCheckWednesday = selectedWeekItems
              .where((element) => element.day == '수')
              .toList()
              .isNotEmpty;
          bool isCheckThursday = selectedWeekItems
              .where((element) => element.day == '목')
              .toList()
              .isNotEmpty;
          bool isCheckFriday = selectedWeekItems
              .where((element) => element.day == '금')
              .toList()
              .isNotEmpty;
          bool isCheckSaturday = selectedWeekItems
              .where((element) => element.day == '토')
              .toList()
              .isNotEmpty;
          bool isCheckSunday = selectedWeekItems
              .where((element) => element.day == '일')
              .toList()
              .isNotEmpty;

          if (isCheckMonday &&
              isCheckTuesday &&
              isCheckWednesday &&
              isCheckThursday &&
              isCheckFriday &&
              isCheckSaturday &&
              isCheckSunday) {
            // 매일 체크
            weekItems
                .where((element) => element.day == '매일')
                .forEach((element) {
              element.isSelected = true;
            });
            weekItems
                .where((element) => element.day == '주중')
                .forEach((element) {
              element.isSelected = false;
            });
            weekItems
                .where((element) => element.day == '주말')
                .forEach((element) {
              element.isSelected = false;
            });
          } else {
            if (isCheckMonday &&
                isCheckTuesday &&
                isCheckWednesday &&
                isCheckThursday &&
                isCheckFriday &&
                !isCheckSaturday &&
                !isCheckSunday) {
              // 주중 체크
              weekItems
                  .where((element) => element.day == '주중')
                  .forEach((element) {
                element.isSelected = true;
              });
            } else {
              weekItems
                  .where((element) => element.day == '주중')
                  .forEach((element) {
                element.isSelected = false;
              });
            }
            if (isCheckSaturday &&
                isCheckSunday &&
                !isCheckMonday &&
                !isCheckTuesday &&
                !isCheckWednesday &&
                !isCheckThursday &&
                !isCheckFriday) {
              // 주말 체크
              weekItems
                  .where((element) => element.day == '주말')
                  .forEach((element) {
                element.isSelected = true;
              });
            } else {
              weekItems
                  .where((element) => element.day == '주말')
                  .forEach((element) {
                element.isSelected = false;
              });
            }
            weekItems
                .where((element) => element.day == '매일')
                .forEach((element) {
              element.isSelected = false;
            });
          }
        }
      }
    });
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: const Text(
        '루틴입력',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class _DropDownEmoticons extends StatelessWidget {
  const _DropDownEmoticons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Center(
        child: DropdownButton<String>(
          value: '💧',
          borderRadius: BorderRadius.circular(50),
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 0,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 0,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {

          },
          items: <String>['💧', '🥲', '😕', '😩']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: Alignment.center,
              child: Text(value, style: const TextStyle(fontSize: 30)),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _InputText extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  final String? value;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTab;

  _InputText(
      {Key? key,
      required this.hintText,
      this.value,
      this.onChanged,
      this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = TextEditingController(text: value);

    return Container(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTab,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // full width button
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('저장'),
      ),
    );
  }
}

class _SelectTimes extends StatelessWidget {
  const _SelectTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [],
    );
  }
}

class _SelectTime extends StatelessWidget {
  final WeekItem time;
  Border border = Border.all(color: Colors.grey);
  Color color = Colors.white;
  final GestureTapCallback onTap;

  _SelectTime({Key? key, required this.time, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: time.isSelected ? Colors.blue : Colors.white,
          border: border,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Text(
            time.day,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

class _DragProgressBar extends StatelessWidget {
  _DragProgressBar({Key? key, required this.count, required this.onChanged})
      : super(key: key);

  final double count;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    // 드래그가 가능한 progress bar
    return Container(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.blue,
          inactiveTrackColor: Colors.grey,
          trackShape: const RoundedRectSliderTrackShape(),
          trackHeight: 25.0,
          thumbColor: Colors.blue,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: Colors.blue.withAlpha(32),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
          tickMarkShape: const RoundSliderTickMarkShape(),
          activeTickMarkColor: Colors.blue,
          inactiveTickMarkColor: Colors.grey,
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.blue,
          valueIndicatorTextStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        child: Slider(
          value: count,
          min: 0,
          max: 10,
          divisions: 10,
          label: count.round().toString(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
