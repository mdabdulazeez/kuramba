import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final greenTheme = ThemeData(
  // General
  brightness: Brightness.light,
  primaryColor: Colors.green,
  errorColor: Colors.red,
  shadowColor: Colors.grey[300],
  // Text
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    bodyText2: TextStyle(
      color: Colors.grey[600],
      height: 1.5,
    ),
  ),
  // Divider
  dividerTheme: DividerThemeData(
    color: Colors.grey[600],
  ),
  // Dialog
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    titleTextStyle: TextStyle(
      color: Colors.green,
      fontSize: 20,
    ),
    contentTextStyle: TextStyle(
      color: Colors.grey[700],
      fontSize: 16,
    ),
  ),
  // Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  // Card
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  // AppBar
  appBarTheme: AppBarTheme(
    elevation: 5, systemOverlayStyle: SystemUiOverlayStyle.light, toolbarTextStyle: TextTheme(
      titleLarge: GoogleFonts.montserrat().copyWith(
        fontSize: 20,
      ),
    ).bodyText2, titleTextStyle: TextTheme(
      titleLarge: GoogleFonts.montserrat().copyWith(
        fontSize: 20,
      ),
    ).headline6,
  ),
  // Scaffold
  scaffoldBackgroundColor: Colors.white,
  // BottomNavigationBar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green,
    selectedItemColor: Colors.green[900],
    unselectedItemColor: Colors.white,
    showUnselectedLabels: false,
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green[900]),
);

final greenDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.green[700],
  errorColor: Colors.red,
  shadowColor: Colors.grey[900],
  // Dialog
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
    ),
  ),
  // Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.green[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.green[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  // Card
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  // AppBar
  appBarTheme: AppBarTheme(
    elevation: 5, toolbarTextStyle: TextTheme(
      headline6: GoogleFonts.montserrat().copyWith(
        fontSize: 20,
      ),
    ).bodyText2, titleTextStyle: TextTheme(
      headline6: GoogleFonts.montserrat().copyWith(
        fontSize: 20,
      ),
    ).headline6,
  ),
  // BottomNavigationBar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green[700],
    selectedItemColor: Colors.green[900],
    unselectedItemColor: Colors.white,
    showUnselectedLabels: false,
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green[900]),
);
