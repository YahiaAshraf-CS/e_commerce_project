class CategoriesListEntity {
  List<CategoryEntity> list;

  CategoriesListEntity({this.list=const []});

  
}

class CategoryEntity {
  final String slug;
  final String name;

  CategoryEntity(this.slug, this.name);

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      json['slug'] ,
      json['name'] ,
    );
  }
}
