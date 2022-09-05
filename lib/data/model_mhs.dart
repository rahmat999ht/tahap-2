import 'dart:convert';

List<ModelMhs> modelMhsFromJson(String str) =>
    List<ModelMhs>.from(json.decode(str).map((x) => ModelMhs.fromJson(x)));

String modelMhsToJson(List<ModelMhs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelMhs {
  const ModelMhs({
    required this.idMhs,
    required this.nameMhs,
    required this.stbMhs,
    required this.majorMhs,
    required this.gender,
    required this.address,
  });

  final int idMhs;
  final String nameMhs;
  final String stbMhs;
  final String majorMhs;
  final String gender;
  final String address;

  factory ModelMhs.fromJson(Map<String, dynamic> json) => ModelMhs(
        idMhs: json["id_mhs"],
        nameMhs: json["name_mhs"],
        stbMhs: json["stb_mhs"],
        majorMhs: json["major_mhs"],
        gender: json["gender"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        // "id_mhs": idMhs,
        "name_mhs": nameMhs,
        "stb_mhs": stbMhs,
        "major_mhs": majorMhs,
        "gender": gender,
        "address": address,
      };
}
