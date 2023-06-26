import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sujashoei/constants/font_registry.dart';
import 'package:sujashoei/screens/login/login_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
   @override
  void initState() {
    _controller = AnimationController(vsync: this,);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 250,height: 250,
              child: Lottie.asset(
                'assets/animations/94350-gears-lottie-animation.json',
                controller: _controller,
                onLoaded: (p0) {
                  _controller
                    ..duration = Duration(milliseconds: 4000)
                    ..forward().then((value) => Navigator.push(
                        context,
                        PageTransition(child: LoginPage(), type: PageTransitionType.bottomToTopPop)));
                },
              ),
            ),
            Headings(
              subHeading: 'Suja Shoei',
            )
          ],
        ),
      ),
    );
  }
}
