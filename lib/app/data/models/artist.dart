class Artist {
  String? name;

  Artist({
    this.name,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
