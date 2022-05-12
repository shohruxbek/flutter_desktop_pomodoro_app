import 'package:flutter/material.dart';
import 'package:win/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}
//@mystaruz and @the_flutter
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter First Apps',
      home: HomeScreen(),
    );
  }
}
