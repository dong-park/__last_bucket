import 'package:flutter/material.dart';

import '../component/bottom_navigation_bar.dart';
import '../screen/add_screen_one.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }
}
