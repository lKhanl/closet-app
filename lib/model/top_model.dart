class Top {
  late int id;
  late String name;
  late String url;

  Top({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Top.fromJson(Map<String, dynamic> json) => Top(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}