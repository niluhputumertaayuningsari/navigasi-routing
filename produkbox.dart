import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class produk extends StatefulWidget {
  @override
  _produkState createState() => _produkState();
}

class _produkState extends State<produk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produk List"),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarproduk,
      ),
    );
  }

  List<Container> daftarproduk =
  new List(); //list ini isinya pakek banyak container dilihat dari yang didalem <>

  var produk = [
    //var ini dipakek jadi array penyimpang nama sama gambarnya biar nanti bisa di panggil di body atau fungsi lain
    {
      "nama": "Nyam Box",
      "gambar": "box.jpg",
    },
    {
      "nama": "Nyam Pouch",
      "gambar": "pouch.jpg",
    },
    {
      "nama": "Nyam Mix",
      "gambar": "mix.jpg",
    },
    {
      "nama": "Nyam Stik",
      "gambar": "stik.jpg",
    },
];

  _createlist() async {
    //createlist ini fungsinya untuk membuat list diatas yang berisi container dengan data array produknya
    for (var i = 0; i < produk.length; i++) {
      //i<produk.length dipakek supaya bisa perulangannya menampung jumlah data arraynya
      final x = produk[i]; //variabel untuk produknya
      final String gambar = x["gambar"]; //gambar ini dipakek manggil gambar sesuai urutannya

      daftarproduk.add(Container(
        width: 240,
        height: 240,
        padding: EdgeInsets.all(10),
        child: Card(
          color: Colors.pink[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                //widget animasi hero
                  tag: x['nama'],
                  child: Material(
                    //saat gambar akan membesar prosesnya masuk ke material
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext) => new Detail(
                          //navigator push dipakek untuk mindahin screen ke route ditentuin yaitu detail
                          nama: x["nama"],
                          gambar: gambar,
                        ),
                      )),
                      child: Image.asset(
                        "assets/appimages/$gambar",
                        fit: BoxFit.cover, //gambarnya supaya full ke cover sama cardnya
                      ),
                    ),
                  )),
              Padding(padding: EdgeInsets.all(5)), //tambahin pading biar ada jarak aja dari cardnya
              Text(
                x['nama'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    //inisialisasi createlist
    _createlist();
    super.initState();
  }
}

//class detail untuk nampilin produknya
class Detail extends StatelessWidget {
  Detail(
      {Key key,
        this.nama,
        this.gambar}); //pengambilan array, array yang dipanggil harus sama persis tulisannya
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.pinkAccent[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context); //navigator buat balik ke screen sebelumnya
                    }),
                Text(
                  "$nama", //manggil nama sesuai urutan arraynya
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.pinkAccent[100],
            height: 240,
            child: Hero(
              tag: nama,
              child: Material(
                child: InkWell(
                  child: Image.asset(
                      "assets/appimages/$gambar"), //manggil gambar harus kasih dulu dimana nyimpen assets nya sesuai pubspec.yaml
                ),
              ),
            ),
          ),
          new partNama(
            //manggil kelas partNama
            nama: nama,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Card(
              child: Text(
                "Ready Stok",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class partNama extends StatelessWidget {
  partNama({Key key, this.nama, this.harga});
  final String nama;
  final String harga;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.pinkAccent[100],
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$nama",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Text(
                    "10",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
