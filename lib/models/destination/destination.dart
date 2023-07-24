import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationModel {
  final num? id;
  final String? name;
  final List<dynamic>? images;
  final String? thumnailImage;
  final String? description;
  final num? countryId;
  final num? latitude;
  final num? longitude;
  final num? rating;
  final List<dynamic>? reviews;

  DestinationModel(
      {this.id,
      this.name,
      this.images,
      this.thumnailImage,
      this.description,
      this.countryId,
      this.latitude,
      this.longitude,
      this.rating,
      this.reviews});

  factory DestinationModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return DestinationModel(
        id: data["id"],
        name: data["name"],
        images: data["images"],
        thumnailImage: data["thumnailImage"],
        description: data["description"],
        countryId: data["countryId"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        rating: data["rating"],
        reviews: data["reviews"]);
  }

  static DestinationModel fromJson(Map<String, dynamic> json) =>
      DestinationModel(
          id: json['id'],
          name: json['name'],
          images: json['images'],
          thumnailImage: json['thumnailImage'],
          description: json["description"],
          countryId: json["countryId"],
          latitude: json["latitude"],
          longitude: json["longitude"],
          rating: json["rating"],
          reviews: json["reviews"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "images": images,
        "thumnailImage": thumnailImage,
        "description": description,
        "countryId": countryId,
        "latitude": latitude,
        "longitude": longitude,
        "rating": rating,
        "reviews": reviews
      };
}
