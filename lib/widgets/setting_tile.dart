import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onpress,
      required this.color,
      required this.endIcon});
  final String title;
  final IconData icon;
  final VoidCallback onpress;
  final bool endIcon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
      ),
      trailing:endIcon? Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.black12),
        child: const Icon(Icons.arrow_forward_ios, size: 18),
      ):null,
    );
  }
}
