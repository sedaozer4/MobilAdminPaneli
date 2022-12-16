import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stajprojem/sabitler/ext.dart';

class Tema {
  inputDec(String hintText, IconData icon) {
    return InputDecoration(
      fillColor: Colors.white,
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: GoogleFonts.quicksand(
        color: Renk(metin_renk),
      ),
      prefixIcon: Icon(
        icon,
        color: Renk("5BA7FB"),
      ),
    );
  }

  inputBoxDec(){
    return BoxDecoration(
      color: Renk("333433"),
      borderRadius: BorderRadius.circular(20),
    );

  }

}
