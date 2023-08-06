import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const InputTextFieldWidget({super.key, required this.textEditingController, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
      ),
    );
  }
}