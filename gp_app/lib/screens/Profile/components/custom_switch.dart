import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool isSwitched;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.isSwitched,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isSwitched);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.width * 0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.05),
          color: isSwitched ? Colors.blue : Color.fromARGB(255, 66, 66, 66),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 150),
          alignment: isSwitched ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.065,
            height: MediaQuery.of(context).size.width * 0.065,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
