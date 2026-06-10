import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:gallery_proj/mywallpaper.dart';

class GetGallery extends StatefulWidget {
  const GetGallery({super.key});

  @override
  State<GetGallery> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<GetGallery> {
  List Myimages = [];
  int pageNumber = 1;

  connectionapi() async {
    await https
        .get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
      headers: {
        'Authorization':
        'NVsvXZaqcv7QTUFiZfvQZ3FpEN7mPI9dSE2arAu1RV7NY4KAfApA0Ad9',
      },
    )
        .then((value) {
      Map Myresult = jsonDecode(value.body);

      Myimages = Myresult['photos'];
    });
  }

  LoadingPage() async {
    pageNumber = pageNumber + 1;
    await https
        .get(
      Uri.parse(
        'https://api.pexels.com/v1/curated?page=$pageNumber&per_page=80',
      ),
      headers: {
        'Authorization':
        'NVsvXZaqcv7QTUFiZfvQZ3FpEN7mPI9dSE2arAu1RV7NY4KAfApA0Ad9',
      },
    )
        .then((value) {
      Map Myresult = jsonDecode(value.body);

      Myimages.addAll(Myresult['photos']);
      print(Myimages.length);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectionapi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: Myimages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mywallpaper(
                                Myimages[index]['src']['large2x'],
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        color: Colors.pink,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(Myimages[index]['src']['tiny']),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  LoadingPage();
                });
              },
              child: Container(
                height: 80,
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                  child: Text(
                    'Loading More!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
