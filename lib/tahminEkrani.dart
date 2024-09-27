import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmini/sonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  final TextEditingController _controller = TextEditingController();
  int? randomNumber;
  String message=" ";
  int can = 6;

  void check() {
    int? tahmin = int.tryParse(_controller.text);
  }

  void generateRandomNumber() {
    randomNumber = Random().nextInt(100) + 1;
    print(randomNumber.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Kalan Hak : $can ",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "Yardım :$message ",
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                // klavyeden sadece sayıların çıkması
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int? tahmin = int.tryParse(_controller.text);
                setState(() {
                  can--;
                });

                if (tahmin == randomNumber) {
                  //değiştir
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,textsonuc: true,)));
                  return;
                }
                  if (tahmin! < randomNumber!) {
                    setState(() {
                      message = "Daha Yüksek ";
                    });
                  }
                  if(tahmin! > randomNumber!){
                    setState(() {
                      message = "Daha düşük";
                    });
                  }
                  if(can==0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SonucEkrani(sonuc: false,textsonuc: false,)));
                  }
                  _controller.text="";
              },
              child: Text("Tahmin Et"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                // arkaplan mavi yazı beyaz
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                // İçerik boşlukları
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Kenar yuvarlama
                ),
                elevation: 5, // Gölge derinliği
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(randomNumber);
                },
                child: Text("Sayıyı gör")),
          ],
        ),
      ),
    );
  }
}
