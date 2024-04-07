class UserModel {
  String? id;
  List<String>? favouriteSongs;

  UserModel({
    this.id,
    this.favouriteSongs,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        favouriteSongs: json["favourite_songs"] == null
            ? []
            : List<String>.from(json["favourite_songs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "favourite_songs": favouriteSongs?.map((e) => e).toList() ?? [],
      };
}
