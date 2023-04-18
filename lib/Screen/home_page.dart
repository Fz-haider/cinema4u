import 'package:cinema4u/Screen/genres_movies.dart';
import 'package:cinema4u/Screen/trending_movies.dart';
import 'package:cinema4u/Screen/nowplaying_movies.dart';
import 'package:cinema4u/language.dart';
import 'package:cinema4u/language_constants.dart';
import 'package:cinema4u/main.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.vulcan,
      drawer: Drawer(
          backgroundColor: AppColor.snow,
          elevation: 0,
          child: ListView(children: [
            ListTile(
              leading: const Icon(Icons.language_outlined),
              title: Text(translation(context).language),
              trailing: DropdownButton(
                onChanged: (Language? language) async {
                  if (language != null) {
                    Locale _locale = await setLocale(language.languageCode);
                    MyApp.setLocale(context, _locale );
                  }
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              e.flag,
                              style: const TextStyle(fontSize: 30),
                            ),
                            Text(e.name),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ])),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cinema4u'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('SearchScreen');
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const TrendingMovies(),
          SizedBox(height: Height * 0.03),
          const GenresMovies(),
          SizedBox(height: Height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('Now Playing',
                    style: TextStyle(
                      color: AppColor.snow,
                      fontSize: Width > 700 ? 20 : 16,
                    )),
              ),
            ],
          ),
          SizedBox(height: Height * 0.03),
          NowPlayingMovies(),
        ],
      ),
    );
  }
}
