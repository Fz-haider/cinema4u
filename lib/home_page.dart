import 'dart:ui';

import 'package:cinema4u/api_connection.dart';
import 'package:cinema4u/models/title_data.dart';
import 'package:cinema4u/models/movies/top_movies.dart';
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
      appBar: AppBar(
        title: const Text('Cinema4u'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getTopMovies(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.none) {
                  return Container(
                    child: const Text('NO Existing Data!'),
                  );
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: Height * 0.4,
                      autoPlay: false,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 600),
                      viewportFraction: 1,
                    ),
                    itemCount: snapShot.data!.length,
                    itemBuilder: ((context, index, realIndex) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRect(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            snapShot.data![index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRect(
                                  child: Container(
                                    width: Width * 0.7,
                                    height: Height * 0.4,
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            snapShot.data![index].image),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(60)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Height * 0.01,
                          ),
                          FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Container(
                                width: Width * 0.8,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  snapShot.data![index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.pinkAccent,
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              )),
                        ],
                      );
                    }),
                  );
                }
              }),
          SizedBox(
            height: Height * 0.01,
          ),
          Container(
            width: Width * 0.95,
            height: Height * 0.1,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      'Asian Movies',
                    ),
                  ),
                  Tab(text: ('Box Office')),
                  Tab(text: ('Tv Series')),
                  Tab(text: ('Soon')),
                ]),
          ),
          SizedBox(
            height: Height * 0.01,
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent,
              width: Width * 1,
              child: TabBarView(controller: tabController, children: const [
                Text('hello'),
                Text('hello'),
                Text('hello'),
                Text('hello'),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
