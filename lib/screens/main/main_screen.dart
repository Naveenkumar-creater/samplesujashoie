import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/provider/global_provider.dart';
import 'package:sujashoei/screens/main/dummy_dash.dart';
import 'package:sujashoei/screens/main/mainscreen/widgets/work_orders_screen.dart';
import '../../constants/font_registry.dart';

class MainScreen extends StatelessWidget {

  static List<Widget> _bottomWidgets = <Widget>[
    WorkOrdersScreen(),
    DummyDashboard(),
    AssetsScreen(),
    MessagesScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    void _openSettingsPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ),
      );
    }
    final tabProvider=Provider.of<TabProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          leadingWidth: defaultPadding,
          backgroundColor: primaryColor,
          title: Row(
            children: [
              Headings(subHeading: 'Hello, Sivabala!',),

              Spacer(),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: _openSettingsPage,
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
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: _bottomWidgets[tabProvider.selectedIndex],
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
        currentIndex: tabProvider.selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap:(index)=> tabProvider.setSelectedIndex(index),
      ),
    );
  }
}

class AssetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Assets Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Messages Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'More Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
