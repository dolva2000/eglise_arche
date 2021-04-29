import 'package:apparche/youtube/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:apparche/models/videos_list.dart';
import 'package:apparche/utils/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:state_persistence/state_persistence.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideosList _videosList;
  bool _loading;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList.videos = [];
    _loadVideos();
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList();
    _videosList.videos.addAll(tempVideosList.videos);
    print('videos: ${_videosList.videos.length}');
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistedAppState(
      storage: JsonFileStorage(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_loading ? 'Loading...' : 'YouTube'),
        ),
        body: Container(
          color: Colors.white,
          child: PersistedStateBuilder(builder:
              (BuildContext context, AsyncSnapshot<PersistedData> snapshot) {
            snapshot.data['video'] = jsonEncode(_videosList.videos);
            if (snapshot.hasData) {
              List<VideoItem> storedvideolist =
                  jsonDecode(snapshot.data['video']).cast<VideoItem>();
              print('stored_videolist $storedvideolist');
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: storedvideolist.length,
                      itemBuilder: (context, index) {
                        VideoItem videoItem = storedvideolist[index];
                        return InkWell(
                          onTap: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VideoPlayerScreen(videoItem: videoItem);
                            }));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Image(
                                  image: CachedNetworkImageProvider(
                                      videoItem.info.thumbnails
                                          .thumbnailsDefault.url,
                                      maxHeight: 150,
                                      maxWidth: 150),
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10),
                                Flexible(child: Text(videoItem.info.title)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }
}
