import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final contents = _OnboardingContent.contents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(widthSizer(24, context)),
          child: PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                        visible: currentIndex != contents.length - 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.animateToPage(contents.length,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.linear);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('Skip',
                                      style: TextStyle(color: Colors.black)),
                                  Icon(
                                      IWishIcons
                                          .fluent_ios_arrow_ltr_24_regular,
                                      size: 18,
                                      color: Colors.black)
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: heightSizer(32, context)),
                    _OnboardingScreenContent(
                      currentIndex: currentIndex,
                      imageUrl: contents[i].imageUrl,
                      purpleText: contents[i].titleEnding,
                      blackText: contents[i].titleStarting,
                      description: contents[i].description,
                    ),
                    const SizedBox(height: 24),
                    _CurrentScreenIndicator(currentScreen: currentIndex),
                    SizedBox(height: heightSizer(24, context)),
                    GeneralButton.icon(
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.createAccountOptionScreen);
                        }
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                      buttonText: currentIndex != contents.length - 1
                          ? "Next Feature"
                          : "Create Account",
                      icon: currentIndex != contents.length - 1
                          ? const Icon(IWishIcons.fluent_arrow_right_24_regular)
                          : const SizedBox(),
                    ),
                    Visibility(
                        visible: currentIndex == contents.length - 1,
                        child: Column(
                          children: [
                            SizedBox(
                              height: heightSizer(24, context),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: AppColors.primaryColor),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.homeScreen);
                              },
                              child: const Text('Explore First'),
                            ),
                            SizedBox(
                              height: heightSizer(12, context),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteNames.loginScreen);
                              },
                              child: RichText(
                                  text: TextSpan(
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: widthSizer(16.0, context),
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF333333),
                                      ),
                                      children: const [
                                    TextSpan(text: 'Already have an account? '),
                                    TextSpan(
                                        text: 'Login',
                                        style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w700,
                                            decoration:
                                                TextDecoration.underline))
                                  ])),
                            )
                          ],
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _OnboardingScreenContent extends StatelessWidget {
  const _OnboardingScreenContent({
    Key? key,
    required this.currentIndex,
    required this.imageUrl,
    required this.purpleText,
    required this.blackText,
    required this.description,
  }) : super(key: key);

  final int currentIndex;
  final String imageUrl;
  final String purpleText;
  final String blackText;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox.square(
              dimension: widthSizer(280, context),
              child: Image.asset(imageUrl, fit: BoxFit.scaleDown)),
        ),
        SizedBox(height: heightSizer(12, context)),

        // When is the first screen. the black text comes first,
        // for others the purple text comes first
        RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: widthSizer(40.0, context),
                    fontWeight: FontWeight.w700),
                children: [
              TextSpan(
                  text: purpleText,
                  style: TextStyle(
                      color: currentIndex == 0
                          ? Colors.black
                          : AppColors.primaryColor,
                      fontSize: widthSizer(40.0, context),
                      fontWeight: FontWeight.w700)),
              TextSpan(
                  text: blackText,
                  style: TextStyle(
                      color: currentIndex == 0
                          ? AppColors.primaryColor
                          : Colors.black,
                      fontSize: widthSizer(40.0, context),
                      fontWeight: FontWeight.w700))
            ])),
        SizedBox(height: heightSizer(24, context)),
        SizedBox(
          height: heightSizer(100, context),
          child: Text(
            description,
            style: TextStyle(
              fontSize: widthSizer(16, context),
              fontWeight: FontWeight.normal,
              color: const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}

class _CurrentScreenIndicator extends StatelessWidget {
  const _CurrentScreenIndicator({Key? key, required this.currentScreen})
      : super(key: key);

  final int currentScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _OnboardingContent.contents.length,
        (index) => Container(
          height: 4,
          width: currentScreen == index ? 24 : 4,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentScreen == index
                ? AppColors.primaryColor
                : Colors.black26,
          ),
        ),
      ),
    );
  }
}

/// [titleStarting] and [titleEnding] are joined together to form the title.
/// But due to the fact that they have different colours in the design, we separate them
class _OnboardingContent {
  String imageUrl;
  String titleStarting;
  String titleEnding;
  String description;

  static List<_OnboardingContent> contents = [
    _OnboardingContent._(
        titleStarting: 'wishlists',
        titleEnding: 'Create and \nmanage ',
        imageUrl: 'assets/images/onboarding_screen_1_image.png',
        description:
            "Have a list of wishes you want granted by your loved ones? Start creating tonnes of wishlists with ease."),
    _OnboardingContent._(
        titleStarting: ' from our \nwishlist store',
        titleEnding: 'Shop',
        imageUrl: 'assets/images/onboarding_screen_2_image.png',
        description:
            "Grant loved ones their wishes through our list of special wish items "),
    _OnboardingContent._(
        titleEnding: 'Gift boxing \n',
        titleStarting: 'feature',
        imageUrl: 'assets/images/onboarding_screen_3_image.png',
        description:
            "Experience a unique packaging experience through our virtual gift boxing app and get it delivered to you or your loved ones."),
  ];

  _OnboardingContent._(
      {required this.imageUrl,
      required this.titleStarting,
      required this.titleEnding,
      required this.description});
}
