import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/models/movies/trending_movies.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatelessWidget {
  final TrendingMovies movie;
  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.vulcan,
      body: ListView(
        children: [
          FutureBuilder(
            future: youtubeTrailer(movie.id),
            builder: (context, snapShot) {
              var data = snapShot.data;
              if (snapShot.hasError) {
                return Container(
                  child: Text('😢${snapShot.error}'),
                );
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
                                movie.posterPath,
                            height: Height * 0.55,
                            width: Width * 1,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Column(
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                var youtubeUrl = Uri.parse(
                                    'https://www.youtube.com/watch?v=${data![0].key}');
                                try {
                                  await launchUrl(
                                    youtubeUrl,
                                    mode: LaunchMode.platformDefault,
                                  );
                                } catch (e) {
                                  Container(
                                    child: Text('$e'),
                                  );
                                }
                              },
                              child: Container(
                                width: Width * 0.8,
                                height: Height * 0.2,
                                margin: EdgeInsets.only(top: 120),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.yellow,
                                      size: 65,
                                    ),
                                    Container(
                                      width: Width * 0.8,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        movie.title.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          color: AppColor.snow,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
              future: movieDetail(movie.id),
              builder: (context, snapShot) {
                var data = snapShot.data;
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
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Overview'.toUpperCase(),
                            style:
                                TextStyle(color: AppColor.snow, fontSize: 14),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                        ),
                        child: Text(data!.overview,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.snow,
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
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                              Text(data.releaseDate.toString(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Run Time'.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                              Text(data.runtime.toString(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Budget'.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                              Text(data.budget.toString(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                            ],
                          )
                        ],
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
