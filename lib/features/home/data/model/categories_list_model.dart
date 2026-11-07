class CategoriesList {
  List<CategoryModel>? list;

  CategoriesList({this.list});

  factory CategoriesList.fromJson(dynamic json) {
    if (json is List) {
      return CategoriesList(
        list: json.map((v) => CategoryModel.fromJson(v)).toList(),
      );
    } else if (json is Map<String, dynamic>) {
      var data = json['list'] ?? json['data'] ?? json;
      if (data is List) {
        return CategoriesList(
          list: data.map((v) => CategoryModel.fromJson(v)).toList(),
        );
      }
    }
    return CategoriesList(list: []);
  }
}

class CategoryModel {
  String? slug;
  String? name;

  CategoryModel({this.slug, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug']?.toString(),
      name: json['name']?.toString(),
    );
  }
}
