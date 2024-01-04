import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class anaSayfa extends StatefulWidget {
  const anaSayfa({super.key});

  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

//left-start-leading
//right-end-trailing

class _anaSayfaState extends State<anaSayfa> {
  @override
  Widget build(BuildContext context) {
    //Bu şekilde alarak esnek ekran görüntüsünü elde tutup daha rahat bir görüntü işlemesi yaparız.
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.width;
    final double ekranGenisligi = ekranBilgisi.size.height;
    print("Ekran Yüksekliği ${ekranYuksekligi}");
    print("Ekran Genişliği ${ekranGenisligi}");

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          d!.pizzaBaslik,
          style:
              TextStyle(color: yaziRenk, fontFamily: "Pacifico", fontSize: 22),
        ),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ekranYuksekligi / 43),
            child: Text(
              d.pizzaBaslik,
              style: TextStyle(
                  fontSize: 36, color: yaziRenk2, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset("resimler/pizza_resim.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(icerik: d.pizzaYazi),
                Chip(icerik: d.sucukYazi),
                Chip(icerik: d.zeytinYazi),
                Chip(icerik: d.biberYazi),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  d.teslimatSure,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    d.teslimatBaslik,
                    style: TextStyle(
                        fontSize: 22,
                        color: yaziRenk2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  d.pizzaAciklama,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  " \$ 5.98 ",
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: ekranGenisligi / 4,
                  child: buttonTheme(kartName: "Add To Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Tek tek buton yazmaktansa burdan çekeriz.
//stateless widget oluşturup değer isteyip onu çekeriz
class Chip extends StatelessWidget {
  String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(backgroundColor: anaRenk),
      child: Text(
        icerik,
        style: TextStyle(color: yaziRenk),
      ),
    );
  }
}

class buttonTheme extends StatelessWidget {
  String kartName;

  buttonTheme({required this.kartName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: anaRenk,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Text(
        kartName,
        style: TextStyle(color: yaziRenk, fontSize: 18),
      ),
    );
  }
}
