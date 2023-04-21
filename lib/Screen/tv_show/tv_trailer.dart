import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/models/tv/popular_tv.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TvTrailer extends StatelessWidget {
  final PopularTv tv;
  const TvTrailer({super.key, required this.tv});

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
              future: tvTrailer(tv.id),
              builder: (context, snapShot) {
                var data = snapShot.data;
                if (snapShot.hasError) {
                  return Container(
                    child: Text('😢${snapShot.error}'),
                  );
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapShot.hasData) {
                  var imageURL = '';
                  if (tv.posterPath != null) {
                    imageURL = ApiConstant.TMDB_BASE_IMAGE_URL + tv.posterPath!;
                  } else {
                    imageURL =
                        "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png";
                  }
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imageURL,
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
                                    : 'https://www.youtube.com/results?search_query=${tv.name}');
                                try {
                                  await launchUrl(
                                    youtubeUrl,
                                    mode: LaunchMode.platformDefault,
                                  );
                                } catch (e) {
                                  Text('$e');
                                }
                              },
                              child: const Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black38,
                                  radius: 36,
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.yellow,
                                    size: 65,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]);
                } else {
                  return const Text('No Data Availabel');
                }
              }),
          FutureBuilder(
              future: tvDetail(tv.id),
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
                              Text('Episode RunTime'.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                              Text(data.episodeRunTime.toString(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Number Of Episodes'.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                              Text(data.numberOfEpisodes.toString(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Number Of Seasons'.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                              Text(data.numberOfSeasons.toString(),
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
