import 'package:accuratetechnicaltest/view/page/UserPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenWidget extends StatelessWidget {
  void _navigateToNextScreen(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: UserPage(),
        ),
      );
    });
  }

  const SplashScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset(
              'assets/datascreenanimation.json',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Text(
                "Technical Test Accurate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Drajat Danu Wardana",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
