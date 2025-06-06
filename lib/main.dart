import 'package:expense_tracker/navigations/go_route.dart';
import 'package:flutter/material.dart';

void main() {
  // Для Блокировки поворота экрана
  // void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp.router(
      routerConfig: router,
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 165, 200, 216),
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.black,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
        ),
        // iconButtonTheme: IconButtonThemeData(
        //   style: IconButton.styleFrom(foregroundColor: Colors.black),
        // ),
        cardTheme: CardThemeData().copyWith(
          color: Color.fromARGB(255, 165, 200, 216),
          elevation: 8,
          shadowColor: Colors.orangeAccent,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey,
        cardTheme: CardThemeData().copyWith(
          elevation: 15,
          shadowColor: Colors.orangeAccent,
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 32, 41, 56),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
          backgroundColor: const Color.fromARGB(255, 32, 41, 56),
        ),
      ),
    ),
  );
}
