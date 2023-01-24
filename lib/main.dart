import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class LogiUI extends StatelessWidget {
  const LogiUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false;
      title: "Login",
      theme: ThemeData(

       primarySwatch: Colors.black,
      ),
      home login page
    );
  }
}