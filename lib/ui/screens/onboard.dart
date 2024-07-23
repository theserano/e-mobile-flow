import 'dart:ffi';
import 'package:flow/data/onboard_data.dart';
import 'package:flow/ui/components/button.dart';
import 'package:flow/ui/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class Onboard extends StatefulWidget {
  final int page;
  const Onboard({
    super.key,
    this.page = 0
  });

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.page;
    _controller = PageController(initialPage: widget.page);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
            itemCount: contents.length,
            controller: _controller,
            onPageChanged: (int value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  SvgPicture.asset(
                    contents[index].image,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        contents.length, (index) => buildDot(index, context)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 500)),
                      SlideEffect(
                        begin: Offset(0, 1),
                        end: Offset.zero,
                        duration: Duration(milliseconds: 200),
                      ),
                    ],
                    child: buildBottomContainer(index),
                  ),
                ],
              );
            },
          )),
        ],
      ),
    );
  }


  Widget buildBottomContainer(int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 320,
      decoration: const BoxDecoration(
          color: Color(0xFF000000),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            contents[index].title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(contents[index].description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF808080), fontSize: 14)),
          const SizedBox(
            height: 30,
          ),
          MyButton(
            onPressed: () {
              if(currentIndex == contents.length - 1){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              }
              _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
            },
            text: 'Next',
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(color: Color(0xFF808080)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      child: currentIndex == index
          ? Container(
              width: 25,
              height: 7,
              margin: const EdgeInsets.only(left: 3.0, right: 3.0),
              decoration: const BoxDecoration(
                  color: Color(0xFFD7FC70),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            )
          : Container(
              width: 7,
              height: 7,
              margin: const EdgeInsets.only(left: 3.0, right: 3.0),
              decoration: const BoxDecoration(
                  color: Color(0xFF98999A),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
    );
  }
}
