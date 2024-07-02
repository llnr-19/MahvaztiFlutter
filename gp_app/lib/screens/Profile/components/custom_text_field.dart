import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.context,
    required this.onTap,
    required this.hintText,
    required this.keyboardType,
  });

  final BuildContext context;
  final Function() onTap;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onTap: onTap,
      onTapOutside: (event){
        focusNode.unfocus();
      },
      onChanged: (value) {
        focusNode.requestFocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      ),
      keyboardType: keyboardType,
    );
  }
}
