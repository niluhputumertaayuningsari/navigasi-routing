import 'package:flutter/material.dart';
import './menuDrawer.dart' as menuDrawer;

class beranda extends StatefulWidget {
  @override
  _berandaState createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Text("Home"),
        actions: <Widget>[
          //action dipakek nambah widget di appbar bagian action
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
        ],
      ),
      drawer: menuDrawer.Menudrawer(), // manggil kelas drawer yang udah dibuat
      body: ListView(
        //supaya bisa discroll kebawah kalau misalkan kepenuhan
        children: <Widget>[
          Image.asset("assets/appimages/logo.png"),
          Container(
            color: Colors.pinkAccent[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .end, //main axis untuk row itu ngerubah horizontal kalau cross ngerubah row dari sisi vertical
              children: [
                Expanded(
                  //menghabiskan bagian/space pada row yang tersisa
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start, //cross axis pada column untuk mengatur horizontal
                    children: <Widget>[
                      Text(
                        "Welcome To NyemilKuy.id",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.local_grocery_store_outlined,
                    color: Colors.white,
                  ),
                  onPressed:
                      () {}, // tanda () {} adalah anonymous method fungsinya disini agar icon buttonya tidak berwarna abu-abu seperti kelihatan di pencet gitu
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {},
                      color: Colors.pinkAccent[100],
                    ),
                    Text(
                      "Call",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pinkAccent[100]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.near_me),
                      onPressed: () {},
                      color: Colors.pinkAccent[100],
                    ),
                    Text(
                      "Route",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.pinkAccent[100]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                      color: Colors.pinkAccent[100],
                    ),
                    Text(
                      "Share",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pinkAccent[100]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
