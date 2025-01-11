class Temperture {
  double? temp;

  Temperture({this.temp});

  factory Temperture.fromJson(Map<String, dynamic> json) {
    return Temperture(temp: json["temp"]);
  }
}
