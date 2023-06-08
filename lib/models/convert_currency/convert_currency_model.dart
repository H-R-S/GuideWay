class ConvertCurrencyModel {
  bool? success;
  List<dynamic>? validationMessage;
  Result? result;

  ConvertCurrencyModel({this.success, this.validationMessage, this.result});

  ConvertCurrencyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['validationMessage'] != null) {
      validationMessage = <Null>[];
      json['validationMessage'].forEach((v) {
        validationMessage!.add((v));
      });
    }
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (validationMessage != null) {
      data['validationMessage'] =
          validationMessage!.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? from;
  String? to;
  int? amountToConvert;
  double? convertedAmount;

  Result({this.from, this.to, this.amountToConvert, this.convertedAmount});

  Result.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    amountToConvert = json['amountToConvert'];
    convertedAmount = json['convertedAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['amountToConvert'] = amountToConvert;
    data['convertedAmount'] = convertedAmount;
    return data;
  }
}
