class Product {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;
  String? image;

  Product({this.postId, this.id, this.name, this.email, this.body,this.image});

  Product.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
    body = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    data['image'] = this.body;
    return data;
  }
}
