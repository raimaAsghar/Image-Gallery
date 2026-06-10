import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gallery_proj/get_gallery.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 15),
          ()=>Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=>GetGallery()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage('raima/logo.jpg'),
                backgroundColor: Colors.pinkAccent,
              ),
              SizedBox(height: 7),

              Text('BSCS MORNING', style: TextStyle(
                  fontSize: 39,
                  color: Colors.white,
                  fontFamily: 'font5'
              ),),
              SizedBox(height: 330),

              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(height: 7),

              Text(
                '2023-ag-7164',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white70,
                  fontFamily: 'font5',
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}