import 'dart:ui';
import 'package:cinema4u/Screen/image_slider.dart';
import 'package:cinema4u/models/title_data.dart';
import 'package:cinema4u/models/movies/top_movies.dart';
import 'package:cinema4u/Screen/tab_screens/asian_movies.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.vulcan,
      appBar: AppBar(
        leading: Drawer(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cinema4u'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageSlider(),
          Container(
            width: Width * 0.95,
            height: Height * 0.1,
            decoration: BoxDecoration(
              color: AppColor.snow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(child: Text('Asian Movies')),
                  Tab(text: ('Box Office')),
                  Tab(text: ('Tv Series')),
                  Tab(text: ('Soon')),
                ]),
          ),
          SizedBox(
            height: Height * 0.01,
          ),
          Container(
            height: Height * 0.38,
            child: TabBarView(controller: tabController, children: const [
              AsianMovies(),
              Text('hello'),
              Text('hello'),
              Text('hello'),
            ]),
          ),
        ],
      ),
    );
  }
}
