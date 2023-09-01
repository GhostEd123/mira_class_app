import 'package:flutter/material.dart';
import 'package:mira_class_app/homePage.dart';
// import 'package:mira_class_app/lastPage.dart';
class ScreensControl extends StatefulWidget {
  const ScreensControl({Key? key}) : super(key: key);

  @override
  State<ScreensControl> createState() => _ScreensControlState();
}

class _ScreensControlState extends State<ScreensControl> {
  int current_index = 0;
  List<Widget> screens = [
   MyHomePage(name: '', title: "",),
    Container(),
    Container(),
    Container(),
  ];

  // ignore: non_constant_identifier_names
  void update_index(int value) {
    setState(() {
      current_index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens[current_index],
      body: IndexedStack(
        index: current_index,
        children: screens,
      ),
      bottomNavigationBar: SizedBox(
        height: 46,
        child: BottomNavigationBar(
        currentIndex: current_index,
        onTap: update_index,
        // showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
            overflow: TextOverflow.visible,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          selectedLabelStyle: const TextStyle(
            overflow: TextOverflow.visible,
            fontSize: 10,
            color: Color(0x0D8CE9),
          ),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined),
              activeIcon: Icon(Icons.account_balance, color: Colors.red, size: 10,),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_off_outlined),
              activeIcon: Icon(Icons.search, color: Colors.red, size: 10,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers_outlined),
              activeIcon: Icon(Icons.numbers, color: Colors.red, size: 10,),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              activeIcon: Icon(Icons.favorite_outlined, color: Colors.red, size: 10,),
              label: 'Requests',
            ),
        ],
      ),
      ),
    );
  }
}