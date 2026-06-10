import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mygallery extends StatefulWidget {
  const Mygallery({super.key});

  @override
  State<Mygallery> createState() => _MygalleryState();
}



class _MygalleryState extends State<Mygallery> {

  List myImages = [];

  int Page_Number = 1;

  connectionapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization': 'NVsvXZaqcv7QTUFiZfvQZ3FpEN7mPI9dSE2arAu1RV7NY4KAfApA0Ad9'
        }
    ).then((value) {
      Map Myresult = jsonDecode(value.body);

      setState(() {
        myImages = Myresult['photos'];
        print(myImages);
        print(myImages.length);
      });
    });
  }


  LoadingPage() async {
    Page_Number = Page_Number = 1;

    await http.get(Uri.parse(
        'https://api.pexels.com/v1/curated?page=$Page_Number&per_page=80'),
        headers: {
          'Authorization': 'NVsvXZaqcv7QTUFiZfvQZ3FpEN7mPI9dSE2arAu1RV7NY4KAfApA0Ad9'
        }
    ).then((value) {
      Map Myresult = jsonDecode(value.body);

      setState(() {
        myImages.addAll(Myresult['photos']);
        print(myImages);
        print(myImages.length);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectionapi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: GridView.builder(
              itemCount: myImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.purple,

                  child: Image(
                      fit: BoxFit.cover, //covers the full container size
                      image: NetworkImage
                        (myImages[index]['src']['tiny'])),
                );
              },
            ),
          )),
          GestureDetector(
            onTap: () {
              setState(() {
                LoadingPage();
              });
            },
            child: Container(
              height: 45,
              width: double.infinity,
              color:Colors.pink,
              child:Center(child:Text('click for more!')),
            ),
          )
        ],
      ),
    );
  }
}