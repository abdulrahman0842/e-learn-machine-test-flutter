import 'package:elearn/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatefulWidget {
  final CourseModel course;

  const VideoPlayerApp({super.key, required this.course});
  @override
  _VideoPlayerAppState createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create a VideoPlayerController for the video you want to play from assets.
    _controller = VideoPlayerController.asset('assets/videos/new_course.mp4');

    // Initialize the VideoPlayerController and store the Future for later use.
    _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
      setState(() {
        // Once initialized, play the video.
        _controller!.play();
      });
    });

    _controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      child: SizedBox(
                        height: height * 0.3,
                        width: width * 0.8,
                        child: AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Welcome to Paarsh Infotech',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
