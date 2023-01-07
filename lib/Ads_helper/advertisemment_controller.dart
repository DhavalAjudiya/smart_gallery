import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:get/get.dart';
import 'package:smart_gallery/Ads_helper/ad_constant.dart';
import 'package:smart_gallery/Ads_helper/ads/interstitialAd.dart';
import 'package:smart_gallery/Ads_helper/ads/open_app_ads.dart';

import 'Ad_modal.dart';

class AdvertisementController extends GetxController {
  @override
  void onInit() {
    // getAdID();
    advertisementData();

    super.onInit();
  }

  late StreamSubscription<FGBGType> subscription;
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  Rx<Adsmodel> adsmodel = Adsmodel().obs;
  Future<void> advertisementData() async {
    await FirebaseFirestore.instance
        .collection('AdvertisementData')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      value.docs.forEach((element) {
        adsmodel.value = Adsmodel.fromDocumentSnapshot(element);
        bool advertisementType =
            getInterstitialType("${adsmodel.value.adMobOrFaceBook}");
        AdConstants.bannerAdsId = adsmodel.value.bannerId ?? "";
        AdConstants.privacyPolicy = adsmodel.value.privacypolicy ?? "";
        AdConstants.appLink = adsmodel.value.applink ?? "";
        AdConstants.nativeAdsId = adsmodel.value.nativeId ?? "";
        AdConstants.interstitialId = adsmodel.value.interstitialId ?? "";
        AdConstants.faceBookInterstitialId =
            adsmodel.value.faceBookInterstitialId ?? "";
        AdConstants.appOpenAdsId = adsmodel.value.appOpenAdsId ?? "";
        AdConstants.faceBookBannerAdsId = adsmodel.value.faceBookBannerId ?? "";
        AdConstants.faceBookNativeAdsId = adsmodel.value.faceBookNativeId ?? "";

        AdConstants.faceBookTestId = adsmodel.value.faceBookTestId ?? "";
        AdConstants.adShowDelayed =
            int.parse(adsmodel.value.secondCountDown ?? "0");
        AdConstants.adShowCount =
            int.parse(adsmodel.value.firstCountDown ?? "0");
        AdConstants.isShowAdsOrNot = adsmodel.value.adsShowOrNot!;
        AdConstants.isShowFacebookBannerAds = advertisementType;
        AdConstants.isShowFacebookInterstitialAds = advertisementType;
        print("object--------------${AdConstants.faceBookInterstitialId}");
        print("object--------------${AdConstants.appOpenAdsId}");
        appInForGroundOrBackGround();

        InterstitialAdClass.loadInterstitialAds();
      });
    });
  }

  static bool getInterstitialType(String? interstitialTypeName) {
    bool isFacebookAds = false;
    if (interstitialTypeName != null) {
      isFacebookAds = interstitialTypeName == 'facebook' ? true : false;
    }
    return isFacebookAds;
  }

  void appInForGroundOrBackGround() {
    // print('app open id is come 111----->>>>${AdConstants.appOpenAdsId}');
    if (AdConstants.isShowAdsOrNot == true) {
      // print('app open id is come 222----->>>>${AdConstants.appOpenAdsId}');
      subscription = FGBGEvents.stream.listen((event) async {
        appOpenAdManager.loadAd(id: AdConstants.appOpenAdsId);
        if (event == FGBGType.foreground) {
          if (!AppOpenAdManager.isShowingAd) {
            appOpenAdManager.showAdIfAvailable();
          }
        }
        if (event == FGBGType.background) {
          appOpenAdManager.loadAd(id: AdConstants.appOpenAdsId);
        }
      });
    }
  }
}
