import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (value) {},
        items: [
          DropdownMenuItem(
            value: 'one',
            child: Text('hello')),
          DropdownMenuItem(
            value: 'one',
            child: Text('hello')),
          DropdownMenuItem(
            value: 'one',
            child: Text('hello')),
        ],
      ),
    );
  }
}
