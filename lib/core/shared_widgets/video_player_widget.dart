import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'custom_youtub_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, this.url});
  final String? url;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _controller;
  bool isFullScreen = false;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url??"")??"",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _controller.value.isFullScreen;
        });
      }
    });
    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: YoutubePlayerBuilder(
          onExitFullScreen: () {
            SystemChrome.setPreferredOrientations(
                DeviceOrientation.values);
            setState(() {
              isFullScreen = false;
            });
          },
          player: YoutubePlayer(
            controller: _controller,
            liveUIColor: AppColor.deebPlue,
            showVideoProgressIndicator: true,

          ),
          builder: (context, player) => player),
    );
  }
}
