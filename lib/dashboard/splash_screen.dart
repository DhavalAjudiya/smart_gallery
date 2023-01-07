import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimeOut();
  }

  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeUtils.verticalBlockSize * 40,
            ),
            Image.asset(
              "assets/images/aa.png",
              width: SizeUtils.horizontalBlockSize * 25,
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 4,
            ),
            AppText(
              AppString.photo_video,
              fontSize: SizeUtils.fSize_20(),
              fontWeight: FontWeight.bold,
            ),
            AppText(
              AppString.subStart,
              fontSize: SizeUtils.fSize_12(),
              color: AppColors.black.withOpacity(0.5),
            ),
            SizedBox(
              height: SizeUtils.verticalBlockSize * 30,
            ),
            Lottie.asset("assets/lf30_editor_gvqecwlk.json",
                width: SizeUtils.horizontalBlockSize * 20),
          ],
        ),
      ),
    );
  }

  void startTimeOut() {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigation.pushNamed(Routes.homePage);
      },
    );
  }
}
