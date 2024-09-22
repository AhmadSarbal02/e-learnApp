import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/core/constant/color.dart';
import 'package:project/data/model/videosmodel.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late YoutubePlayerController _controller;
  late VideosModel video;

  @override
  void initState() {
    super.initState();
    video = Get.arguments
        as VideosModel; // Assuming VideosModel is passed as arguments
    final videoID = YoutubePlayer.convertUrlToId(video.videosUrl!);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            video.videosName!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        // AppBar(
        //  ),
        // ),
        body: Container(
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  debugPrint("ready");
                },
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: const ProgressBarColors(
                        playedColor: AppColor.primaryColor,
                        handleColor: AppColor.primaryColor),
                  ),
                  const PlaybackSpeedButton(),
                  RemainingDuration(),
                ],
              )
            ],
          ),
        ));
  }
}
