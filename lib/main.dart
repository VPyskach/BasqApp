import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: AppHomePage(),
    );
  }

  MaterialColor primaryColor = const MaterialColor(
    0xFF96CC5B,
    const <int, Color>{
      50: const Color(0xFF96CC5B),
      100: const Color(0xFF96CC5B),
      200: const Color(0xFF96CC5B),
      300: const Color(0xFF96CC5B),
      400: const Color(0xFF96CC5B),
      500: const Color(0xFF96CC5B),
      600: const Color(0xFF96CC5B),
      700: const Color(0xFF96CC5B),
      800: const Color(0xFF96CC5B),
      900: const Color(0xFF96CC5B),
    },
  );
}
