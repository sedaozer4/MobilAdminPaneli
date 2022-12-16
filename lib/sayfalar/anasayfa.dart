import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ElevatedButton (onPressed: () async {
            GetStorage box = GetStorage();
            await box.remove("kul");
          }, child: Text("Çıkış Yap"), // Burada çıkış yapma işlemi gerçekleştiriliyor. Diğer işlemlerin else durumlarını değiştirdiğim için bu kısım çıkış yapmıyor.
          ),
        ),
    );

  }
}
