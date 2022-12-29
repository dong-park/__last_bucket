import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final ValueChanged onTab;
  final int currentIndex;

  const CustomBottomNavigationBar({Key? key, required this.onTab, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      // 그림자 없애기
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: onTab,
      items: const [
        // onTap: () => Navigator.pushNamed(context, '/'),
        BottomNavigationBarItem(
            icon: Icon(Icons.today), label: '', backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: '', backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
            backgroundColor: Colors.blue),
      ],
    );
  }
}
