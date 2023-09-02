import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget{
  const Welcome({super.key});

  @override
  State<Welcome> createState() =>_WelcomeState();
}

class _WelcomeState extends State<Welcome> {


  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size2=MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon:  Icon(Icons.home_outlined),
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),

      ][currentPageIndex],
    );
  }
}