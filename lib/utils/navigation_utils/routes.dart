import 'package:get/get.dart';
import 'package:smart_gallery/dashboard/app_work_detailes.dart';
import 'package:smart_gallery/dashboard/home_page.dart';
import 'package:smart_gallery/dashboard/photo_recovery.dart';
import 'package:smart_gallery/dashboard/photos_show.dart';
import 'package:smart_gallery/dashboard/recovery_done.dart';
import 'package:smart_gallery/dashboard/recovery_file.dart';
import 'package:smart_gallery/dashboard/splash_screen.dart';
import 'package:smart_gallery/dashboard/video_recovery.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String splash = '/splash';
  static const String homePage = '/homePage';
  static const String appWork = '/appWork';
  static const String recoverFile = '/recoverFile';
  static const String photoRecovery = '/photoRecovery';
  static const String videoRecovery = '/videoRecovery';
  static const String recoveryDone = '/recoveryDone';
  static const String photosShow = '/photosShow';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: homePage,
      page: () => HomePage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: appWork,
      page: () => const AppWork(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: recoverFile,
      page: () => const RecoveryFile(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: photoRecovery,
      page: () => PhotoRecovery(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: videoRecovery,
      page: () => const VideoRecovery(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: recoveryDone,
      page: () => RecoveryDone(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: photosShow,
      page: () => PhotosShow(),
      transition: defaultTransition,
    ),
  ];
}
