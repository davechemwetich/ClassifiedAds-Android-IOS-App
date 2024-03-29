// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

List<Carousel> carouselFromJson(String str) =>
    List<Carousel>.from(json.decode(str).map((x) => Carousel.fromJson(x)));

String carouselToJson(List<Carousel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carousel {
  Carousel({
    required this.id,
    required this.image,
  });

  final String id;
  final String image;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["_id"] == null ? null : json["_id"],
        image: json["image"]["url"] == null ? null : json["image"]["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "image": image == null ? null : image,
      };
}
