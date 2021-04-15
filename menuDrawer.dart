import 'package:flutter/material.dart';

class Menudrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //widget drawer
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            //bagian header pada drawer
            accountName: Text("Ni Luh Putu Merta Ayuning Sari"),
            accountEmail: Text("niluhputumertaayuningsari12@gmail.com"),
            currentAccountPicture: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/appimages/foto.jpg"),
              ),
            ),
            decoration: BoxDecoration(color: Colors.pinkAccent[100]), // mewarnai background drawer
          ),
          ListTile(
            //widget untuk drawer di bagian list tilenya
            title: Text("Profile"),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("Log Out"),
            trailing: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
