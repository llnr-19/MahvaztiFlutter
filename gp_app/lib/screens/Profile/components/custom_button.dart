import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.context,
    required this.onTap,
    required this.hintText,
    required this.color,
  });

  final BuildContext context;
  final Function() onTap;
  final String hintText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width * 0.4, MediaQuery.of(context).size.height * 0.06),
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(hintText),
      ),
    );
  }
}
