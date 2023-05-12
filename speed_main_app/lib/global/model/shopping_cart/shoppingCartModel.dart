class ShoppingCartModel {
  int id;
  int price;
  int qty;
  double total_price;
  List<String> images;

  ShoppingCartModel({
    this.id,
    this.price,
    this.qty,
    this.total_price,
    this.images,
  });

  ShoppingCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    qty = json['qty'];
    total_price = json['total_price'];
    images = json['images'].cast<String>();
  }
}
