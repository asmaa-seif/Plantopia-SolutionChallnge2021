import 'package:flutter/material.dart';
import 'package:gp_app/components.dart';
import 'package:gp_app/const.dart';
import 'package:gp_app/networking/local/shared_prefrences.dart';
import 'package:gp_app/view/login_regestration/Login.dart';
import 'package:gp_app/view/AdminScreen.dart';
import 'package:gp_app/view/MarketPlaceScreens/OrderScreen.dart';

import 'package:gp_app/view/profile/Profile.dart';
import 'package:gp_app/view/profile/ownProfile.dart';

import '../expert/ExpertsList.dart';

class sideDrawer extends StatelessWidget {
  String getCurrentRouteName(context) {
    String currentRouteName;

    Navigator.popUntil(context, (route) {
      currentRouteName = route.settings.name;
      return true;
    });

    return currentRouteName;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamed(context, ownProfile.id);
            },
            child: Container(
              color: kCardColor,
              child: UserAccountsDrawerHeader(
                accountName: Text(" Asmaa Nasser"),
                accountEmail: Text("asmaa98seif@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.dostor.org/upload/photo/news/74/4/600x338o/604.jpg'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home,
                color: ModalRoute.of(context).settings.name == Profile.id
                    ? kInActivelogInButtonColor
                    : Colors.grey.shade600),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Meet an expert"),
            onTap: () {
              Navigator.pushReplacementNamed(context, ExpertsList.id);
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: ModalRoute.of(context).settings.name == Profile.id
                  ? kInActivelogInButtonColor
                  : Colors.grey.shade600,
            ),
            title: Text("Saved posts "),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("My Calendar "),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings_outlined),
            title: Text("Admin"),
            onTap: () {
              Navigator.pushNamed(context, AdminPage.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout "),
            onTap: () {
              CacheHelper.clearData(key: 'token').then((value) {
                navigateAndFinish(context, Login());
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
        );
    //
    //   ListTile(
    //
    //       leading: Icon(Icons.home, color:  ModalRoute.of(context).settings.name == Profile.id ?
    //   kInActivelogInButtonColor: Colors.grey.shade600), title: Text("Home"),
    // onTap: () {Navigator.pop(context);
    //         Navigator.pushNamed(context, ownProfile.id);
    //
    // },
    // ),
    // ListTile(
    // leading: Icon(Icons.settings), title: Text("Settings"),
    // onTap: () {
    // Navigator.pop(context);
    // },
    // ),
    // ListTile(
    // leading: Icon(Icons.contacts), title: Text("Meet an expert"),
    // onTap: () {
    // Navigator.pushReplacementNamed(context, ExpertsList.id);
    // // Navigator.pop(context);
    // },
    // ),
    // ListTile(
    // leading: Icon(Icons.bookmark, color: ModalRoute.of(context).settings.name == Profile.id ?
    // kInActivelogInButtonColor: Colors.grey.shade600,), title: Text("Saved posts "),
    // onTap: () {
    // Navigator.pop(context);
    //
    // },
    // ),
    // ListTile(
    // leading: Icon(Icons.shopping_basket_outlined), title: Text("Orders "),
    // onTap: () {
    // Navigator.pop(context);
    // Navigator.pushNamed(context, OrdersScreen.id);
    // },
    // ),
    // ListTile(
    // leading: Icon(Icons.logout), title: Text("Logout "),
    // onTap: () {
    // Navigator.pop(context);
    // },
    // ),
    // ],
    // ),
    // );
  }
}
