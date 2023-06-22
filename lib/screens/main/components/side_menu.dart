import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SideMenu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: "Dashboard",
              Svgsrc: "assets/icons/menu_dashbord.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Transaction",
              Svgsrc: "assets/icons/menu_tran.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Task",
              Svgsrc: "assets/icons/menu_task.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Documents",
              Svgsrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Store",
              Svgsrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Notification",
              Svgsrc: "assets/icons/menu_notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Profile",
              Svgsrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Setting",
              Svgsrc: "assets/icons/menu_setting.svg",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({

    required this.title,
    required this.Svgsrc,
    required this.press,
  }) ;
  final String title, Svgsrc;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(hoverColor: Colors.grey.shade200,
      horizontalTitleGap: 0.0,
      onTap: press,
      leading: SvgPicture.asset(
        Svgsrc,
        color: Colors.green,
        height: 16.0,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.grey.shade700),
      ),
    );
  }
}