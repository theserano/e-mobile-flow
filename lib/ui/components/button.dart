import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
        decoration: BoxDecoration(
          color: isPressed ? Colors.greenAccent : const Color(0xFFD7FC70),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
                onPressed: widget.onPressed,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFFD7FC70)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}