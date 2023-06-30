import 'package:cloud_firestore/cloud_firestore.dart';
import '../country/country_model.dart';
import '../review/review_model.dart';

class UniversityModel {
  final num? id;
  final String? name;
  final String? website;
  final String? state;
  final String? city;
  final List<String>? images;
  final String? thumnailImage;
  final String? description;
  final CountryModel? country;
  final num? latitude;
  final num? longitude;
  final num? rating;
  final List<ReviewModel>? reviews;

  UniversityModel(
      {this.id,
      this.name,
      this.city,
      this.state,
      this.website,
      this.images,
      this.thumnailImage,
      this.description,
      this.country,
      this.latitude,
      this.longitude,
      this.rating,
      this.reviews});

  factory UniversityModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return UniversityModel(
        id: data["id"],
        name: data["name"],
        city: data["city"],
        state: data["state"],
        website: data["website"],
        images: data["images"],
        thumnailImage: data["thumnailImage"],
        description: data["description"],
        country: data["country"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        rating: data["rating"],
        reviews: data["reviews"]);
  }

  static UniversityModel fromJson(Map<String, dynamic> json) => UniversityModel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      state: json['state'],
      website: json['website'],
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
        "city": city,
        "state": state,
        "website": website,
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
