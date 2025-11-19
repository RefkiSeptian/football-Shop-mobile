// To parse this JSON data, do
//
//     final productsEntry = productsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductsEntry> productsEntryFromJson(String str) => List<ProductsEntry>.from(json.decode(str).map((x) => ProductsEntry.fromJson(x)));

String productsEntryToJson(List<ProductsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    bool isFeatured;
    String brand;
    int stok;
    int userId;
    String username;

    ProductsEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.isFeatured,
        required this.brand,
        required this.stok,
        required this.userId,
        required this.username, 
    });

    factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"] ?? "",
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        isFeatured: json["is_featured"],
        brand: json["brand"] ?? "",
        stok: json["stok"] ?? "",
        userId: json["user_id"] ?? "",
        username: json["username"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "brand": brand,
        "stok": stok,
        "user_id": userId,
        "username": username,
    };
}
