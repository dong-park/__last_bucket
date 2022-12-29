import 'package:flutter/material.dart';
import 'package:last_bucket/screen/preset_routine_screen.dart';
import 'package:last_bucket/screen/routine_screen.dart';

import '../component/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  String title = '';


  @override
  Widget build(BuildContext context) {
    renderPage(currentIndex);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white,
            elevation: 0, // border 없음
            centerTitle: false, // border left align
            automaticallyImplyLeading: false, // back icon none
          ),
          bottomSheet: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTab: (index) {
              setState(() {
                currentIndex = index;
                renderPage(index);
              });
            },
          ),
          // body add child then padding bottomSheet height
          body: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: renderPage(currentIndex),
          ),
        ),
      ),
    );
  }

  Widget renderPage(index) {
    if (index == 0) {
      title = 'Routine';
      return const RoutineScreen();
    } else if (index == 1) {
      title = 'Preset';
      return const PresetScreen();
    } else if (index == 2) {
      return Container();
    } else {
      return Container();
    }
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // input text
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
