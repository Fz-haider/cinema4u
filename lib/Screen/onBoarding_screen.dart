import 'package:cinema4u/language_constants.dart';
import 'package:cinema4u/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<Image> images = [
    const Image(image: AssetImage('assets/images/introduction1.png')),
    const Image(image: AssetImage('assets/images/introduction2.png')),
    const Image(image: AssetImage('assets/images/introduction3.png')),
  ];
  var texts = [
    "Search for your Movie",
    'Get Every details on it',
    'Enjoy with us',
  ];

  var animationDuration = 500; // in millis

  @override
  Widget build(BuildContext context) {
    //Responsiveness
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double Width = MediaQuery.of(context).size.width;

    PageController pageController = PageController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.vulcan,
        body: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Height > 200
                        ? Container(
                            height: Height > 300 ? Height * 0.1 : Height * 0.08,
                            child: SmoothPageIndicator(
                                controller: pageController,
                                count: 3,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: AppColor.violet,
                                  dotColor: Colors.grey.shade300,
                                ),
                                onDotClicked: (index) {
                                  pageController.jumpToPage(index);
                                }),
                          )
                        : Container(),
                    SizedBox(
                      height: Height > 300 ? Height * 0.03 : Height * 0.0,
                    ),
                    Container(
                      height: Height * 0.5,
                      width: Width > 800 ? 670 : Width * 0.7,
                      child: Image(
                        fit: ((Height) > 640 && (Width) > 480)
                            ? BoxFit.fill
                            : BoxFit.contain,
                        image: images[index].image,
                      ),
                    ),
                    SizedBox(
                      height: Height > 300 ? Height * 0.04 : Height * 0.03,
                    ),
                    Height > 200
                        ? Container(
                            child: Text(
                              texts[index],
                              style: TextStyle(
                                fontSize:
                                    ((Height) > 640 && (Width) > 420) ? 16 : 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.snow,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: Height > 300 ? Height * 0.1 : Height * 0.03,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.violet),
                      icon: index < 2
                          ? const Icon(Icons.arrow_forward)
                          : const Icon(Icons.done),
                      label: index < 2
                          ? Text(translation(context).next)
                          : Text(translation(context).done),
                      onPressed: () {
                        if (index < 2) {
                          pageController.nextPage(
                            duration: Duration(milliseconds: animationDuration),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "HomePage", (route) => false);
                        }
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
