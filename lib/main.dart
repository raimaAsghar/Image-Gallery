import 'package:flutter/material.dart';
import 'package:gallery_proj/splashscreen.dart';

void main() {
  runApp(Routing());
}

class Routing extends StatelessWidget {
  const Routing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: Splash()
    );
  }
}