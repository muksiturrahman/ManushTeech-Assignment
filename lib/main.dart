import 'package:flutter/material.dart';
import 'package:manushtech_assignment/pages/albums.dart';
import 'package:manushtech_assignment/states/albums_provider.dart';
import 'package:manushtech_assignment/states/photos_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlbumsProvider()),
        ChangeNotifierProvider(create: (_) => PhotosProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlbumsPage(),
    );
  }
}
