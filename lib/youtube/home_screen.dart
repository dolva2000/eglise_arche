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
  bool _hasNetwortVideos;
  bool _hasNextPageToken;
  String _nextPageToken;
  int _videosCount;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _hasNetwortVideos = false;
    _scrollController = new ScrollController();
    _videosList = VideosList();
    _videosList.videos = [];
    _nextPageToken = '';
    _hasNextPageToken = true;
    _loadVideos();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = PersistedAppState.of(context);
  }

  _loadVideos() async {
    String tempVideosListJson = await Services.getVideosList();
    if (tempVideosListJson != null && tempVideosListJson != '') {
      try {
        VideosList tempVideosList = videosListFromJson(tempVideosListJson);
        _data['video'] = tempVideosListJson;
        _videosList.videos = tempVideosList.videos;
        setState(() {
          _hasNetwortVideos = true;
          _nextPageToken = tempVideosList.nextPageToken;
          _videosCount = tempVideosList.pageInfo.totalResults;
        });
      } catch (e) {
        debugPrint(e);
      }
    }
    setState(() {
      _loading = false;
    });
  }

  _loadNextVideos() async {
    if (_hasNextPageToken) {
      String tempVideosListJson =
          await Services.getVideosList(pageToken: _nextPageToken);

      if (_hasNetwortVideos &&
          tempVideosListJson != null &&
          tempVideosListJson != '') {
        VideosList tempVideosList = videosListFromJson(tempVideosListJson);

        if (tempVideosList.nextPageToken == null) {
          setState(() {
            _hasNextPageToken = false;
          });
        }

        if (tempVideosList.nextPageToken != _nextPageToken) {
          _videosList.videos.addAll(tempVideosList.videos);
          setState(() {
            _nextPageToken = tempVideosList.nextPageToken;
          });
        }
        debugPrint("nextPageToken => $_nextPageToken");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasNetwortVideos && _data['video'] != null && _data['video'] != '') {
      VideosList storedVideosList = videosListFromJson(_data['video']);
      if (storedVideosList.videos != null) {
        _videosList.videos.addAll(storedVideosList.videos);
      }
    }
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo,
        title: Text('Videos'),
      ),
      body: _videosList.videos.length == 0
          ? Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/img/undraw_online_articles_79ff.png")
                ],
              ))
          : Container(
              color: Colors.grey.shade100,
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
                            debugPrint('_loadNextVideos');
                            //_loadNextVideos();
                            return true;
                          }
                          return true;
                        },
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _videosList.videos.length,
                          itemBuilder: (context, index) {
                            VideoItem videoItem = _videosList.videos[index];
                            if (_videosList.videos.length > 0 &&
                                _videosList.videos.length == index + 1 &&
                                _hasNextPageToken) {
                              return Center(
                                child: TextButton(
                                  onPressed: () => _loadNextVideos(),
                                  child: Text('Voir Plus'),
                                ),
                              );
                            }
                            return InkWell(
                              onTap: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return VideoPlayerScreen(
                                      videoItem: videoItem);
                                }));
                              },
                              splashColor: Colors.indigo,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: CachedNetworkImageProvider(
                                          videoItem.info.thumbnails.medium.url,
                                          maxHeight: 150,
                                          maxWidth: 150),
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Container(
                                          width: 150,
                                          child:
                                              Image.asset("assets/img/hhh.png"),
                                        );
                                      },
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            videoItem.info.title,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'publiée le ${videoItem.info.publishedAt.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
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
