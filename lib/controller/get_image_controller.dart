import 'dart:convert';

import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:get/get.dart';
import 'package:smart_gallery/modal/photos_modal.dart';

class GetImageController extends GetxController {
  RxInt select = 0.obs;
  List<FileModel> files = <FileModel>[];
  FileModel? screenShot;

  Future<FileModel?> getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!);
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    screenShot = files.last;
    return null;
  }

  @override
  void onInit() {
    getImagesPath();
    super.onInit();
  }
}
