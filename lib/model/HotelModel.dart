import 'dart:convert';

class HotelModel {
  String imagePath;
  String titleTxt;
  String subTxt;
  int dist;
  int rating;
  int reviews;
  int perNight;
  int id;

  // Construtor
  HotelModel({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1,
    this.reviews = 80,
    this.rating = 4,
    this.perNight = 180,
    this.id,
  });

  factory HotelModel.fromJson(String str) =>
      HotelModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HotelModel.fromMap(Map<String, dynamic> json) => HotelModel(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        imagePath: json["imagePath"],
        titleTxt: json["titleTxt"],
        subTxt: json["subTxt"],
        dist: (json["dist"] is int) ? json["dist"] : int.parse(json["dist"]),
        reviews: (json["reviews"] is int)
            ? json["reviews"]
            : int.parse(json["reviews"]),
        rating: (json["rating"] is int)
            ? json["rating"]
            : int.parse(json["rating"]),
        perNight: (json["perNight"] is int)
            ? json["perNight"]
            : int.parse(json["perNight"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "imagePath": imagePath,
        "titleTxt": titleTxt,
        "subTxt": subTxt,
        "dist": dist,
        "reviews": reviews,
        "rating": rating,
        "perNight": perNight,
      };
}
