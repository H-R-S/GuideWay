class TranslateModel {
  String? status;
  Data? data;

  TranslateModel({this.status, this.data});

  TranslateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? translatedText;
  DetectedSourceLanguage? detectedSourceLanguage;

  Data({this.translatedText, this.detectedSourceLanguage});

  Data.fromJson(Map<String, dynamic> json) {
    translatedText = json['translatedText'];
    detectedSourceLanguage = json['detectedSourceLanguage'] != null
        ? DetectedSourceLanguage.fromJson(json['detectedSourceLanguage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['translatedText'] = translatedText;
    if (detectedSourceLanguage != null) {
      data['detectedSourceLanguage'] = detectedSourceLanguage!.toJson();
    }
    return data;
  }
}

class DetectedSourceLanguage {
  String? code;
  String? name;

  DetectedSourceLanguage({this.code, this.name});

  DetectedSourceLanguage.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
