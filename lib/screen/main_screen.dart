import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bucket/screen/add_screen_one.dart';

import '../model/Routine.dart';
import '../model/WeekItem.dart';

final routineProvider = Provider<Routine>((_) => Routine());
final routeProvider = Provider((ref) => Routine());
final weekItemsProvider = Provider((ref) => [
  WeekItem(day: "월", types: ["매일", "주중"]),
  WeekItem(day: "화", types: ["매일", "주중"]),
  WeekItem(day: "수", types: ["매일", "주중"]),
  WeekItem(day: "목", types: ["매일", "주중"]),
  WeekItem(day: "금", types: ["매일", "주중"]),
  WeekItem(day: "토", types: ["매일", "주말"]),
  WeekItem(day: "일", types: ["매일", "주말"]),
  WeekItem(day: "매일", types: ["매일"]),
  WeekItem(day: "주중", types: ["주중"]),
  WeekItem(day: "주말", types: ["주말"]),
]);
final filterItemProvider = Provider((ref) => [
  {"name": "매일", "isSelected": false},
  {"name": "주중", "isSelected": false},
  {"name": "주말", "isSelected": false},
]);
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: // 3초후에 메인화면으로 이동
            FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _MainScreen();
        }
        return const _SplashScreen();
      },
    ));

    // return _MainScreen();
  }
}

class _MainScreen extends ConsumerWidget {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

        //add floatingActionButton position is bottom center
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddOneScreen()),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
        // bottomSheet: _BottomNavigationBar(),
        appBar: AppBar(
          title: const Text('오늘의 루틴', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
        body: Container(
            child: ListView(children: [
          _WrapCard(title: '아침', cards: [
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
          ]),
          _WrapCard(title: '점심', cards: [
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
          ]),
          _WrapCard(title: '저녁', cards: [
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _Card(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
            _ProgressBarTypeCard(
              title: '물마시기',
              subtitle: '오늘의 할일을 입력해주세요',
              icon: Icons.local_drink,
              color: Colors.blue,
            ),
          ]),
        ])));
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              children: [
                Text('대충로고'),
                Text('Day To Year'),
                CircularProgressIndicator(),
              ],
            ),
            const Text('동박이네')
          ],
        ),
      ),
    );
  }
}

class _WrapCard extends StatelessWidget {
  const _WrapCard({Key? key, required this.title, required this.cards})
      : super(key: key);

  final String title;
  final List<_CardInterface> cards;

  @override
  Widget build(BuildContext context) {
    // title around border
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ))
            ],
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: cards,
          )
        ],
      ),
    );
  }
}

abstract class _CardInterface extends StatelessWidget {
  String get title;

  String get subtitle;

  IconData get icon;

  Color get color;

  const _CardInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}

class _Card extends _CardInterface {
  const _Card({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final IconData icon;
  @override
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _ProgressBarTypeCard extends _CardInterface {
  const _ProgressBarTypeCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final IconData icon;
  @override
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 320,
      height: 150,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      // progress bar 형태
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: 0.5,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: '홈', backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: '전체루틴', backgroundColor: Colors.blue),
      ],
    );
  }
}
