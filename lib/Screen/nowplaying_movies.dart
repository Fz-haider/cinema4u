import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: nowplayingMovies(),
        builder: (context, snapShot) {
          var data = snapShot.data;
          if (snapShot.hasError) {
            return Center(child: Text('😢 ${snapShot.error}'));
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CarouselSlider.builder(
                options: CarouselOptions(
                  initialPage: 0,
                  height: Height * 0.30,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  viewportFraction: Width > 740
                      ? Width > 900
                          ? 0.135
                          : 0.18
                      : Width < 300
                          ? 0.26
                          : 0.28,
                ),
                itemCount: data!.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: EdgeInsets.only(right: Width > 600 ? 1 : 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstant.TMDB_BASE_IMAGE_URL +
                            data[index].posterPath,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  );
                });
          }
        });
  }
}
