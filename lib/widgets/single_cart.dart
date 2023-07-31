import 'package:flutter/material.dart';

class SingleCart extends StatelessWidget {
  const SingleCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(5, 7),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/snikers1.png'),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Snikers',
                  style: TextStyle(fontSize: 20),
                ),
                Text('2000.00', style: TextStyle(fontSize: 20)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                const Text('2',style: TextStyle(fontSize: 20),),
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
