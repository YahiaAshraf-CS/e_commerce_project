class ProductListEntity {
  List<ProductEntity> list;
  int total;
  int skip;
  int limit;

  ProductListEntity(this.list, this.total, this.skip, this.limit);

 
}

class ProductEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> images;

  ProductEntity({
    this.id=0,
    this.title="",
    this.description="",
    this.category="",
    this.price=0.0,
    this.discountPercentage=0.0,
    this.rating=0.0,
    this.stock=0,
    this.images= const[],
  });

  
}
