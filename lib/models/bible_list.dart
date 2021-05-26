import 'dart:convert';

BibleList bibleListFromJson(String str) => BibleList.fromJson(json.decode(str));

String bibleListToJson(BibleList data) => json.encode(data.toJson());

class BibleList {
  BibleList({
    this.data,
  });

  List<BibleListItem> data;

  factory BibleList.fromJson(List<dynamic> json) => BibleList(
        data: List<BibleListItem>.from(
            json.map((x) => BibleListItem.fromJson(x))),
      );

  List<dynamic> toJson() => data;
}

class BibleListItem {
  BibleListItem({
    this.abbrev,
    this.chapters,
    this.name,
  });

  String abbrev;
  List<List<dynamic>> chapters;
  String name;

  factory BibleListItem.fromJson(Map<String, dynamic> json) => BibleListItem(
        abbrev: json["abbrev"],
        chapters: List<List<dynamic>>.from(json["chapters"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "abbrev": abbrev,
        "chapters": List<dynamic>.from(chapters.map((x) => x)),
        "name": name,
      };
}
