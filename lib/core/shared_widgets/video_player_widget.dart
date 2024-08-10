import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(widget.url ?? "") ?? "",
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
            showLiveFullscreenButton: false,
            loop: false,
            isLive: false,
            forceHD: true,
            hideThumbnail: true));
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
      child: CustomYoutubePlayer(
        width: double.infinity,
        controller: _controller,
        showFullScreenButton: true,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          //   _isPlayerReady = true;
        },
        onEnded: (data) {
          //todo:Handle end of video
          //Navigator.pop(context);
          //  _showSnackBar('Next Video Started!');
        },
      ),
    );
  }
}
