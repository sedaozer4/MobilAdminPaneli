import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

const String arka_renk = "3E4050";
const String metin_renk = "7F8C99";
const String api_key = "sedaozer1357";
const String api_link = "https://sedaozer4.github.io/sedaozer.github.io/islemler/islem.php";
const String site_link = "https://sedaozer4.github.io/sedaozer.github.io/";

class Renk extends Color {
  static int _donustur(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");

    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return int.parse(hexColor, radix: 16);
  }

  Renk(final String renkKodu) : super(_donustur(renkKodu));
}

alt_mesaj(BuildContext context, String mesaj, {int tur:0}){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        mesaj,
       style: GoogleFonts.quicksand(fontSize: 20),
        textAlign: TextAlign.center,
     ),
     backgroundColor: tur == 0?Colors.red:Colors.green,
     duration: Duration(seconds: 10),
    )
    );
}

bool oturum_kontrol() {
  GetStorage box = GetStorage();
  var sonuc = box.read("kul");
  if(sonuc == null || sonuc.toString().length<20){
      return false;
  }else
    return true;
}