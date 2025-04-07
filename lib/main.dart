import 'package:flutter/material.dart';
import 'package:healthclick_app/models/CartProvider.dart';
import 'package:healthclick_app/screens/auth/Login.dart';
// import 'package:healthclick_app/screens/welcome/HomePage.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaudeClick',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
