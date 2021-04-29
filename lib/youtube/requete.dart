import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert';

 String key= "AIzaSyD9lzVzwRTIpX_C3RQRJ_xK3C8GbAc1ODw";
  String channelId= "UCU4JGb0ODSaAfw93RTqjjeA";
  const _baseUrl ="www.googleapis.com";
  int maxResults = 12;
  Map<String,String> parametre =
  {
    'part':'snippet',
    'maxResults':'12',
    'key':key,
    'channelId':channelId,
    'order':'date',
    'type':'video',
    'fields':'pageInfo,nextPageToken,items(id,snippet)'
  };

Future requete() async {
 

   var  uri = Uri.https(_baseUrl,'/youtube/v3/search',parametre);
  // var url =
  //     Uri.https('youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=$maxResults&order=date&type=video&fields=pageInfo%2CnextPageToken%2Citems(id%2Csnippet)&key=$key', '');
  //final response = await http.get(url);
  final response = await http.get(uri);


if (response.statusCode == 200) {
   
    var itemCount = jsonDecode(response.body);
    print('Number of books about http: $itemCount');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

// void requete() async {
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   // 
//   String key= "AIzaSyD9lzVzwRTIpX_C3RQRJ_xK3C8GbAc1ODw";
//   String channelId= "UCU4JGb0ODSaAfw93RTqjjeA";
//   int maxResults = 12;

//   var url =
//       Uri.parse('https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=$maxResults&order=date&type=video&fields=pageInfo%2CnextPageToken%2Citems(id%2Csnippet)&key=$key');

//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse = convert.jsonDecode(response.body);
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $jsonResponse.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }
