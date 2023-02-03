import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:utilities/widgets/sound_player/sound_player.dart';

mixin Widgets {
  late AudioPlayer player = AudioPlayer();
  String speed = '1.1X';
  bool isShowSpeed = false;

  Stream<PositionData> get positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
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
      builder: (context, snapshot) => Container(
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
  }

  Widget seekBar() {
    return StreamBuilder<PositionData>(
      stream: positionDataStream,
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

  Widget fileName({
    required List<String> list,
  }) {
    return StreamBuilder<Duration?>(
      stream: player.durationStream,
      builder: (context, snapshot) {
        return Container(
          width: 300,
          height: 50,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Text(
              list[player.currentIndex ?? 0].split("/")[list[player.currentIndex ?? 0].split("/").length - 1].replaceAll("%20", " "),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
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
