import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema4u/Screen/trending_movies/trending_trailer.dart';
import 'package:cinema4u/api/api_constant.dart';

import 'package:cinema4u/api/api_connection.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return Container(
      height: Height * 0.4,
      child: FutureBuilder(
          future: trendingMovies(),
          builder: (context, snapShot) {
            var data = snapShot.data;
            if (snapShot.hasError) {
              return Center(child: Text('😢${snapShot.error}'));
            } else if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return CarouselSlider.builder(
                  options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    height: Height * 0.4,
                    pauseAutoPlayOnTouch: true,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    viewportFraction: Width > 700 ? 0.4 : 0.6,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                  ),
                  itemCount: data!.length,
                  itemBuilder: (context, index, realIndex) {
                    var movie = data[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TrendingTrailer(movie: movie),
                        ),
                      ),
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: ApiConstant.TMDB_BASE_IMAGE_URL +
                                data[index].posterPath,
                            height: Height * 0.4,
                            width: Width * 1,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              bottom: 12,
                            ),
                            child: Text(data[index].title,
                                style: TextStyle(
                                  fontSize: Width > 700 ? 16 : 12,
                                )))
                      ]),
                    );
                  });
            }
          }),
    );
  }
}
