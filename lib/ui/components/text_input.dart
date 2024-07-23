import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String placeholder;
  final Icon icons;
  final Function(String) onChange;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.placeholder,
    required this.icons,
    required this.onChange,
    required this.controller,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF111111),
          hintText: widget.placeholder,
          hintStyle: const TextStyle(color: Color(0xFF636363)),
          prefixIcon: widget.icons,
          iconColor: const Color(0xFF636363),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0.5, color: Color(0xFFD7FC70)),
          ),
        ),
      ),
    );
  }
}
