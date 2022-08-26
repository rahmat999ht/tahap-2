import 'package:flutter/material.dart';
import 'package:tahap_2/views/my_home_page.dart';
// import 'package:tahap_2/views/my_home_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyHomePage2(),
      home: MyHomePage(title: 'Yayat'),
    );
  }
}
