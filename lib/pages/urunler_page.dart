import 'package:depoapp/siniflar/urun.dart';
import 'package:depoapp/siniflar/veritabani.dart';
import 'package:flutter/material.dart';

class UrunlerPage extends StatefulWidget {
  const UrunlerPage({super.key});

  @override
  State<UrunlerPage> createState() => _UrunlerPageState();
}

class _UrunlerPageState extends State<UrunlerPage> {
  final _adController = TextEditingController();
  final _fiyatController = TextEditingController();
  final _kategoriController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ürünler")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(children: [
            TextField(
              controller: _adController,
              decoration: InputDecoration(labelText: "Ürün Adı", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _fiyatController,
              decoration: InputDecoration(labelText: "Fiyat", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _kategoriController,
              decoration: InputDecoration(labelText: "Kategori", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Veritabani.urunler.add(Urun(_adController.text, int.parse(_fiyatController.text), _kategoriController.text));
                  Navigator.pop(context);
                });
              },
              child: Text("Ürün Ekle"),
            ),
          ]),
        ),
      ),
    );
  }
}
