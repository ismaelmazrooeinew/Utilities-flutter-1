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
                            PopupMenuButton(
                              tooltip: '1x',
                              padding: EdgeInsets.zero,
                              icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Text(speed)),
                              constraints: BoxConstraints(
                                maxWidth: 80,
                                minHeight: 8,
                              ),
                              itemBuilder: (context) => [
                                popupMenuItem(value: 0.25),
                                popupMenuItem(value: 0.50),
                                popupMenuItem(value: 0.75),
                                popupMenuItem(value: 1.00),
                                popupMenuItem(value: 1.25),
                                popupMenuItem(value: 1.50),
                                popupMenuItem(value: 1.75),
                                popupMenuItem(value: 2.00),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      dataManager!.skipToPreviousVideo();
                                    },
                                    child: Icon(
                                      Icons.skip_previous,
                                      color: dataManager!.hasPreviousVideo() ? Colors.white : Colors.white38,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlickPlayToggle(size: 50),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      dataManager!.skipToNextVideo();
                                    },
                                    child: Icon(
                                      Icons.skip_next,
                                      color: dataManager!.hasNextVideo() ? Colors.white : Colors.white38,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.play_arrow,
                              size: 32,
                              color: Colors.transparent,
                            ),
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
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: fontSize,
                          ),
                          Text(
                            ' / ',
                            style: TextStyle(color: Colors.white, fontSize: fontSize),
                          ),
                          FlickTotalDuration(
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlickFullScreenToggle(
                        size: iconSize,
                      ),
                    ],
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuItem popupMenuItem({
    required double value,
  }) {
    return PopupMenuItem(
      height: 30,
      value: value,
      child: Text("${value}X"),
      onTap: () {
        dataManager!.flickManager.flickVideoManager?.videoPlayerController!.setPlaybackSpeed(value);
        setState(() {
          speed='${value}X';
        });
      },
    );
  }
}
