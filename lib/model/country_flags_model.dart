class Flags {
  final String? png;
  final String? svg;

  Flags({this.png, this.svg});

  factory Flags.fromJson(Map<String, dynamic> json) =>
      Flags(png: json['png'], svg: json['svg']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    return data;
  }
}
