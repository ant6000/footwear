import 'package:flutter/material.dart';

class CardViews extends StatelessWidget {
  const CardViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 20,
          color: Colors.blue,
          child: SizedBox(
            height: 220,
            width: 150,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('40%'),
                      GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        onTap: () {
                          print('object');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/snikers1.png'),
                    ),
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Sports Shoe',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                const Text("300.00",style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
