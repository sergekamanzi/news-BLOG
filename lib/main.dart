import 'package:flutter/material.dart';
import 'welcome.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) => WelcomePage(), // Welcome screen
        '/screen2': (context) => Screen2(), // Screen 2
        '/screen3': (context) => Screen3(), // Screen 3
      },
    );
  }
}
