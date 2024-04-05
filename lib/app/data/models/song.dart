import 'package:music_player/app/data/models/artist.dart';

class Song {
  String? id;
  String? title;
  String? previewImage;
  String? url;
  List<Artist>? artists;

  Song({
    this.id,
    this.title,
    this.previewImage,
    this.url,
    this.artists,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        title: json["title"],
        previewImage: json["preview_image"],
        url: json["url"],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "preview_image": previewImage,
        "url": url,
        "artists": artists?.map((e) => e.toJson()).toList(),
      };

  String get artistNames {
    return artists?.map((e) => e.name ?? '').join(', ') ?? '';
  }
}
