// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class Welcome {
  Welcome({
    this.orderId,
    this.user,
    this.products,
  });

  int orderId;
  User user;
  List<Product> products;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        orderId: json["orderId"],
        user: User.fromJson(json["user"]),
        products: List<Product>.from(
            json["Products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "user": user.toJson(),
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId,
    this.productName,
    this.quantity,
    this.price,
  });

  int productId;
  String productName;
  int quantity;
  double price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "quantity": quantity,
        "price": price,
      };
}

class User {
  User({
    this.fullName,
    this.email,
  });

  String fullName;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
      };
}
