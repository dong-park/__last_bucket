import 'package:flutter/material.dart';
import 'package:last_bucket/screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? const MainScreen()
            : const _SplashScreen();
      },
    ));
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
