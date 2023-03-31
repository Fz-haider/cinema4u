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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema4u'),
        centerTitle: true,
      ),
      body: ListView(
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
                      height: Height * 0.56,
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
                          Container(
                            height: Height * 0.46,
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(60)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: Height * 0.1,
                            child: Text(snapShot.data![index].title),
                          ),
                        ],
                      );
                    }),
                  );
                }
              }),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Movie'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Tv Series'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Soon'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
