import 'dart:io';

import 'package:album_image/album_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:smart_gallery/Ads_helper/ads/banner_ads_widget.dart';
import 'package:smart_gallery/dashboard/photo_re.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';
import 'package:transparent_image/transparent_image.dart';

class VideoRecovery extends StatefulWidget {
  const VideoRecovery({Key? key}) : super(key: key);

  @override
  State<VideoRecovery> createState() => _VideoRecoveryState();
}

class _VideoRecoveryState extends State<VideoRecovery> {
  bool isChang = false;
  int select = 0;
  int fileCount = 0;

  @override
  void initState() {
    initAsync();

    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          isChang = true;
          _loading = true;
        });
      },
    );
    super.initState();
  }

  List<Album>? _albums;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeUtils.horizontalBlockSize * 1,
          right: SizeUtils.horizontalBlockSize * 1,
        ),
        child: Builder(
          builder: (context) {
            final thumbnailQuality = MediaQuery.of(context).size.width ~/ 3;
            return isChang == false
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lf30_editor_egx1ptiv.json',
                          width: SizeUtils.horizontalBlockSize * 20,
                        ),
                        fileCount == 0
                            ? const SizedBox()
                            : AppText(
                                "$fileCount File Available",
                                fontSize: SizeUtils.fSize_17(),
                              ),
                        AppText(
                          AppString.analyzing.toUpperCase(),
                          fontSize: SizeUtils.fSize_20(),
                        ),
                      ],
                    ),
                  )
                : _loading == false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          double gridWidth = (constraints.maxWidth - 20) / 3;
                          double gridHeight = gridWidth + 33;
                          double ratio = gridWidth / gridHeight;
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child: GridView.count(
                              childAspectRatio: ratio,
                              crossAxisCount: 3,
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              children: <Widget>[
                                ...?_albums?.map(
                                  (album) => GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AlbumPage(album))),
                                    child: Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Container(
                                            color: Colors.grey[300],
                                            height: gridWidth,
                                            width: gridWidth,
                                            child: FadeInImage(
                                              fit: BoxFit.cover,
                                              placeholder: MemoryImage(
                                                  kTransparentImage),
                                              image: AlbumThumbnailProvider(
                                                albumId: album.id,
                                                mediumType: album.mediumType,
                                                highQuality: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              const EdgeInsets.only(left: 2.0),
                                          child: Text(
                                            album.name ?? "Unnamed Album",
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              height: 1.2,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              const EdgeInsets.only(left: 2.0),
                                          child: Text(
                                            album.count.toString(),
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              height: 1.2,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
          },
        ),
      ),
      bottomSheet: BannerAds(),
    );
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums =
          await PhotoGallery.listAlbums(mediumType: MediumType.video);
      setState(() {
        _albums = albums;
      });
    }
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          fileCount = _albums?.first.count ?? 0;
        });
      },
    );
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }
}
