import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stajprojem/sabitler/ext.dart';
import 'package:stajprojem/sayfalar/anasayfa.dart';
import 'package:stajprojem/sayfalar/oturum/giris.dart';

main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  oturum_kontrol() ? Anasayfa() : GirisSayfasi(), //website olmadığı için giriş sorun olabilir.
    );
  }
}


