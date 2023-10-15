import 'package:e_commerce_app/screens/tabs_screen/view/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final myColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.white10,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        textTheme: GoogleFonts.lailaTextTheme(),
        colorScheme: myColorScheme,
        scaffoldBackgroundColor: myColorScheme.primaryContainer,
        appBarTheme: AppBarTheme(
          backgroundColor: myColorScheme.primaryContainer,
          elevation: 0,
          centerTitle: false,
        ),
        useMaterial3: true,
      ),
      home: const TabsScreenView(),
    );
  }
}
