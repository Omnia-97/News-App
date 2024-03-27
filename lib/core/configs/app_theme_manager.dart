import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeManager {
  static ThemeData applicationThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: const Color(0xFF39A552),
    appBarTheme: const AppBarTheme(
        toolbarHeight: 67,
        backgroundColor: Color(0xFF39A552),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
        shadowColor: Colors.transparent),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 35,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.exo(
          fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: GoogleFonts.exo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF303030),
      ),
      displayMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: const Color(0xFF42505C),
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF79828B),
      ),
      titleSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color: const Color(0xFF42505C),
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFA3A3A3),
      ),
    ),
  );
}
