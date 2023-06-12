class Bottom {
  late int id;
  late String name;
  late String url;

  Bottom({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Bottom.fromJson(Map<String, dynamic> json) => Bottom(
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