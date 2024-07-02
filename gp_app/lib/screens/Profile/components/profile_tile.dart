import 'package:flutter/material.dart';

class profile_tile extends StatelessWidget {
  const profile_tile({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final BuildContext context;
  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
