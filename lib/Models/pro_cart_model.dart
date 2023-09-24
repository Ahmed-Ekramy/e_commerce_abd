class ProCatModel {
  bool? status;
  ProCatDataModel? data;

  ProCatModel({this.status,  this.data});

  ProCatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? ProCatDataModel.fromJson(json['data']) : null;
  }

}

class ProCatDataModel {
  num? currentPage;
  List<ProDataModel>? data;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  String? path;
  num? perPage;
  num? to;
  num? total;

  ProCatDataModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  ProCatDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ProDataModel>[];
      json['data'].forEach((v) {
        data!.add(ProDataModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}

class ProDataModel {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProDataModel(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart});

  ProDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}
