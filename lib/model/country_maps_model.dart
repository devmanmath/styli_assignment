class Maps {
  final String? googleMaps;
  final String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
      googleMaps: json['googleMaps'], openStreetMaps: json['openStreetMaps']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['googleMaps'] = googleMaps;
    data['openStreetMaps'] = openStreetMaps;
    return data;
  }
}
