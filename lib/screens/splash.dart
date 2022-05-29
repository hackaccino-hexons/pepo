import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pepo/widgets/canvas/circle.dart';
import 'package:pepo/widgets/canvas/rectangle.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Soundpool sound_pool;
  late int soundId;

  late FlutterSecureStorage secure_storage;

  Future<int> loadSound() async {
    int soundId = await rootBundle.load("assets/pepo.ogg").then((ByteData soundData) {
      return sound_pool.load(soundData);
    });

    return soundId;
  }

  @override
  void initState() {
    super.initState();

    secure_storage = const FlutterSecureStorage();
    sound_pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  }

  @override
  void dispose() {
    sound_pool.dispose();
    super.dispose();
  }

  void playSound (soundId) {
    sound_pool.play(soundId);
  }

  Future<bool> isLoggedIn() async {
    await secure_storage.write(key: "is_logged_in", value: "0"); //FIXME: remove after testing
    return await secure_storage.read(key: "is_logged_in") == "1";
  }

  void doneWithSplash() async {
    String moveTo = await isLoggedIn() ? '/home' : '/home_no_auth';
    Navigator.popAndPushNamed(
        context,
        moveTo
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () async {
      int soundId = await loadSound();

      // Play the pepo welcome sound
      await sound_pool.play(soundId);
      await Future.delayed(const Duration(seconds: 1));

      // Pop the current route
      // And push a new route
      doneWithSplash();
    });

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFCC2C5), Color(0xFFFF464F)],
            transform: GradientRotation(120.2),
          )
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CustomPaint(
              // size: Size(141, 138),
              painter: DrawRectangle(height: 138, width: 141, radius: 25),
            ),
            Container(
              width: 204,
              height: 174,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/yaa.gif"), fit: BoxFit.fill),
              )
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Pep",
                    style: TextStyle(
                        fontSize: 60,
                        color: Color(0xFFFFFFFF)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CustomPaint(
                        painter: DrawCircle(
                            const Color(0xFFFFFFFF),
                            PaintingStyle.fill,
                            offset: const Offset(0, 0),
                            radius: 30.0
                        ),
                      ),
                      Image.asset(
                          "assets/piggy_front.png",
                          scale: 7,
                      )
                    ],
                  )
                ],
              )
          ]
        )
      )
    );
  }
}
