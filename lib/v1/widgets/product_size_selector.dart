import 'package:flutter/material.dart';

class SizeSilector extends StatefulWidget {
  const SizeSilector({super.key});

  @override
  State<SizeSilector> createState() => _SizeSilectorState();
}

class _SizeSilectorState extends State<SizeSilector> {
  bool _isSelected = false;
  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleSelection,
      child: Container(
        height: 30,
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: _isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: const Center(child: Text('US 5')),
      ),
    );
  }
}

class Selector extends StatefulWidget {
  const Selector({super.key});

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  final List<bool> _selection = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      disabledColor: Colors.amber,
      selectedColor: Colors.blue,
      
      isSelected: _selection,
      onPressed: (index) {
        setState(() {
          _selection[index] = !_selection[index];
        });
      },
      children: const [
        Text(
          'US 5',
          style: TextStyle(
            fontSize: 5,
          ),
        ),
        Text(
          'US 6',
          style: TextStyle(
            fontSize: 5,
          ),
        ),
        Text(
          'US 7',
          style: TextStyle(
            fontSize: 5,
          ),
        ),
        Text(
          'US 8',
          style: TextStyle(
            fontSize: 5,
          ),
        ),
        Text(
          'US 9',
          style: TextStyle(
            fontSize: 5,
          ),
        ),
      ],
    );
  }
}
