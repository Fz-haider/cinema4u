import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/Screen/genres/genres_trailer.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GenresMovies extends StatefulWidget {
  const GenresMovies({super.key});

  @override
  State<GenresMovies> createState() => _GenresMoviesState();
}

class _GenresMoviesState extends State<GenresMovies> {
  var selectedGenres = 0;
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 40,
          width: Width,
          child: FutureBuilder(
              future: genresMovies(),
              builder: (context, snapShot) {
                var data = snapShot.data;
                if (snapShot.hasError) {
                  return Container(
                    child: Text('${snapShot.error}'),
                  );
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const VerticalDivider(
                            color: Colors.transparent,
                            width: 10,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.snow
                                    : AppColor.vulcan,
                            border: Border.all(
                              width: 1.5,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColor.snow
                                  : AppColor.vulcan,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGenres = data[index].id;
                              });
                            },
                            child: Text(
                              data[index].name,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      });
                }
              }),
        ),
        const SizedBox(height: 10),
        selectedGenres == 0
            ? Container()
            : FutureBuilder(
                future: discoverByGenres(selectedGenres),
                builder: (context, snapShot) {
                  var data = snapShot.data;
                  if (snapShot.hasError) {
                    return Center(child: Text('😢 ${snapShot.error}'));
                  } else if (snapShot.connectionState ==
                      ConnectionState.waiting) {
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
                          var movie = data[index];
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    GenresTrailer(movie: movie),
                              ),
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: Width > 600 ? 1 : 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: ApiConstant.TMDB_BASE_IMAGE_URL +
                                      data[index].posterPath,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
      ],
    );
  }
}
