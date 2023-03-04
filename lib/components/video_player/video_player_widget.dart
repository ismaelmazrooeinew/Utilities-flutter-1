import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:utilities/utilities.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:utilities/components/video_player/video_player_controls.dart';
import 'package:utilities/components/video_player/video_player_data_manager.dart';

class CustomVideoPlayer extends StatefulWidget {
  CustomVideoPlayer({required this.urls, this.position, Key? key}) : super(key: key);
  List<String> urls;
  Duration? position;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late FlickManager flickManager;
  late DataManager dataManager;
  late List<String> urls;
  Duration position = Duration(milliseconds: 1);

  @override
  void initState() {
    super.initState();
    urls = widget.urls;

    VideoPlayerController controls = VideoPlayerController.network(
      urls[0],
    );
    flickManager = FlickManager(
        videoPlayerController: controls,
        onVideoEnd: () {
          dataManager.skipToNextVideo(const Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, urls: urls);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String url) {
    flickManager.handleChangeVideo(VideoPlayerController.network(url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Duration? position = await dataManager.flickManager.flickVideoManager?.videoPlayerController!.position;
        Get.back(result: position);
        return false;
      },
      child: Scaffold(
        body: VisibilityDetector(
          key: ObjectKey(flickManager),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 0 && this.mounted) {
              flickManager.flickControlManager?.autoPause();
            } else if (visibility.visibleFraction == 1) {
              flickManager.flickControlManager?.autoResume();
            }
          },
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.red,
                width: double.infinity,
                height: double.infinity,
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControls: FlickVideoWithControls(
                    videoFit: BoxFit.contain,
                    controls: VideoPlayerControls(dataManager: dataManager),
                  ),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    controls: FlickVideoWithControls(
                      controls: VideoPlayerControls(dataManager: dataManager),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text("videoName", style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
