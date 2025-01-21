import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsScreen extends StatefulWidget {
  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  final List<Map<String, String>> videoData = [
    {
      'videoUrl': "https://www.youtube.com/shorts/AOoZY1f3K-0?si=SGGdXZxf6U-JlxF6",
      'username': "https://www.instagram.com/alyssa.brown_99/",
      'song': 'what about sunrise',
    },
    {
      'videoUrl': 'https://www.w3schools.com/html/movie.mp4',
      'username': "https://www.instagram.com/john_doe123/",
      'song': 'Every night in my dream',
    },
    {
      'videoUrl': 'https://www.w3schools.com/html/movie.mp4',
      'username': "https://www.youtube.com/user/tech_guru56/",
      'song': 'In the name of love',
    },
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: videoData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return VideoPlayerWidget(
            url: videoData[index]['videoUrl']!,
            username: videoData[index]['username']!,
            song: videoData[index]['song']!,
          );
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final String username;
  final String song;

  VideoPlayerWidget({super.key,
    required this.url,
    required this.username,
    required this.song,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () {
        if (_isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
        setState(() {
          _isPlaying = !_isPlaying;
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayer(_controller),
          // Overlay with song info, username, and icons
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.song,
                  style:  TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Column(
              children: [
                // Like Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(height: 10),
                // Comment Button
                GestureDetector(
                  onTap: () {
                    // Navigate to comment screen
                  },
                  child: Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(height: 10),
                // Share Button
                GestureDetector(
                  onTap: () {
                    // Share video logic
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          // Play/Pause Icon Overlay
          if (!_isPlaying)
            Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 60,
              ),
            ),
        ],
      ),
    );
  }
}