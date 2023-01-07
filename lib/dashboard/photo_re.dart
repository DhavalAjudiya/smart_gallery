import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:screenshot/screenshot.dart';
import 'package:smart_gallery/theme/app_colors.dart';
import 'package:smart_gallery/theme/app_string.dart';
import 'package:smart_gallery/utils/navigation_utils/navigation.dart';
import 'package:smart_gallery/utils/navigation_utils/routes.dart';
import 'package:smart_gallery/utils/size_utiles.dart';
import 'package:smart_gallery/widget/app_text.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

class AlbumPage extends StatefulWidget {
  final Album album;

  AlbumPage(Album album) : album = album;

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  List<Medium>? _media;
  int select = 0;
  bool isChange = false;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  MediaPage? mediaPage;

  void initAsync() async {
    MediaPage mediaPage = await widget.album.listMedia();
    setState(() {
      _media = mediaPage.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigation.pop(),
        ),
        title: Text(widget.album.name ?? "Unnamed Album"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          ...?_media?.map(
            (medium) {
              return GestureDetector(
                onTap: () {
                  Get.to(ViewerPage(medium));
                  setState(() {});
                },
                child: Container(
                  color: Colors.grey[300],
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: ThumbnailProvider(
                      mediumId: medium.id,
                      mediumType: medium.mediumType,
                      highQuality: true,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ViewerPage extends StatefulWidget {
  final Medium medium;

  const ViewerPage(this.medium, {super.key});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: widget.medium.mediumType == MediumType.image
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Screenshot(
                        controller: screenshotController,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: SizeUtils.verticalBlockSize * 60,
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: MemoryImage(kTransparentImage),
                              image: PhotoProvider(mediumId: widget.medium.id),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          createImageFolder();
                          screenshotController.captureAndSave(
                            delay: Duration.zero,
                            "/storage/emulated/0/Download/Recovery_Image",
                          );
                          Navigation.popAndPushNamed(Routes.recoveryDone);
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
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Screenshot(
                        controller: screenshotController,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: SizeUtils.verticalBlockSize * 80,
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: VideoProvider(
                              mediumId: widget.medium.id,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          createImageFolder();
                          screenshotController.captureAndSave(
                            delay: Duration.zero,
                            "/storage/emulated/0/Download/Recovery_Image",
                          );
                          Navigation.popAndPushNamed(Routes.recoveryDone);
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
                )),
    );
  }

  Future<void> createImageFolder() async {
    try {
      // final directory = await getExternalStorageDirectory();
      const dirPath = '/storage/emulated/0/Download/Recovery_Image';

      final path = Directory(dirPath);
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      if ((await path.exists())) {
      } else {
        path.create();
      }
    } catch (e) {
      print("directory---------$e");
    }
  }

  Future<void> createVideoFolder() async {
    try {
      // final directory = await getExternalStorageDirectory();
      const dirPath = '/storage/emulated/0/Download/Recovery_Video';

      final path = Directory(dirPath);
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      if ((await path.exists())) {
      } else {
        path.create();
      }
    } catch (e) {
      print("directory---------$e");
    }
  }
}

class VideoProvider extends StatefulWidget {
  final String mediumId;

  const VideoProvider({
    super.key,
    required this.mediumId,
  });

  @override
  _VideoProviderState createState() => _VideoProviderState();
}

class _VideoProviderState extends State<VideoProvider> {
  VideoPlayerController? _controller;
  File? _file;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAsync();
    });
    super.initState();
  }

  Future<void> initAsync() async {
    try {
      _file = await PhotoGallery.getFile(
        mediumId: widget.mediumId,
      );
      _controller = VideoPlayerController.file(_file!);
      _controller?.initialize().then((_) {
        setState(() {});
      });
    } catch (e) {
      print("Failed : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _controller == null || !_controller!.value.isInitialized
          ? Container()
          : Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: SizeUtils.verticalBlockSize * 70,
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller!.value.isPlaying
                          ? _controller!.pause()
                          : _controller!.play();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.horizontalBlockSize * 4,
                        vertical: SizeUtils.horizontalBlockSize * 2,
                      ),
                      child: Icon(
                        _controller!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
