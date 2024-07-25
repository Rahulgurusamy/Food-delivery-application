import 'package:flutter/material.dart';
import 'package:food/providers/auth_provider.dart';
import 'package:food/providers/feedback_provider.dart';
import 'package:food/screens/help_center.dart';
import 'package:food/screens/login_page.dart';
import 'package:food/screens/signup_page.dart';
import 'package:provider/provider.dart';
import 'providers/food_provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => FoodProvider()),
        ChangeNotifierProvider(create: (context) => FeedbackProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/help_center': (context) => const HelpCenterPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}