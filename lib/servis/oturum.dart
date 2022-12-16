import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stajprojem/model/kullanici.dart';
import 'package:stajprojem/sabitler/ext.dart';

class Oturum {
  GetStorage box = GetStorage();

  Future<bool> oturum_ac(
      BuildContext context, String mail, String sifre) async {
    print(api_link + "?api_key" + api_key);
    http.Response sonuc = await http.post(
        Uri.parse(api_link + "?api_key" + api_key),
        body: {'oturumac': 'true', 'kul_mail': mail, 'kul_sifre': sifre});

    if (sonuc.statusCode == 200) {
      //Bağlantı işlemi başarılıysa

      Map<String, dynamic> gelen = jsonDecode(sonuc.body);
      Kullanici kullanici = Kullanici.fromJson(gelen["bilgiler"]);
      print(kullanici.kulIsim);
      print(gelen);
      if (gelen['durum'] == 'ok') {
        alt_mesaj(context, "Oturum Açma İşlemi Başarılı", tur: 1);
        await box.write("kul", gelen["bilgiler"]);
        return true;
      } else {
        alt_mesaj(context, gelen["mesaj"]);
        return false;
      }
    } else {
      alt_mesaj(context,
          "İşleminizi şu anda gerçekleştiremiyoruz. Lütfen daha sonra tekrar deneyiniz!");
      return false;
    }
  }
}
