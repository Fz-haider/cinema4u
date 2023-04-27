import 'package:cinema4u/Screen/genres/genres_movies.dart';
import 'package:cinema4u/Screen/tv_show/popular_tv.dart';
import 'package:cinema4u/Screen/nowPlaying_movies/nowplaying_movies.dart';
import 'package:cinema4u/language.dart';
import 'package:cinema4u/language_constants.dart';
import 'package:cinema4u/main.dart';
import 'package:cinema4u/Screen/trending_movies/trending_movies.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:cinema4u/theme/change_themebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var activeColor = false;
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
          backgroundColor: AppColor.vulcan.withOpacity(0.9),
          elevation: 0,
          child: ListView(children: [
            ListTile(
                leading: Icon(
                  Icons.language_outlined,
                  color: AppColor.snow,
                ),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                        underline: const SizedBox(),
                        hint: Text(
                          translation(context).changeLanguage,
                          style: TextStyle(
                            color: AppColor.snow,
                          ),
                        ),
                        onChanged: (Language? language) async {
                          if (language != null) {
                            Locale locale =
                                await setLocale(language.languageCode);
                            MyApp.setLocale(context, locale);
                          }
                        },
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>((e) =>
                                DropdownMenuItem(value: e, child: Text(e.name)))
                            .toList(),
                      )
                    ])),
            ListTile(
              leading: Icon(
                CupertinoIcons.moon_stars,
                color: AppColor.snow,
              ),
              trailing: const ChangeThemeButtonWidget(),
            )
          ])),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cinema4u'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('SearchScreen');
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          const TrendingMovies(),
          SizedBox(height: Height * 0.03),
          const GenresMovies(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(translation(context).movie,
                    style: TextStyle(
                      fontSize: Width > 700 ? 20 : 16,
                    )),
              ),
            ],
          ),
          const NowPlayingMovies(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(translation(context).tvShow,
                    style: TextStyle(
                      fontSize: Width > 700 ? 20 : 16,
                    )),
              ),
            ],
          ),
          const PopularTv(),
        ],
      ),
    );
  }
}
