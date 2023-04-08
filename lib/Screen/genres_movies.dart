import 'package:cinema4u/api/api_connection.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GenresMovies extends StatefulWidget {
  const GenresMovies({super.key});

  @override
  State<GenresMovies> createState() => _GenresMoviesState();
}

class _GenresMoviesState extends State<GenresMovies> {
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return Container(
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
            } else if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const VerticalDivider(
                          color: Colors.transparent,
                          width: 10,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.vulcan,
                              border:
                                  Border.all(width: 1.5, color: AppColor.snow),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Text(
                              data[index].name,
                              style: TextStyle(
                                color: AppColor.snow,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }
          }),
    );
  }
}
