class ProdukModel {
  final int id;
  final String name;
  final String cover;
  final String desc;
  final int price;

  ProdukModel({
    required this.id,
    required this.name,
    required this.cover,
    required this.desc,
    required this.price,
  });
  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
        id: json['id'],
        name: json['name'],
        cover: json['cover'],
        desc: json['desc'],
        price: json['price']);
  }
}
