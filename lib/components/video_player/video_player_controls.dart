import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'video_player_data_manager.dart';

class VideoPlayerControls extends StatefulWidget {
  const VideoPlayerControls({Key? key, this.iconSize = 20, this.fontSize = 12, this.dataManager}) : super(key: key);
  final double iconSize;
  final double fontSize;
  final DataManager? dataManager;

  @override
  State<VideoPlayerControls> createState() => _VideoPlayerControlsState(iconSize: iconSize, fontSize: fontSize, dataManager: dataManager);
}

class _VideoPlayerControlsState extends State<VideoPlayerControls> {
  _VideoPlayerControlsState({this.iconSize = 20, this.fontSize = 12, this.dataManager});

  final double iconSize;
  final double fontSize;
  final DataManager? dataManager;
  String speed = '1.0X';
  bool isShowSpeed = false;
  @override
  void initState() {
    super.initState();
    dataManager!.flickManager.flickVideoManager?.videoPlayerController!.setPlaybackSpeed(1);
  }

  Widget iconPlay({required IconData icon, Color? color, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color ?? Colors.white, width: 4),
        ),
        child: Icon(
          icon,
          size: 40,
          color: color ?? Colors.white,
        ),
      ),
    );
  }

  Widget speedPlay({required List<double> listSpeed}) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              print(isShowSpeed.toString());
              setState(() {
                isShowSpeed=!isShowSpeed;
              });
            },
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                padding: const EdgeInsets.all(4),
                child: Text(speed,style: const TextStyle(fontSize: 14),)),
          ),
          SizedBox(
            height: 200,
            child:isShowSpeed? ListView(
              children: listSpeed
                  .map(
                    (e) => InkWell(
                  onTap: () => setState(() {
                    dataManager!.flickManager.flickVideoManager?.videoPlayerController!.setPlaybackSpeed(e);
                    isShowSpeed=false;
                    speed='${e}X';
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Text('${e}X', style: const TextStyle(fontSize: 14)),
                  ),
                ),
              )
                  .toList(),
            ):const SizedBox(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlickVideoManager flickVideoManager = Provider.of<FlickVideoManager>(context);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Container(color: Colors.black38),
          ),
        ),
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: flickVideoManager.nextVideoAutoPlayTimer != null
                    ? FlickAutoPlayCircularProgress(
                  colors: FlickAutoPlayTimerProgressColors(
                    backgroundColor: Colors.white30,
                    color: Colors.red,
                  ),
                )
                    : FlickAutoHideChild(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          iconPlay(
                            icon: Icons.skip_previous,
                            color: dataManager!.hasPreviousVideo() ? Colors.white : Colors.white38,
                            onTap: () {
                              dataManager!.skipToPreviousVideo();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: FlickPlayToggle(
                              size: 50,
                              playChild: iconPlay(icon: Icons.play_arrow),
                              pauseChild: iconPlay(icon: Icons.pause),
                            ),
                          ),
                          iconPlay(
                            icon: Icons.skip_next,
                            color: dataManager!.hasNextVideo() ? Colors.white : Colors.white38,
                            onTap: () {
                              dataManager!.skipToNextVideo();
                            },
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       dataManager!.skipToNextVideo();
                          //     },
                          //     child: Container(
                          //       padding: EdgeInsets.all(8),
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         border: Border.all(color: Colors.white, width: 2),
                          //       ),
                          //       child: Icon(
                          //         Icons.skip_next,
                          //         color: dataManager!.hasNextVideo() ? Colors.white : Colors.white38,
                          //         size: 35,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        const FlickSoundToggle(),
                        Expanded(
                          child: Container(),
                        ),
                        FlickFullScreenToggle(
                          size: iconSize,
                        ),
                      ],
                    ),
                  ),
                  FlickVideoProgressBar(
                    flickProgressBarSettings: FlickProgressBarSettings(
                      height: 5,
                      handleRadius: 5,
                      curveRadius: 50,
                      backgroundColor: Colors.white24,
                      bufferedColor: Colors.white38,
                      playedColor: Colors.red,
                      handleColor: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        FlickCurrentPosition(
                          fontSize: fontSize,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlickTotalDuration(
                          fontSize: fontSize,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(child: speedPlay(listSpeed: [0.25, 0.50, 0.75,1.0,1.25,1.50,1.75]),),
      ],
    );
  }


}
