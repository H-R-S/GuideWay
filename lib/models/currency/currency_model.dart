class CurrencyModel {
  String? symbol;
  String? name;

  CurrencyModel({this.symbol, this.name});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['symbol'] = symbol;
    data['name'] = name;
    return data;
  }
}
