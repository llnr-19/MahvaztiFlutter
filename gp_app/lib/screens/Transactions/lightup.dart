import 'package:flutter/material.dart';

class LightUpButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const LightUpButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: isSelected
            ? Color.fromARGB(255, 28, 6, 198).withOpacity(0.7)
            : Color.fromARGB(255, 47, 177, 237),
        fixedSize: const Size(150, 50),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        elevation: isSelected ? 0.0 : 4.0,
        shadowColor: Colors.lightBlueAccent.withOpacity(0.5),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 25.0),
      ),
    );
  }
}
