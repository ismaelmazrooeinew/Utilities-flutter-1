part of '../../utilities.dart';

class IransCity {
  IransCity({
    this.provinces,
  });

  final List<Province>? provinces;

  factory IransCity.fromJson(String str) => IransCity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IransCity.fromMap(Map<String, dynamic> json) => IransCity(
        provinces: json["Provinces"] == null ? null : List<Province>.from(json["Provinces"].map((x) => Province.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Provinces": provinces == null ? null : List<dynamic>.from(provinces!.map((x) => x.toMap())),
      };
}

class Province {
  Province({
    this.provinceId,
    this.provinceName,
    this.cities,
  });

  final int? provinceId;
  final String? provinceName;
  final List<City>? cities;

  factory Province.fromJson(String str) => Province.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Province.fromMap(Map<String, dynamic> json) => Province(
        provinceId: json["ProvinceId"] == null ? null : json["ProvinceId"],
        provinceName: json["ProvinceName"] == null ? null : json["ProvinceName"],
        cities: json["Cities"] == null ? null : List<City>.from(json["Cities"].map((x) => City.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ProvinceId": provinceId == null ? null : provinceId,
        "ProvinceName": provinceName == null ? null : provinceName,
        "Cities": cities == null ? null : List<dynamic>.from(cities!.map((x) => x.toMap())),
      };
}

class City {
  City({
    this.cityId,
    this.provinceId,
    this.cityName,
  });

  final int? cityId;
  final int? provinceId;
  final String? cityName;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        cityId: json["CityId"] == null ? null : json["CityId"],
        provinceId: json["ProvinceId"] == null ? null : json["ProvinceId"],
        cityName: json["CityName"] == null ? null : json["CityName"],
      );

  Map<String, dynamic> toMap() => {
        "CityId": cityId == null ? null : cityId,
        "ProvinceId": provinceId == null ? null : provinceId,
        "CityName": cityName == null ? null : cityName,
      };
}
