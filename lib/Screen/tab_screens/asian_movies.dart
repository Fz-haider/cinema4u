import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AsianMovies extends StatelessWidget {
  const AsianMovies({super.key});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;
    return /*FutureBuilder(
        future: getImdbList(),
        builder: (context, snapShot) {
          if (snapShot.hasData == false) {
            return Center(
              child: Container(
                child: Text('😢${snapShot.error}'),
              ),
            );
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CarouselSlider.builder(
                options: CarouselOptions(
                  initialPage: 0,
                  height: Height * 0.38,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                  viewportFraction: 0.3,
                ),
                itemCount: snapShot.data!.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Card(
                      elevation: 5,
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(snapShot.data![index].image)),
                    ),
                  );
                });
          }
        })*/
        Container();
  }
}
