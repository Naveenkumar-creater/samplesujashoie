import 'package:flutter/material.dart';
import 'package:sujashoei/screens/dashboard/dashboard_screen.dart';
import 'package:sujashoei/screens/main/components/side_menu.dart';

import '../../responsive.dart';

class DummyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
           if(Responsive.isDesktop(context)) Expanded(
              child: SideMenu(),
            ),Expanded(flex: 5, child: DashboardScreen())
          ],
        ),
      ),
    );
  }
}
