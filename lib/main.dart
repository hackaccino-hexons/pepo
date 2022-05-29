import 'package:flutter/cupertino.dart';
import 'package:pepo/screens/home.dart';
import 'package:pepo/screens/home_no_auth.dart';
import 'package:pepo/screens/splash.dart';
import 'package:pepo/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: themeData,
      routes: {
        '/': (_) => const SplashScreen(),
        '/home_no_auth': (_) => const HomeScreenNotAuthenticated(),
        '/home': (_) => const HomeScreen()
      },
    );
  }
}