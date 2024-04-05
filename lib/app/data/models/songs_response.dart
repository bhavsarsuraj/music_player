import 'package:music_player/app/data/models/song.dart';

class SongsResponse {
  List<Song>? songs;

  SongsResponse({
    this.songs,
  });

  factory SongsResponse.fromJson(Map<String, dynamic> json) => SongsResponse(
        songs: json["songs"] == null
            ? []
            : List<Song>.from(json["songs"]!.map((x) => Song.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "songs": songs?.map((e) => e.toJson()),
      };
}
