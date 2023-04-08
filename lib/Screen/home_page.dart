import 'dart:ui';

import 'package:cinema4u/Screen/genres_movies.dart';
import 'package:cinema4u/Screen/trending_movies.dart';
import 'package:cinema4u/Screen/nowplaying_movies.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.vulcan,
      drawer: Drawer(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cinema4u'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('SearchScreen');
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TrendingMovies(),
          SizedBox(height: Height * 0.03),
          GenresMovies(),
          SizedBox(height: Height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('Now Playing',
                    style: TextStyle(
                      color: AppColor.snow,
                      fontSize: Width > 700 ? 20 : 16,
                    )),
              ),
            ],
          ),
          SizedBox(height: Height * 0.03),
          NowPlayingMovies(),
        ],
      ),
    );
  }
}
