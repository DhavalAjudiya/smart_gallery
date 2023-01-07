import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_gallery/controller/get_image_controller.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';

class PhotosShow extends StatelessWidget {
  PhotosShow({Key? key}) : super(key: key);
  final GetImageController getImageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getImageController.screenShot?.files?.isEmpty ?? false
                ? Padding(
                    padding:
                        EdgeInsets.only(top: SizeUtils.verticalBlockSize * 25),
                    child: AppText(
                      "No Image Found",
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_20(),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                          bottom: SizeUtils.verticalBlockSize * 8),
                      itemCount: getImageController.screenShot?.files?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 1 / 1,
                      ),
                      itemBuilder: (_, i) {
                        var file = getImageController.screenShot?.files?[i];

                        return GestureDetector(
                          onTap: () {
                            // // getImageController.select.value++;
                            // Get.to(ImageDowonload(), arguments: {
                            //   "ima": file.toString(),
                            // });
                          },
                          child: SizedBox(
                            height: SizeUtils.verticalBlockSize * 18,
                            width: double.infinity,
                            child: Image.file(
                              File(file.toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
/*
      bottomSheet: Obx(
        () => getImageController.select.value == 0
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  // if (getImageController.select.value == 0) {
                  //   Get.snackbar("Error", "Select The Photos",
                  //       backgroundColor: Colors.purple,
                  //       colorText: AppColors.white);
                  // } else {
                  Navigation.popAndPushNamed(Routes.recoveryDone);
                  // }
                },
                child: Container(
                  height: SizeUtils.verticalBlockSize * 7,
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.purple,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.horizontalBlockSize * 2),
                    child: AppText(
                      AppString.re,
                      fontSize: SizeUtils.fSize_18(),
                      letterSpacing: 0.5,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
      ),
*/
    );
  }
}
