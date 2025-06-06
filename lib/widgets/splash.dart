import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final List<Color> color = [
    Colors.greenAccent, 
    Colors.lightBlue,
  ];
  //ToDo: как сделать движушийся градиент

  @override
  void initState() {
    Timer(Duration(seconds: 5), () => context.go('/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Spacer(flex: 1),
              Image.asset('assets/images/splash.png', width: 120, height: 120),
              Text(
                'EXPR',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
