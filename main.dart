import 'package:flutter/material.dart';

import './beranda.dart' as beranda;
import './produkbox.dart' as produkbox;

void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new beranda.beranda(),
            new produkbox.produk(),
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.pinkAccent[100],
        child: new TabBar(
            controller: controller,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.home)),
              new Tab(icon: new Icon(Icons.list))
            ]
        ),
      ),
    );
  }
}


