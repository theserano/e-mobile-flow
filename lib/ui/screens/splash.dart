import 'package:flow/ui/screens/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Onboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 150,
              height: 50,
              child: SvgPicture.asset('lib/assets/Shop.svg'),
            ),
            Animate(
              delay: const Duration(seconds: 1),
              effects: const [
                SlideEffect(
                  begin: Offset(0.0, -5.0),
                  end: Offset(0.0, 0.0),
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 500),
                ),
                FadeEffect(
                  begin: FlipEffect.defaultValue,
                  end: BlurEffect.defaultBlur
                )
              ],
              child: Positioned(
                left: 47,
                top: 5,
                child: SvgPicture.asset('lib/assets/Union.svg'),
              ),
            ),
            Animate(
              effects: const [
                FadeEffect(
                  begin: 0.0,
                  end: 1.0,
                  duration: Duration(seconds: 1)
                )
              ],
              delay: const Duration(seconds: 1),
              onComplete: (controller) => {
                controller.repeat()
              },
              child: Positioned(
                left: 140,
                bottom: 10,
                child: SvgPicture.asset('lib/assets/dot.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
