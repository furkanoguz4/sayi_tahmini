import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmini/tahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AnaSayfa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "Resimler/zar.png",
              width: 200,
            ),
            Container(
                padding: EdgeInsets.only(top: 35, bottom: 35),
                child: Text(
                  "Sayı Tahmini Oyunu",
                  style: TextStyle(fontSize: 40),
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TahminEkrani()));
              },
              child: Text("Oyunu Başlat"),
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
              child: Text("Sayıyı gör"),
              onPressed: () {
                // generateRandomNumber();
              },
            ),
          ],
        ),
      ),
    );
  }
}
