import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppText({super.key,this.size = 14, required this.text, this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color:  color,
            fontSize: size
        ),
      )
    );
  }
}
