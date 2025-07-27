class GetProductsResponse {
  List<ProductItem>? list;

  GetProductsResponse({this.list});

  GetProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ProductItem>[];
      json['list'].forEach((v) {
        list!.add(new ProductItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductItem {
  String? sId;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  double? rating;
  int? discount;
  int? remain;
  int? sold;
  String? category;
  String? brand;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductItem({
    this.sId,
    this.title,
    this.price,
    this.description,
    this.images,
    this.rating,
    this.discount,
    this.remain,
    this.sold,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ProductItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    rating = json['rating'];
    discount = json['discount'];
    remain = json['remain'];
    sold = json['sold'];
    category = json['category'];
    brand = json['brand'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['images'] = this.images;
    data['rating'] = this.rating;
    data['discount'] = this.discount;
    data['remain'] = this.remain;
    data['sold'] = this.sold;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

// class Location {
//   Location? location;
//   String? name;

//   Location({this.location, this.name});

//   Location.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     data['name'] = this.name;
//     return data;
//   }
// }

// class LocationType {
//   String? type;
//   List<int>? coordinates;

//   LocationType({this.type, this.coordinates});

//   LocationType.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<int>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     return data;
//   }
// }
