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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PersistedData _data;
  VideosList _videosList;
  bool _loading;
  String _nextPageToken;
  int _videosCount;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _scrollController = new ScrollController();
    _videosList = VideosList();
    _videosList.videos = [];
    _nextPageToken = '';
    _videosCount = 0;
    _loadVideos();
    print('data  $_data');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = PersistedAppState.of(context);
  }

  _loadVideos() async {
    print('loading video start');
    String tempVideosListJson = await Services.getVideosList();
    print('loading video end $tempVideosListJson');
    if (tempVideosListJson != null && tempVideosListJson != '') {
      VideosList tempVideosList = videosListFromJson(tempVideosListJson);
      _data['video'] = tempVideosListJson;
      setState(() {
        _nextPageToken = tempVideosList.nextPageToken;
        _videosCount = tempVideosList.pageInfo.totalResults;
      });
    }

    if (_data['video'] != null && _data['video'] != '') {
      VideosList storedVideosList = videosListFromJson(_data['video']);
      _videosList.videos.addAll(storedVideosList.videos);
    }

    setState(() {
      _loading = false;
    });
  }

  _loadNextVideos() async {
    String tempVideosListJson =
        await Services.getVideosList(pageToken: _nextPageToken);

    if (tempVideosListJson != null && tempVideosListJson != '') {
      VideosList tempVideosList = videosListFromJson(tempVideosListJson);

      if (tempVideosList.nextPageToken != _nextPageToken &&
          tempVideosList.nextPageToken != null) {
        _videosList.videos.addAll(tempVideosList.videos);
        setState(() {
          _nextPageToken = tempVideosList.nextPageToken;
        });
        print("nextPageToken2 => $tempVideosList.nextPageToken");
      }
      print("nextPageToken => $_nextPageToken");
    }
  }

  @override
  Widget build(BuildContext context) {
    print('data  $_data');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Videos'),
      ),
      body: _loading
          ? Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/img/undraw_online_articles_79ff.png")
                ],
              ))
          : Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: NotificationListener<ScrollEndNotification>(
                        onNotification: (ScrollNotification notification) {
                          if (_videosList.videos.length >= _videosCount) {
                            return true;
                          }
                          if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent) {
                            print('_loadNextVideos');
                            _loadNextVideos();
                          }
                          return true;
                        },
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _videosList.videos.length,
                          itemBuilder: (context, index) {
                            VideoItem videoItem = _videosList.videos[index];
                            return InkWell(
                              onTap: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return VideoPlayerScreen(
                                      videoItem: videoItem);
                                }));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                child: Row(
                                  children: [
                                    Image(
                                      image: CachedNetworkImageProvider(
                                          videoItem.info.thumbnails.medium.url,
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
                        )),
                  ),
                ],
              ),
            ),
    );
  }
}
