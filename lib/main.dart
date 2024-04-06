import 'package:banking_app/screens/OnBoardScreen.dart';
import 'package:banking_app/screens/analyticsPage.dart';
import 'package:banking_app/screens/history.dart';
import 'package:banking_app/screens/homePage.dart';
import 'package:banking_app/screens/settings.dart';
import 'package:banking_app/screens/transactionPage.dart';
import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/fonts/textStyle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
        textTheme: AppTextStyles.lightTextTheme,
        iconTheme: const IconThemeData(color: black),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
        textTheme: AppTextStyles.darkTextTheme,
        iconTheme: const IconThemeData(color: white),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/onBoardScreen',
      routes: {
        '/onBoardScreen': (context) => const OnBoardScreen(),
        '/home': (context) => const HomePage(),
        '/analytics': (context) => const AnalyticsPage(),
        '/history': (context) => const Historypage(),
        '/settings': (context) => const SettingPage(),
        '/transfer': (context) => const TransactionPage(),
      },
    );
  }
}
