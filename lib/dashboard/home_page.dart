import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:smart_gallery/Ads_helper/ad_constant.dart';
import 'package:smart_gallery/Ads_helper/ads/full_banner_ads.dart';
import 'package:smart_gallery/Ads_helper/ads/interstitialAd.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';

import '../controller/get_image_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final InAppReview inAppReview = InAppReview.instance;
  final GetImageController getImageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeUtils.horizontalBlockSize * 15,
                  left: SizeUtils.horizontalBlockSize * 5,
                  right: SizeUtils.horizontalBlockSize * 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      AppString.hHeader,
                      fontSize: SizeUtils.fSize_20(),
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 4,
                        bottom: SizeUtils.horizontalBlockSize * 5,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          InterstitialAdClass.showInterstitialAds();
                          Navigation.pushNamed(Routes.appWork);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      AppString.startApplication,
                                      fontSize: SizeUtils.fSize_18(),
                                      letterSpacing: 0.5,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: SizeUtils.horizontalBlockSize * 1,
                                    ),
                                    AppText(
                                      AppString.subStart,
                                      fontSize: SizeUtils.fSize_12(),
                                      color: AppColors.white.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.white,
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            _moreButton(
                              onTap: shareNoteLink,
                              text: AppString.shareApp,
                              subtext: AppString.clickHere,
                              icon: Icons.share,
                              top: SizeUtils.horizontalBlockSize * 4,
                            ),
                            SizedBox(
                              height: SizeUtils.horizontalBlockSize * 3,
                            ),
                            _moreButton(
                              onTap: rateMyApp,
                              text: AppString.rate,
                              subtext: AppString.clickHere,
                              icon: Icons.star_rate,
                              top: SizeUtils.horizontalBlockSize * 13,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            _moreButton(
                              onTap: privacyPolicyLink,
                              text: AppString.privacy,
                              subtext: AppString.clickHere,
                              icon: Icons.privacy_tip,
                              top: SizeUtils.horizontalBlockSize * 13,
                            ),
                            SizedBox(
                              height: SizeUtils.horizontalBlockSize * 3,
                            ),
                            /*  GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                height: SizeUtils.verticalBlockSize * 14,
                                width: SizeUtils.horizontalBlockSize * 40,
                                child: getImageController
                                            .screenShot?.files?.isEmpty ??
                                        false
                                    ? AppText(
                                        "No Image Found",
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeUtils.fSize_20(),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          File(getImageController
                                                  .screenShot?.files?.last
                                                  .toString() ??
                                              ""),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            const AppText(
                              "Recovery_Image",
                              fontWeight: FontWeight.w600,
                            ),*/

                            _moreButton(
                              onTap: () {
                                Navigation.pushNamed(Routes.photosShow);
                              },
                              text: AppString.recovery,
                              subtext: AppString.clickHere,
                              icon: Icons.restore,
                              top: SizeUtils.horizontalBlockSize * 4,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 5,
                    ),
                    const FullBannerAds(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _moreButton({
    String text = "",
    String subtext = "",
    IconData? icon,
    double? height,
    double top = 0,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        width: SizeUtils.horizontalBlockSize * 40,
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeUtils.horizontalBlockSize * 22,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 22,
                  child: Icon(
                    icon,
                    color: AppColors.white,
                    size: 27,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: top,
                ),
                child: AppText(
                  text,
                  fontSize: SizeUtils.fSize_15(),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeUtils.horizontalBlockSize * 1,
                ),
                child: AppText(
                  subtext,
                  fontSize: SizeUtils.fSize_12(),
                  color: AppColors.black.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> shareNoteLink() async {
    try {
      await FlutterShare.share(
        title: "Photos & videos Recovery",
        text: "Photos & videos Recovery",
        linkUrl: AdConstants.appLink,
        chooserTitle: '',
      );
    } catch (e) {}
  }

  Future<void> privacyPolicyLink() async {
    try {
      await FlutterShare.share(
        title: "Photos & videos Recovery",
        text: "Photos & videos Recovery",
        linkUrl: AdConstants.privacyPolicy,
        chooserTitle: '',
      );
    } catch (e) {}
  }

  Future<void> rateMyApp() async {
    try {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      } else {
        Get.snackbar(
          "Error",
          "App Is Available",
          colorText: AppColors.white,
          backgroundColor: Colors.purple,
        );
      }
    } catch (e) {}
  }
}
