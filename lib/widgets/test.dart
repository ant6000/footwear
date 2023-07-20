import 'package:flutter/material.dart';

import 'categories_widgets.dart';

class Items extends StatelessWidget {
  const Items({super.key});


  @override
  Widget build(BuildContext context) {
    return GridView(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

      children: [
        //for (int i = 1; i < 10; i++)
        //Text('data'),
      ],
    );
  }
}
