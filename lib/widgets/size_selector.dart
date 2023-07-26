import 'package:flutter/material.dart';

class SizeSilector extends StatefulWidget {
  const SizeSilector({super.key});

  @override
  State<SizeSilector> createState() => _SizeSilectorState();
}

class _SizeSilectorState extends State<SizeSilector> {

  bool _isSelected  = false;
  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap: _toggleSelection,
      child: Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text('US 5'),
      ),
    );
  }
}