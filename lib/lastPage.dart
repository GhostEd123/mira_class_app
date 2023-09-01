// import 'package:flutter/material.dart';
 
// //importing material design library
// // void main() {
// //   runApp(MaterialApp(
// //     //runApp method
// //     home: HomePage(),
// //   ));//MaterialApp
// // }
 
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
 
// class _HomePageState extends State<HomePage> {
//   bool value = false;
 
//   @override
//   //App widget tree
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('GeeksforGeeks'),
//           backgroundColor: Colors.greenAccent[400],
//           leading: IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Menu',
//             onPressed: () {},
//           ), //IconButton
//         ), //AppBar
//         body: Center(
//           /** Card Widget **/
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SizedBox(
//                 width: 430,
//                 height: 700,
//                 child: Column(
//                   children: [
//                     Text(
//                       'Algorithms',
//                       style: TextStyle(
//                           color: Colors.greenAccent[400],
//                           fontSize: 30), //TextStyle
//                     ), //Text
//                     SizedBox(height: 10),
//                     Row(
//                       children: <Widget>[
//                         SizedBox(
//                           width: 10,
//                         ), //SizedBox
//                         Text(
//                           'Library Implementation Of Searching Algorithm: ',
//                           style: TextStyle(fontSize: 17.0),
//                         ), //Text
//                         SizedBox(width: 10), //SizedBox
//                         /** Checkbox Widget **/
//                         Checkbox(
//                           value: value,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               this.value = value!;
//                             });
//                           },
//                         ), //Checkbox
//                       ], //<Widget>[]
//                     ), //Row
//                   ],
//                 ), //Column
//               ), //SizedBox
//             ), //Padding
//           ), //Card
//         ), //Center//Center
//       ), //Scaffold
//     ); //MaterialApp
//   }
// }