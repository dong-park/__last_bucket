import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bucket/screen/main_screen.dart';

import 'model/Routine.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
          }),
    ),
  );
}
