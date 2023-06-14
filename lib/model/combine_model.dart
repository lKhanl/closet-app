import 'package:MyCombinationsApp/model/shoes_model.dart';
import 'package:MyCombinationsApp/model/top_model.dart';

import 'bottom_model.dart';

class Combine {
  late int id;
  late String name;
  late Top top;
  late Bottom bottom;
  late Shoes shoes;

  Combine({
    required this.id,
    required this.name,
    required this.top,
    required this.bottom,
    required this.shoes
  });

  factory Combine.fromJson(Map<String, dynamic> json) => Combine(
        id: json["id"],
        name: json["name"],
        top: Top.fromJson(json["top"]),
        bottom: Bottom.fromJson(json["bottom"]),
        shoes: Shoes.fromJson(json["shoes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "top": top.toJson(),
        "bottom": bottom.toJson(),
        "shoes": shoes.toJson(),
      };
}
