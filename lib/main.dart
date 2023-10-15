import 'package:flutter/material.dart';
import 'package:pod_wave/screens/create_account.dart';
import 'package:pod_wave/screens/home.dart';
import 'package:pod_wave/screens/home_tab.dart';
import 'package:pod_wave/screens/select_page.dart';
import 'package:pod_wave/screens/start_screen.dart';

import 'screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pod Wave',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        StartScreen.id: (context) => const StartScreen(),
        CreateAccount.id: (context) => const CreateAccount(),
        SignIn.id: (context) => const SignIn(),
        SelectPage.id: (context) => const SelectPage(),
        HomeTab.id: (context) => const HomeTab(),
        HomeScreen.id: (context) => const HomeScreen(),
        // PlayerScreen.id: (context) => const PlayerScreen(),
      },
    );
  }
}
