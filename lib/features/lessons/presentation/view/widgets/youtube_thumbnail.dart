import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../../core/shared_widgets/custom_youtub_player.dart';

class YouTubeThumbnail extends StatelessWidget {
  final String videoUrl;

  const YouTubeThumbnail({super.key, required this.videoUrl});

  String extractVideoId(String url) {
    final uri = Uri.parse(url);
    if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'] ?? '';
    } else if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    String videoId = extractVideoId(videoUrl);
    String thumbnailUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YouTubePlayerScreen(videoId: videoId),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: CachedNetworkImageProvider(thumbnailUrl),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Icon(
            Icons.play_circle_fill_outlined,
            size: 70.r,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

class YouTubePlayerScreen extends StatefulWidget {
  final String videoId;

  const YouTubePlayerScreen({super.key, required this.videoId});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              (topPadding + 30).verticalSpace,
              CustemHeaderWidget(
                text: 'الدرس',
                withBack: true,
                // textColor: AppColor.deebPlue,
                // backgroundColor: Colors.white.withOpacity(0.6),
                fontSize: 30.sp,
              ),
              SizedBox(height: 30.h),
              CustomYoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                onReady: () {
                  _controller.addListener(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
