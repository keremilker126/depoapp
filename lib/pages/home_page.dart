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
      
      title: Text("${Veritabani.urunler.length} ürün var"), centerTitle: true,
      actions: [
        Text("Fiyat Göster"),
        Checkbox(value: fiyatGoster, onChanged: (value){
          setState(() {
            fiyatGoster = value!;
          });
        })
      ],
      
      ),
      
      body: ListView.builder(itemBuilder: (context, index) {
        Urun urun = Veritabani.urunler[index];
        
        if(fiyatGoster){
          return GestureDetector(
          onLongPress: () {
            setState(() {
              Veritabani.urunler.removeAt(index);
            });
          },
          
          child: Card(
            
            color: const Color.fromARGB(255, 175, 219, 255),
            child: ListTile(
              leading:  Icon(Icons.shopping_cart),
              title: Text(urun.ad),
              subtitle: Row(
                children: [
                  Text("${urun.fiyat} TL", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                  Text(" ${urun.kategori}"),
                ],
              )  
            ),
          ),
        );
        }
        else {
          return GestureDetector(
          onLongPress: () {
            setState(() {
              Veritabani.urunler.removeAt(index);
            });
          },
          child: Card(
            
            color: const Color.fromARGB(255, 175, 219, 255),
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(urun.ad),
              subtitle: Text(urun.kategori),
            ),
          ),
        );
        }
      }, itemCount: Veritabani.urunler.length, shrinkWrap: true, physics: NeverScrollableScrollPhysics()),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UrunlerPage()),
          );
          setState(() {
            
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
