import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema4u/models/movies/movie_images.dart';
import 'package:cinema4u/models/movies/nowplaying_movies.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/models/multi_search/multi_search.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchDetail extends StatelessWidget {
  final MultiSearch movie;
  const SearchDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
            future: movieTrailer(movie.id!),
            builder: (context, snapShot) {
              var data = snapShot.data;
              if (snapShot.hasError) {
                return Center(child: Text('😢${snapShot.error}'));
              } else if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: ApiConstant.TMDB_BASE_IMAGE_URL +
                                movie.posterPath!,
                            height: Height * 0.55,
                            width: Width * 1,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: () async {
                              var youtubeUrl = Uri.parse(data!.isNotEmpty
                                  ? 'https://www.youtube.com/watch?v=${data[0].key}'
                                  : 'https://www.youtube.com/results?search_query=${movie.title}');
                              try {
                                await launchUrl(
                                  youtubeUrl,
                                  mode: LaunchMode.platformDefault,
                                );
                              } catch (e) {
                                Text('$e');
                              }
                            },
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.black38,
                                radius: 36,
                                child: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.yellow.shade700,
                                  size: 65,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
              future: movieDetail(movie.id!),
              builder: (context, snapShot) {
                var data = snapShot.data;
                print(movie.id);
                if (snapShot.hasError) {
                  return Container(
                    child: Text('😢${snapShot.error}'),
                  );
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 12, left: 12),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data!.originalTitle.toUpperCase(),
                            style: TextStyle(fontSize: 20),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 12, right: 12, bottom: 6),
                        child: Row(
                          textDirection: TextDirection == Locale('en')
                              ? TextDirection.ltr
                              : TextDirection.ltr,
                          mainAxisAlignment:
                              MainAxisAlignment == const Locale('en')
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.start,
                          children: [
                            Text(data.genres![0].name,
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade700,
                                    size: 16,
                                  ),
                                  Text(data.voteAverage.round().toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 12, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Overview'.toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 10),
                        child: Text(data.overview,
                            textDirection: TextDirection == Locale('en')
                                ? TextDirection.ltr
                                : TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 14,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Release Date'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.yellow.shade700,
                                    fontSize: 16,
                                  )),
                              Text(data.releaseDate.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Run Time'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.yellow.shade700,
                                    fontSize: 16,
                                  )),
                              Text(data.runtime.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Budget'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.yellow.shade700,
                                    fontSize: 16,
                                  )),
                              Text(data.budget.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          )
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 17, left: 12, right: 12, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Screenshot'.toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                        height: Height * 0.2,
                        child: FutureBuilder(
                            future: movieImages(movie.id!),
                            builder: (context, snapShot) {
                              if (snapShot.hasError) {
                                return Center(
                                    child: Text('😢${snapShot.error}'));
                              } else if (snapShot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                var data = snapShot.data!;
                                return CarouselSlider.builder(
                                    options: CarouselOptions(
                                      initialPage: 0,
                                      autoPlay: true,
                                      height: Height * 0.4,
                                      pauseAutoPlayOnTouch: true,
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 3),
                                      viewportFraction: Width > 700 ? 0.4 : 0.6,
                                      aspectRatio: 16 / 9,
                                      enlargeCenterPage: true,
                                    ),
                                    itemCount: data.backdrops!.length,
                                    itemBuilder: (context, index, realIndex) {
                                      var bd = data.backdrops![index];
                                      return ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: CachedNetworkImage(
                                          imageUrl: bd == null
                                              ? "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png"
                                              : ApiConstant
                                                      .TMDB_BASE_IMAGE_URL +
                                                  bd.filePath!,
                                          height: Height * 0.4,
                                          width: Width * 1,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      );
                                    });
                              }
                            }),
                      ),
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }
}
