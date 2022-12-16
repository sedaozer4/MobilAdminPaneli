import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stajprojem/sabitler/ext.dart';
import 'package:stajprojem/sabitler/tema.dart';
import 'package:stajprojem/sayfalar/anasayfa.dart';
import 'package:stajprojem/servis/oturum.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  Oturum oturum = Oturum();
  Tema tema = Tema();
  String mail = "";
  String sifre = "";
  bool sifre_gozukme = false;

  oturum_durum() {
    bool x = oturum_kontrol();
    if (x) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Anasayfa()),
            (route) => false);
      });
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Anasayfa()),
            (route) => false); //else kısmı website olmadığı için geçicidir.
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oturum_durum();
  }

  double genislik = 0;

  @override
  Widget build(BuildContext context) {
    genislik = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: genislik,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Renk(arka_renk),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Platform.isWindows ? genislik / 2 : genislik,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        margin: EdgeInsets.only(top: 70),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.2), width: 1),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: Renk("2D2F3A"), width: 15),
                          ),
                          child: Icon(
                            Icons.login,
                            size: 50,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Giriş Yapın",
                            style: GoogleFonts.quicksand(
                                color: Colors.white, fontSize: 30)),
                      ),
                      Container(
                        decoration: tema.inputBoxDec(),
                        margin: EdgeInsets.only(
                            top: 50, bottom: 10, right: 30, left: 30),
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: TextFormField(
                          onChanged: (value) => mail = value,
                          decoration: tema.inputDec("E-posta Adresinizi Girin",
                              Icons.people_alt_outlined),
                          style: GoogleFonts.quicksand(color: Renk(metin_renk)),
                        ),
                      ),
                      Container(
                        decoration: tema.inputBoxDec(),
                        margin: EdgeInsets.only(
                            top: 10, bottom: 30, right: 30, left: 30),
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) => sifre = value,
                                obscureText: !sifre_gozukme,
                                decoration: tema.inputDec(
                                    "Şifrenizi Girin", Icons.vpn_key_outlined),
                                style: GoogleFonts.quicksand(
                                  color: Renk(metin_renk),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  sifre_gozukme = !sifre_gozukme;
                                });
                              },
                              icon: Icon(
                                sifre_gozukme
                                    ? Icons.close
                                    : Icons.remove_red_eye,
                                color: Renk('7F8C99'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (mail.length < 3 || !mail.contains("@")) {
                            alt_mesaj(context,
                                "Lütfen E-Mail Adresinizi Doğru Giriniz!");
                          } else if (sifre.length < 2) {
                            alt_mesaj(
                                context, "Lütfen Şifenizi Doğru Giriniz!");
                          } else {
                            bool durum =
                                await oturum.oturum_ac(context, mail, sifre);
                            if (durum) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Anasayfa(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Anasayfa(),
                                ),
                              );
                              //elsedeki navigator kısmı geçici bir web site olmadığı için bağlantı sağlayamadım.Düzenlenecektir.
                            }
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          width:  Platform.isWindows?genislik/3:genislik/1.5,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Renk("224ABE"), Renk("4E73DF")]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("GİRİŞ YAP",
                                style: GoogleFonts.quicksand(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
