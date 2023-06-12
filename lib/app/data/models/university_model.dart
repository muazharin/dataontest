class UniversityModel {
  String? country;
  String? alphaTwoCode;
  String? name;
  dynamic stateProvince;
  List<String>? domains;
  List<String>? webPages;

  UniversityModel({
    this.country,
    this.alphaTwoCode,
    this.name,
    this.stateProvince,
    this.domains,
    this.webPages,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        country: json["country"],
        alphaTwoCode: json["alpha_two_code"],
        name: json["name"],
        stateProvince: json["state-province"],
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"]!.map((x) => x)),
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "alpha_two_code": alphaTwoCode,
        "name": name,
        "state-province": stateProvince,
        "domains":
            domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "web_pages":
            webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
      };
}
