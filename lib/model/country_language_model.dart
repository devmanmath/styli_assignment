class Languages {
  final String? ara;

  Languages({this.ara});

  factory Languages.fromJson(Map<String, dynamic> json) =>
      Languages(ara: json['ara']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ara'] = ara;
    return data;
  }
}
