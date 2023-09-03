import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../core/local_storage/app_cache.dart';
import '../di/injector.dart';
import '../router/router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final cache = sl<AppCache>();

  void _onIntroEnd(context) {
    cache.setIntroState(true);
    GoRouter.of(context).pushReplacementNamed(RouteConstants.login);
  }

  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('images/flutter.png', 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Discover Fashion Online",
          bodyWidget: const Text(
              "We have something special just for you. Swipe through our app and dive into a world of fashion that speaks to your unique style.",
              style: bodyStyle),
          decoration: pageDecoration.copyWith(
            bodyFlex: 4,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/instagram.png'),
          reverse: true,
        ),
        PageViewModel(
          title: "Find Your Perfect Style",
          bodyWidget: const Text(
              "Say goodbye to crowded malls and hello to hassle-free shopping with BoutiQ",
              style: bodyStyle),
          decoration: pageDecoration.copyWith(
            bodyFlex: 4,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/twitter.png'),
          reverse: true,
        ),
        PageViewModel(
          title: "Shop Anytime, Anywhere",
          bodyWidget: const Text(
              "We understand that fashion has no boundaries.Swipe through our app and dive into a world of fashion",
              style: bodyStyle),
          decoration: pageDecoration.copyWith(
            bodyFlex: 4,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: _buildImage('images/facebook.png'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      done: const Text('Start',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
