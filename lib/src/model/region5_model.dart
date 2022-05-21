import 'dart:convert';

List<Region5Model> region5ModelFromJson(String str) => List<Region5Model>.from(
    json.decode(str).map((x) => Region5Model.fromJson(x)));

class Region5Model {
  Region5Model({
    required this.id,
    required this.name,
    required this.slug,
    required this.childs,
  });

  int id;
  String name;
  String slug;
  List<Region5Model> childs;

  factory Region5Model.fromJson(Map<String, dynamic> json) => Region5Model(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        childs: json["childs"] == null
            ? <Region5Model>[]
            : List<Region5Model>.from(
                json["childs"].map((x) => Region5Model.fromJson(x))),
      );
}
