class CountryName {
  final String? common;
  final String? official;
  final NativeName? nativeName;

  CountryName({this.common, this.official, this.nativeName});

  factory CountryName.fromJson(Map<String, dynamic> json) => CountryName(
      common: json['common'],
      official: json['official'],
      nativeName: json['nativeName'] != null
          ? NativeName.fromJson(json['nativeName'])
          : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  final Ara? ara;

  NativeName({this.ara});

  factory NativeName.fromJson(Map<String, dynamic> json) =>
      NativeName(ara: json['ara'] != null ? Ara.fromJson(json['ara']) : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ara != null) {
      data['ara'] = ara!.toJson();
    }
    return data;
  }
}

class Ara {
  final String? official;
  final String? common;

  Ara({this.official, this.common});

  factory Ara.fromJson(Map<String, dynamic> json) =>
      Ara(official: json['official'], common: json['common']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}
