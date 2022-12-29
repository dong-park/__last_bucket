import 'package:flutter/material.dart';

import '../screen/add_screen_one.dart';

class BlankLayout extends StatelessWidget {
  const BlankLayout({Key? key, required this.child, required this.title})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // back icon back button icon color is black
            iconTheme: const IconThemeData(color: Colors.black),
            // back icon change
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            backgroundColor: Colors.white,
            // border 없음
            elevation: 0,
            // border left align
            centerTitle: false,
          ),
          body: child,
        ),
      ),
    );
  }
}
