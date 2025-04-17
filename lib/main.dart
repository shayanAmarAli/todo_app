import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/screens/home_page.dart';

void main() async {
  // Make the function async and initialize the hive
  await Hive.initFlutter();

  // open the box
  await Hive.openBox('my_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
