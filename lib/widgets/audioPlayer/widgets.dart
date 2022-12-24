import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:utilities/widgets/audioPlayer/sound_players.dart';

mixin Widgets {
  late AudioPlayer player = AudioPlayer();
  String speed = '1.1X';
  bool isShowSpeed = false;

  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  void showSliderDialog({
    required BuildContext context,
    required String title,
    required int divisions,
    required double min,
    required double max,
    String valueSuffix = '',
    required double value,
    required Stream<double> stream,
    required ValueChanged<double> onChanged,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        content: StreamBuilder<double>(
          stream: stream,
          builder: (context, snapshot) => SizedBox(
            height: 100.0,
            child: Column(
              children: [
                Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix', style: const TextStyle(fontFamily: 'Fixed', fontWeight: FontWeight.bold, fontSize: 24.0)),
                Slider(
                  divisions: divisions,
                  min: min,
                  max: max,
                  value: snapshot.data ?? value,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget speedPlay({required List<double> listSpeed}) {
    return StreamBuilder<double>(
      stream: player.speedStream,
      builder: (context, snapshot) =>
          //     Container(
          //   width: 100,
          //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           isShowSpeed = !isShowSpeed;
          //           // print(isShowSpeed.toString());
          //           // setState(() {
          //           //   isShowSpeed = !isShowSpeed;
          //           // });
          //         },
          //         child: Container(
          //             margin: const EdgeInsets.symmetric(vertical: 8),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               border: Border.all(color: Colors.white),
          //             ),
          //             padding: const EdgeInsets.all(4),
          //             child: Text(
          //               snapshot.data !=null ?snapshot.data.toString(): player.speed.toString(),
          //               style: const TextStyle(fontSize: 14, color: Colors.white),
          //             )),
          //       ),
          //       SizedBox(
          //         height: 150,
          //         child: isShowSpeed
          //             ? ListView(
          //           padding: EdgeInsets.zero,
          //           children: listSpeed
          //               .map(
          //                 (e) => InkWell(
          //               onTap: () => setState(() {
          //                 // dataManager!.flickManager.flickVideoManager?.videoPlayerController!.setPlaybackSpeed(e);
          //                 isShowSpeed = false;
          //                 speed = '${e}X';
          //               }),
          //               child: Container(
          //                 padding: const EdgeInsets.all(4),
          //                 child: Text('${e}X', style: const TextStyle(fontSize: 14, color: Colors.white)),
          //               ),
          //             ),
          //           )
          //               .toList(),
          //         )
          //             : const SizedBox(),
          //       )
          //     ],
          //   ),
          // );

          Container(
        width: 50,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
        ),
        child: IconButton(
          icon: Text("${snapshot.data?.toStringAsFixed(1)}x", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust speed",
              divisions: 10,
              min: 0.5,
              max: 1.5,
              value: player.speed,
              stream: player.speedStream,
              onChanged: player.setSpeed,
            );
          },
        ),
      ),
    );

    // return Container(
    //   width: 100,
    //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           print(isShowSpeed.toString());
    //           setState(() {
    //             isShowSpeed = !isShowSpeed;
    //           });
    //         },
    //         child: Container(
    //             margin: const EdgeInsets.symmetric(vertical: 8),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8),
    //               border: Border.all(color: Colors.white),
    //             ),
    //             padding: const EdgeInsets.all(4),
    //             child: Text(
    //               speed,
    //               style: const TextStyle(fontSize: 14, color: Colors.white),
    //             )),
    //       ),
    //       SizedBox(
    //         height: 150,
    //         child: isShowSpeed
    //             ? ListView(
    //                 padding: EdgeInsets.zero,
    //                 children: listSpeed
    //                     .map(
    //                       (e) => InkWell(
    //                         onTap: () => setState(() {
    //                           // dataManager!.flickManager.flickVideoManager?.videoPlayerController!.setPlaybackSpeed(e);
    //                           isShowSpeed = false;
    //                           speed = '${e}X';
    //                         }),
    //                         child: Container(
    //                           padding: const EdgeInsets.all(4),
    //                           child: Text('${e}X', style: const TextStyle(fontSize: 14, color: Colors.white)),
    //                         ),
    //                       ),
    //                     )
    //                     .toList(),
    //               )
    //             : const SizedBox(),
    //       )
    //     ],
    //   ),
    // );
  }

  Widget seekBar() {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        return SeekBar(
          duration: positionData?.duration ?? Duration.zero,
          position: positionData?.position ?? Duration.zero,
          bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
          onChangeEnd: player.seek,
        );
      },
    );
  }

  Widget position() {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        return Text(getTime(positionData?.position ?? Duration.zero), style: const TextStyle(fontSize: 18, color: Colors.white));
      },
    );
  }

  Widget duration() {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        return Text(getTime(positionData?.duration ?? Duration.zero), style: const TextStyle(fontSize: 18, color: Colors.white));
      },
    );
  }

  Widget previous() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        if (player.hasPrevious) {
          return iconPlay(icon: Icons.skip_previous, onTap: () => player.seekToPrevious());
        } else {
          return iconPlay(icon: Icons.skip_previous, color: Colors.white.withOpacity(0.5));
        }
      },
    );
  }

  Widget next() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        if (player.hasNext) {
          return iconPlay(icon: Icons.skip_next, onTap: () => player.seekToNext());
        } else {
          return iconPlay(icon: Icons.skip_next, color: Colors.white.withOpacity(0.5));
        }
      },
    );
  }

  Widget play() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
          return Container(margin: const EdgeInsets.all(8.0), width: 48.0, height: 48.0, child: const CircularProgressIndicator());
        } else if (playing != true) {
          return iconPlay(icon: Icons.play_arrow, onTap: player.play);
        } else if (processingState != ProcessingState.completed) {
          return iconPlay(icon: Icons.pause, onTap: player.pause);
        } else {
          return iconPlay(icon: Icons.replay, onTap: () => player.seek(Duration.zero));
        }
      },
    );
  }

  String getTime(Duration? duration) {
    String d = duration.toString();
    String res = '';
    if (duration != null && d.contains(":")) {
      String h = d.split(":")[0];
      String m = d.split(":")[1];
      String s = d.split(":")[2].split(".")[0];
      if (h != "0") {
        res = '$h:$m:$s';
      } else {
        res = '$m:$s';
      }
    } else {
      res = "00:00";
    }

    return res;
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
}
