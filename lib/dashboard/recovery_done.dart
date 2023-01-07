import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_gallery/Ads_helper/ads/interstitialAd.dart';
import 'package:smart_gallery/controller/get_image_controller.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';

import '../widget/app_text.dart';

class RecoveryDone extends StatefulWidget {
  const RecoveryDone({Key? key}) : super(key: key);

  @override
  State<RecoveryDone> createState() => _RecoveryDoneState();
}

class _RecoveryDoneState extends State<RecoveryDone> {
  bool isChang = false;
  final GetImageController getImageController = Get.find();

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          isChang = true;
        });
        Future.delayed(
          const Duration(seconds: 3),
          () {
            InterstitialAdClass.showInterstitialAds();
            Navigation.popAndPushNamed(Routes.homePage);
            getImageController.getImagesPath();
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isChang == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lf30_editor_fgbu4owd.json"),
                  AppText(
                    " File Recovering ",
                    fontSize: SizeUtils.fSize_16(),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lf30_editor_t5xf7rhf.json"),
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 3,
                  ),
                  AppText(
                    " File Recover Successfully ",
                    fontSize: SizeUtils.fSize_16(),
                  ),
                ],
              ),
      ),
    );
  }
}
