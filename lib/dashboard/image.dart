import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';

class ImageDowonload extends StatefulWidget {
  const ImageDowonload({Key? key}) : super(key: key);

  @override
  State<ImageDowonload> createState() => _ImageDowonloadState();
}

class _ImageDowonloadState extends State<ImageDowonload> {
  var im;
  @override
  Widget build(BuildContext context) {
    im = Get.arguments;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: SizeUtils.verticalBlockSize * 60,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Image.file(
                  File(im["ima"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 5,
            ),
            GestureDetector(
              onTap: () {
                Navigation.popAndPushNamed(Routes.recoveryDone);
                // createFolder("Restore");
                // createAppFolder();
                setState(() {});
              },
              child: Container(
                height: SizeUtils.verticalBlockSize * 7,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8)),
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
          ],
        ),
      ),
    );
  }
}
