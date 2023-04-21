import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema4u/Screen/tv_show/tv_trailer.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: popularTv(),
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
                  var tv = data[index];
                  var imageURL = '';
                  if (data[index].posterPath != null) {
                    imageURL = ApiConstant.TMDB_BASE_IMAGE_URL +
                        data[index].posterPath!;
                  } else {
                    imageURL =
                        "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png";
                  }
                  return Container(
                    margin: EdgeInsets.only(right: Width > 600 ? 1 : 10),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => TvTrailer(tv: tv),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: imageURL,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                });
          }
        });
  }
}
