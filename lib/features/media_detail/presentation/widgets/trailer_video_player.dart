// features/media_detail/presentation/widgets/trailer_video_player.dart
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerVideoPlayer extends StatefulWidget {
  final String videoKey;
  const TrailerVideoPlayer({super.key, required this.videoKey});

  @override
  State<TrailerVideoPlayer> createState() => _TrailerVideoPlayerState();
}

class _TrailerVideoPlayerState extends State<TrailerVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoKey,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
        showVideoAnnotations: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: YoutubePlayer(controller: _controller),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
