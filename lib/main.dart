import 'package:flutter/cupertino.dart';
import 'package:pepo/screens/home.dart';
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
        '/': (ctx) => SplashScreen(ctx),
        '/home_no_auth': (_) => const HomeScreenNotAuthenticated()
      },
    );
  }
}