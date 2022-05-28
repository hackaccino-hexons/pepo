import 'package:flutter/cupertino.dart';

class HomeScreenNotAuthenticated extends StatefulWidget {
  const HomeScreenNotAuthenticated({Key? key}) : super(key: key);

  @override
  State<HomeScreenNotAuthenticated> createState() => _HomeScreenNotAuthenticatedState();
}

class _HomeScreenNotAuthenticatedState extends State<HomeScreenNotAuthenticated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFE3A9), Color(0xFF73CAF2)],
                // begin: AlignmentDirectional.topStart,
                // end: AlignmentDirectional.bottomEnd,
               transform: GradientRotation(0.4)
              )
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/piggy_dotted.png",
                  scale: 1.5,
                ),
                Padding(padding: EdgeInsetsDirectional.only(top: 100)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton.filled(
                          child: Text("Sign Up"),
                          onPressed: () => {print("Sign Up button clicked")}
                      ),
                      Text("OR"),
                      CupertinoButton.filled(
                          child: Text("Login"),
                          onPressed: () => {print("Login button clicked")}
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsetsDirectional.only(top: 40)),
                Text("Claim your own piggy now!")
              ]
          ),
        )
    );
  }
}
