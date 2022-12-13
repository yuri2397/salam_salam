import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget animatedButton(String data, decoration) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: decoration ? Colors.grey[100] : null,
    ),
    child: Center(
      child: Text(
        data,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black),
      ),
    ),
  );
}

Widget buildInput(String text, controller, onSubmit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.poppins(
            color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15.0)),
        child: TextField(
          controller: controller,
          onSubmitted: onSubmit,
          keyboardType: text == 'Téléphone'
              ? TextInputType.phone
              : TextInputType.emailAddress,
          decoration: InputDecoration(
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: text,
              hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[400],
                  fontSize: 13,
                  fontWeight: FontWeight.w200)),
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      )
    ],
  );
}
