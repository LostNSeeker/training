import 'package:flutter/material.dart';


class MyBottomNavigationBarDemo extends StatefulWidget {
  const MyBottomNavigationBarDemo({super.key});


  @override
  State<MyBottomNavigationBarDemo> createState() => _MyBottomNavigationBarDemoState();
}


class _MyBottomNavigationBarDemoState extends State<MyBottomNavigationBarDemo> {
  int _currentIndex = 0;
  var tabs = [
    Center(child: Text('Home'),),
    Center(child: Text('Search'),),
    Center(child: Text('Account'),),
    Center(child: Text('Profile'),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swiggy'),),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Account'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          )
        ],
        onTap: (int ? index){
          setState(() {
            _currentIndex = index!;
          });
        },
      ),
    );
  }
}
