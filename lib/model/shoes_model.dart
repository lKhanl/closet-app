class Shoes {
  late int id;
  late String name;
  late String url;

  Shoes({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Shoes.fromJson(Map<String, dynamic> json) => Shoes(
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