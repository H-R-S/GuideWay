import 'package:cloud_firestore/cloud_firestore.dart';
import '../country/country_model.dart';
import '../review/review_model.dart';

class DestinationModel {
  final num? id;
  final String? name;
  final List<String>? images;
  final String? thumnailImage;
  final String? description;
  final CountryModel? country;
  final num? latitude;
  final num? longitude;
  final num? rating;
  final List<ReviewModel>? reviews;

  DestinationModel(
      {this.id,
      this.name,
      this.images,
      this.thumnailImage,
      this.description,
      this.country,
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
        country: data["country"],
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
          country: json["country"],
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
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "rating": rating,
        "reviews": reviews
      };
}
