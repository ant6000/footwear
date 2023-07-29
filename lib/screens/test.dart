import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Center(child: Text('hello1')),
    );
  }
}

class MyWidget2 extends StatefulWidget {
  const MyWidget2({super.key});

  @override
  State<MyWidget2> createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Center(child: Text('hello2')),
    );
  }
}


class MyWidget3 extends StatefulWidget {
  const MyWidget3({super.key});

  @override
  State<MyWidget3> createState() => _MyWidget3State();
}

class _MyWidget3State extends State<MyWidget3> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Center(child: Text('hello3')),
    );
  }
}

class MyWidget4 extends StatefulWidget {
  const MyWidget4({super.key});

  @override
  State<MyWidget4> createState() => _MyWidget4State();
}

class _MyWidget4State extends State<MyWidget4> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Center(child: Text('hello4')),
    );
  }
}