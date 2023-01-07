import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:smart_gallery/Ads_helper/ads/banner_ads_widget.dart';
import 'package:smart_gallery/Ads_helper/ads/full_banner_ads.dart';
import 'package:smart_gallery/Ads_helper/ads/interstitialAd.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';

class RecoveryFile extends StatelessWidget {
  const RecoveryFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  AppString.allFile,
                  fontSize: SizeUtils.fSize_20(),
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
                _recoveryType(
                    icon: Icons.photo_library_rounded,
                    text: AppString.photo,
                    subtext: AppString.getDeleted,
                    onTap: () {
                      // InterstitialAdClass.showInterstitialAds();
                      Navigation.pushNamed(Routes.photoRecovery);
                    }),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 3,
                ),
                _recoveryType(
                    icon: Icons.video_collection,
                    text: AppString.video,
                    subtext: AppString.getDeleted,
                    onTap: () {
                      // InterstitialAdClass.showInterstitialAds();
                      Navigation.pushNamed(Routes.videoRecovery);
                    }),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 3,
                ),
                // _recoveryType(
                //   icon: Icons.audio_file_sharp,
                //   text: AppString.audio,
                //   subtext: AppString.getDeleted,
                // ),
                // SizedBox(
                //   height: SizeUtils.horizontalBlockSize * 3,
                // ),
              ],
            ),
          ),
          BannerAds(),
          FullBannerAds(),
        ],
      ),
    );
  }

  //
  _recoveryType({
    String text = "",
    String subtext = "",
    IconData? icon,
    final GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 22,
                child: Icon(
                  icon,
                  color: AppColors.white,
                  size: 27,
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text,
                    fontSize: SizeUtils.fSize_15(),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  AppText(
                    subtext,
                    fontSize: SizeUtils.fSize_12(),
                    color: AppColors.black.withOpacity(0.4),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.purple,
                // size: 27,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
