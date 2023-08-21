import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Database Test'),
      ),
      body: const Center(
        child: Text('settings')
      ),
    );
  }
}


// Column(
//       children: [
//         Expanded(
//           child: FirebaseAnimatedList(
//               query: ref,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (context, snapshot, animaion, index) {
//                 //print('onChildAdded: ${snapshot.key}');
//                 return ListTile(
//                   title: Text(snapshot.child('Title').value.toString()),
//                   trailing: Text(snapshot.child('Price').value.toString()),
//                   subtitle: Text(snapshot.child('Productid').value.toString()),
//                 );
//               }),
//         ),
//       ],
//     );