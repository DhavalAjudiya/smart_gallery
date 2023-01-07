import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:smart_gallery/Ads_helper/ad_constant.dart';
import 'package:smart_gallery/Ads_helper/advertisemment_controller.dart';
import 'package:smart_gallery/controller/get_image_controller.dart';

import 'package:smart_gallery/utils/my_behavior.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';

AppOpenAd? myAppOpenAd;

void loadAppOpenAd() {
  AppOpenAd.load(
      // adUnitId: "ca-app-pub-3940256099942544/3419835294",
      adUnitId: AdConstants.appOpenAdsId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            myAppOpenAd = ad;
            myAppOpenAd!.show();
          },
          onAdFailedToLoad: (error) {}),
      orientation: AppOpenAd.orientationPortrait);
}

InterstitialAd() async {
  FacebookInterstitialAd.loadInterstitialAd(
    placementId: AdConstants.faceBookInterstitialId,
    // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
    listener: (result, value) {
      if (result == InterstitialAdResult.LOADED) {
        FacebookInterstitialAd.showInterstitialAd();
      }
      if (result == InterstitialAdResult.ERROR &&
          value["invalidated"] == true) {
        loadAppOpenAd();
      }
    },
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InterstitialAd();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      initialBinding: AppBidding(),
      initialRoute: Routes.splash,
      getPages: Routes.pages,
    );
  }
}

class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put<AdvertisementController>(AdvertisementController());
    Get.put<GetImageController>(GetImageController());
  }
}
