import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 150,
          height: 50,
          child: SvgPicture.asset('lib/assets/Shop.svg'),
        ),
        Positioned(
          left: 47,
          top: 5,
          child: SvgPicture.asset('lib/assets/Union.svg'),
        ),
        Animate(
          effects: const [
            FadeEffect(begin: 0.0, end: 1.0, duration: Duration(seconds: 1))
          ],
          delay: const Duration(seconds: 1),
          onComplete: (controller) => {controller.repeat()},
          child: Positioned(
            left: 140,
            bottom: 10,
            child: SvgPicture.asset('lib/assets/dot.svg'),
          ),
        )
      ],
    );
  }
}
