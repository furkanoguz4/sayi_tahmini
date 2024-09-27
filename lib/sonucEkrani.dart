import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;
  bool textsonuc;
   SonucEkrani({required this.sonuc , required this.textsonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.sonuc ? Image.asset("Resimler/win.png") : Image.asset("Resimler/lose.png"),
            SizedBox(
              height: 20,
            ),
             Text(widget.textsonuc ? "You Win" : "You Lose",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Tekrar Oyna"))
          ],
        ),
      ),
    );
  }
}
