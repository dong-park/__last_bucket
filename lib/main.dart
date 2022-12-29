import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bucket/screen/main_screen.dart';
import 'package:last_bucket/screen/routine_screen.dart';
import 'package:last_bucket/screen/preset_routine_screen.dart';
import 'package:last_bucket/screen/splash_screen.dart';

import 'model/Routine.dart';

final routineProvider = Provider<Routine>((_) => Routine());

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) =>  const MainScreen(),
          }),
    ),
  );
}
