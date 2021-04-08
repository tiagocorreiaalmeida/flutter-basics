import 'package:flutter/material.dart';

import 'package:jobs_finder/screens/bookmarked_jobs.dart';
import 'package:jobs_finder/screens/home_screen.dart';

class HomeTabs extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<HomeTabs> {
  List<Map<String, Object>> _screens = [];
  var _selectedScreenIndex = 0;

  @override
  void initState() {
    _screens = [
      {'screen': HomeScreen(), 'title': "AwesomeJobsFinder"},
      {'screen': BookMarkedJobs(), 'title': 'Bookmarked jobs'},
    ];

    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).hintColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarked',
          )
        ],
      ),
    );
  }
}
