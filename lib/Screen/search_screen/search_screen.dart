import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema4u/Screen/nowPlaying_movies/nowplaying_trailer.dart';
import 'package:cinema4u/Screen/search_screen/search_detail.dart';
import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/api/api_constant.dart';
import 'package:cinema4u/Screen/nowPlaying_movies/nowplaying_movies.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  String query = "";
  late double Height = -1, Width;
  @override
  Widget build(BuildContext context) {
    if (Height == -1) {
      Height = MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top;
      Width = MediaQuery.of(context).size.width;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cinema4u'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColor.snow
                      : AppColor.vulcan,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onSubmitted: (value) => setState(() {
                  query = value.toLowerCase();
                }),
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        query = controller.text.toLowerCase();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          query == ''
              ? const Text('')
              : FutureBuilder(
                  future: multiSearch(query),
                  builder: (context, snapShot) {
                    var data = snapShot.data;
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapShot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              var imageURL = '';
                              if (data[index].posterPath != null) {
                                imageURL = ApiConstant.TMDB_BASE_IMAGE_URL +
                                    data[index].posterPath!;
                              } else {
                                imageURL =
                                    "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png";
                              }
                              var movie = data[index];
                              return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SearchDetail(movie: movie),
                                  ),
                                ),
                                child: Container(
                                  height: Height * 0.2,
                                  width: Width * 0.8,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: Width * 0.4,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: imageURL,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) => Icon(
                                              Icons.error,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: Width * 0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: Height * 0.1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Width * 0.4,
                                                      child: Text(
                                                        data[index].title ??
                                                            'No title',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          color: Color.fromRGBO(
                                                              255, 235, 59, 1),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          data[index].voteAverage ==
                                                                  null
                                                              ? ''
                                                              : data[index]
                                                                  .voteAverage!
                                                                  .round()
                                                                  .toString(),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                            Center(
                                              child: Container(
                                                height: Height * 0.1,
                                                child: Text(
                                                    data[index].overview ??
                                                        'no overview'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapShot.hasData == false) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Text('Not Available'),
                      );
                    } else {
                      return Text('there is no data');
                    }
                  })
        ],
      ),
    );
  }
}
