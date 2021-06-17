import 'dart:io';
import 'package:apparche/models/videos_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'constants.dart';

class Services {
  static const CHANNEL_ID = 'UCU4JGb0ODSaAfw93RTqjjeA';
  static const _baseUrl = 'www.googleapis.com';

  static Future<String> getVideosList({String pageToken: ''}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'maxResults': '12',
      'key': Constants.API_KEY,
      'channelId': CHANNEL_ID,
      'order': 'date',
      'type': 'video',
      'fields': 'pageInfo,nextPageToken,items(id,snippet)'
    };

    if (pageToken != '') {
      parameters.addAll({'pageToken': pageToken});
    }

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/search',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // debugPrint(response.body);
    // VideosList videosList = videosListFromJson(response.body);
    //

    return response.statusCode < 400 ? response.body : '';
  }
}
