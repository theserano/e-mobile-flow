import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
            onPressed: onPressed,
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFD7FC70)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
                padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          );
  }
}