class GetBrandsResponse {
  List<Brand>? list;

  GetBrandsResponse({this.list});

  GetBrandsResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <Brand>[];
      json['list'].forEach((v) {
        list!.add(new Brand.fromJson(v));
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

class Brand {
  String? sId;
  String? name;
  String? imagePath;
  int? iV;

  Brand({this.sId, this.name, this.imagePath, this.iV});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    imagePath = json['imagePath'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['imagePath'] = this.imagePath;
    data['__v'] = this.iV;
    return data;
  }
}
