class Currencies {
  final MRU? mRU;

  Currencies({this.mRU});

  factory Currencies.fromJson(Map<String, dynamic> json) =>
      Currencies(mRU: json['MRU'] != null ? MRU.fromJson(json['MRU']) : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mRU != null) {
      data['MRU'] = mRU!.toJson();
    }
    return data;
  }
}

class MRU {
  final String? name;
  final String? symbol;

  MRU({this.name, this.symbol});

  factory MRU.fromJson(Map<String, dynamic> json) =>
      MRU(name: json['name'], symbol: json['symbol']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}
