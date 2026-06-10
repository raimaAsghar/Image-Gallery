import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class Mywallpaper extends StatefulWidget {

  var selectedimage;
  Mywallpaper(this.selectedimage);

  @override
  State<Mywallpaper> createState() => _MywallpaperState();
}

class _MywallpaperState extends State<Mywallpaper> {
  setwalpaper(int number)async {
    final wall = WallpaperManagerFlutter();
    var filetype = await DefaultCacheManager().getSingleFile(
        widget.selectedimage);
    if (number == 1) {
      bool result = await wall.setWallpaper(
          filetype, WallpaperManagerFlutter.homeScreen);
    }
    else if(number == 2)
    {
      bool result = await wall.setWallpaper(
          filetype, WallpaperManagerFlutter.lockScreen);
    }
    else if(number == 3)
    {
    bool result = await wall.setWallpaper(
    filetype, WallpaperManagerFlutter.bothScreens);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          InteractiveViewer(child: Image(image: NetworkImage(widget.selectedimage))),
          GestureDetector(
            onTap: (){
              setState(() {
                setwalpaper(1);

              });

            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.pinkAccent,
              child: Center(
                child: Text(
                  'Set on Home ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                setwalpaper(2);

              });

            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'Set on Lock ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                setwalpaper(3);

              });

            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  'Set on Both ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
