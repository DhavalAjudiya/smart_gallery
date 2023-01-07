import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

///just call this controller ONLY ONE TIME to set data in firebase, then comment that calling

class AdController extends GetxController {
  Future<void> setAdsData() async {
    await FirebaseFirestore.instance
        .collection('AdvertisementData')
        .doc("updateAdvertisementData")
        .set({
      'adsShowOrNot': true,
      'interstitialId': 'ca-app-pub-3940256099942544/1033173712',
      'bannerId': 'ca-app-pub-3940256099942544/2247696110',
      'nativeId': 'ca-app-pub-3940256099942544/6300978111',
      // 'firstCountDown': int.parse(firstCountDownController.text),
      // 'secondCountDown': int.parse(secondCountDownController.text),
      'firstCountDown': '2',
      'faceBookInterstitialId':
          'IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617',
      'faceBookBannerId':
          'IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047',
      'faceBookNativeId':
          'IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512',
      'appOpenAdsId': 'ca-app-pub-3940256099942544/3419835294',
      'adMobOrFaceBook': 'facebook',
      // 'docId': docId,
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setAdsData();
  }
}
