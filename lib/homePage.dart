import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mira_class_app/api_request.dart';
import 'package:mira_class_app/lastPage.dart';
import 'package:mira_class_app/main.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,  this.title,  this.name, this.id });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String? id;
  final String? title;
  final String? name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int current_index = 0;
  List <Widget> screens = [
    MyHomePage(name: '', title: "",),
    Container(),
    Container(),
    Container(),
  ];

   void update_index(int value) {
    setState(() {
      current_index = value;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    // _counter++;
    // print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () { 
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ApiRequest()));
              // Get.to(ApiRequest());
              // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              // Navigator.pushNamed(context, "/s");
            },
            child: const Icon(Icons.home)),
        centerTitle: true,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("${getX.read(user_details.GETX_EMAIL)}"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Welcome ${widget.name}"),
          ),
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You pushed the button this many times:',
                ),
                Text(
                  '${getX.read(user_details.GETX_INREMENT_VALUE)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: GestureDetector(
                        onTap: (){Get.to(ApiRequest());},
                        child: Image.network(
                          "images/flutter_practice.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: current_index,
      //   onTap: update_index,
      //   // showUnselectedLabels: true,
      //   unselectedLabelStyle: const TextStyle(
      //       overflow: TextOverflow.visible,
      //       fontSize: 10,
      //       fontWeight: FontWeight.w400,
      //       color: Colors.grey,
      //     ),
      //     selectedLabelStyle: const TextStyle(
      //       overflow: TextOverflow.visible,
      //       fontSize: 10,
      //       color: Color(0x0D8CE9),
      //     ),
      //     unselectedItemColor: Colors.grey,
      //     selectedItemColor: Colors.red,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_balance_outlined),
      //         activeIcon: Icon(Icons.account_balance, color: Colors.red, size: 10,),
      //         label: 'Dashboard',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search_off_outlined),
      //         activeIcon: Icon(Icons.search, color: Colors.red, size: 10,),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.numbers_outlined),
      //         activeIcon: Icon(Icons.numbers, color: Colors.red, size: 10,),
      //         label: 'Statistics',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite_outlined),
      //         activeIcon: Icon(Icons.favorite_outlined, color: Colors.red, size: 10,),
      //         label: 'Requests',
      //       ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _incrementCounter();
      //     getX.write(user_details.GETX_INREMENT_VALUE, _counter.toString());
      //     print("DONE... $_counter ${getX.read(user_details.GETX_INREMENT_VALUE)}");
      //     showToast("Plus One", Colors.blue);
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


void showToast(msg, backgroundColor) {
  Fluttertoast.showToast(
      msg: msg, // message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor // location
      );
}