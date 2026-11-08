class ProductModel {
final String name,image;
double currentPrice;
double? prePrice;
ProductModel({required this.name,required this.image,required this.currentPrice,this.prePrice});
factory ProductModel.fromJson(Map<String,dynamic>json){
  return ProductModel(name: json['name'], currentPrice: json['currentPrice'],image: json['image']);
}
factory ProductModel.fromJsonForSale(Map<String,dynamic>json){
  return ProductModel(name: json['name'], currentPrice: json['currentPrice'],prePrice:json['prePrice'],image: json['image']);
}
}