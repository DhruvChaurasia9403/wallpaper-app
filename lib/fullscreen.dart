import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';



class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({super.key, required this.imageurl});

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setWallpaper() async {
    try {
      var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
      bool fileExists = await File(file.path).exists();
      if (fileExists) {
        print('File exists at path: ${file.path}');
      } else {
        print('File does not exist!');
      }
      // await WallpaperManagerFlutter().setwallpaperfromFile(
      //     file.path, WallpaperManagerFlutter.HOME_SCREEN);
      await WallpaperManagerFlutter().setwallpaperfromFile(
          file.path, WallpaperManagerFlutter.HOME_SCREEN);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wallpaper set successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to set wallpaper: $e')),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () {
              setWallpaper();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Set Wallpaper',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
