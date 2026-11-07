class CategoriesListDto {
  List<CategoryModelDto>? list;

  CategoriesListDto({this.list});

  factory CategoriesListDto.fromJson(dynamic json) {
    if (json is List) {
      return CategoriesListDto(
        list: json.map((v) => CategoryModelDto.fromJson(v)).toList(),
      );
    } else if (json is Map<String, dynamic>) {
      var data = json['list'] ?? json['data'] ?? json;
      if (data is List) {
        return CategoriesListDto(
          list: data.map((v) => CategoryModelDto.fromJson(v)).toList(),
        );
      }
    }
    return CategoriesListDto(list: []);
  }
}

class CategoryModelDto {
  String? slug;
  String? name;

  CategoryModelDto({this.slug, this.name});

  factory CategoryModelDto.fromJson(Map<String, dynamic> json) {
    return CategoryModelDto(
      slug: json['slug'],
      name: json['name'],
    );
  }
}
