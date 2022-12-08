class CapitalInfo {
  final List<dynamic>? latlng;

  CapitalInfo({this.latlng});

  factory CapitalInfo.fromJson(Map<String, dynamic> json) =>
      CapitalInfo(latlng: json['latlng']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latlng'] = latlng;
    return data;
  }
}
