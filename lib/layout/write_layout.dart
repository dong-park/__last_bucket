import 'package:flutter/material.dart';

import '../screen/add_screen_one.dart';

class WriteLayout extends StatelessWidget {
  const WriteLayout({Key? key, required this.child, required this.title})
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
            //back icon back button icon color is black
            iconTheme: const IconThemeData(color: Colors.black),
            // back icon none
            automaticallyImplyLeading: false,
            // right icon '취소' '완료'
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '취소',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],


            title: Text(title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
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
