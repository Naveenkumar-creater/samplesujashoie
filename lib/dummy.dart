import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/responsive.dart';
import 'package:sujashoei/screens/dashboard/dashboard_screen.dart';
import 'package:sujashoei/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';

import 'components/work_order_grid.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    // Add your screen widgets here for each icon
    WorkOrdersScreen(),
    AssetsScreen(),
    MessagesScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Set the desired height
        child: AppBar(
          leadingWidth: defaultPadding,
          backgroundColor: primaryColor,
          title: Row(
            children: [
              Text(
                'Hello, Sivabala!',
                style: TextStyle(
                  fontSize: defaultPadding,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Handle icon click
                      // Add your logic here
                    },
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Prominous',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: defaultPadding * 2),
              ],
            ),
          ),
          elevation: 0, // Remove the shadow
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Screens for navigation
class WorkOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Work Orders Screen'),
    );
  }
}

class AssetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Assets Screen'),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Messages Screen'),
    );
  }
}

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('More Screen'),
    );
  }
}
