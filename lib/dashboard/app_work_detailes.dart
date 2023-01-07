import 'package:flutter/material.dart';
import 'package:smart_gallery/Ads_helper/ads/full_banner_ads.dart';
import 'package:smart_gallery/Ads_helper/ads/interstitialAd.dart';
import 'package:smart_gallery/Ads_helper/ads/native_ads.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';

class AppWork extends StatelessWidget {
  const AppWork({Key? key}) : super(key: key);

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
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigation.pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 4,
                    ),
                    AppText(
                      AppString.howThis,
                      fontSize: SizeUtils.fSize_20(),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 2,
                    ),
                    AppText(
                      AppString.appHelp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 2,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 80,
                      child: AppText(
                        AppString.appWillShow,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 2,
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 80,
                      child: AppText(
                        AppString.pleaseBe,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
                GestureDetector(
                  onTap: () {
                    InterstitialAdClass.showInterstitialAds();

                    Navigation.pushNamed(Routes.recoverFile);
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
                          vertical: SizeUtils.horizontalBlockSize * 4),
                      child: AppText(
                        AppString.startAR,
                        fontSize: SizeUtils.fSize_18(),
                        letterSpacing: 0.5,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 5,
                ),
              ],
            ),
          ),
          NativeAds(),
        ],
      ),
    );
  }
}
