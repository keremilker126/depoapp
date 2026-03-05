import 'package:flutter/material.dart';
import 'package:depoapp/siniflar/urun.dart';
import 'package:depoapp/siniflar/veritabani.dart';
import 'package:depoapp/pages/urunler_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool fiyatGoster = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${Veritabani.urunler.length} ürün var", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        actions: [
          Text("Fiyat Göster", style: TextStyle(color: Colors.white)),
          Checkbox(
            
            value: fiyatGoster,
            hoverColor: const Color.fromARGB(255, 176, 220, 255),
            activeColor: const Color.fromARGB(255, 1, 49, 182),
            checkColor: Colors.white,
            focusColor: const Color.fromARGB(255, 0, 238, 255),
            
            onChanged: (value) {
              setState(() {
                fiyatGoster = value!;
              });
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          Urun urun = Veritabani.urunler[index];

          if (fiyatGoster) {
            return GestureDetector(
              onLongPress: () {
                setState(() {
                  Veritabani.urunler.removeAt(index);
                });
              },

              child: Card(
                color: const Color.fromARGB(255, 175, 219, 255),
                child: ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.deepOrange),
                  title: Text(
                    urun.ad,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        "${urun.fiyat} TL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(" - "),
                      Text(" ${urun.kategori}", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return GestureDetector(
              onLongPress: () {
                setState(() {
                  Veritabani.urunler.removeAt(index);
                });
              },
              child: Card(
                color: const Color.fromARGB(255, 175, 219, 255),
                child: ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.deepOrange),
                  title: Text(urun.ad, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                  subtitle: Text(urun.kategori, style: TextStyle(color: Colors.black)),
                ),
              ),
            );
          }
        },
        itemCount: Veritabani.urunler.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UrunlerPage()),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
