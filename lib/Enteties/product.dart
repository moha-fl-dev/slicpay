class Product {
  String? type;
  String? name;
  String? description;
  String? image;
  String? price1year;
  String? price2years;
  String? companyName;
  bool? trending;
  Options? options;

  Product(
      {this.name,
      this.type,
      this.description,
      this.image,
      this.price1year,
      this.price2years,
      this.companyName,
      this.trending,
      this.options});

  // Product.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   type = json['type'];
  //   description = json['description'];
  //   image = json['image'];
  //   price1year = json['price_1year'];
  //   price2years = json['price_2years'];
  //   companyName = json['companyName'];
  //   trending = json['trending'];
  //   options =
  //       json['options'] != null ? new Options.fromJson(json['options']) : null;
  // }

  static Product fromJson(json) => Product(
        name: json['name'],
        type: json['type'],
        description: json['description'],
        image: json['image'],
        price1year: json['price_1year'],
        price2years: json['price_2years'],
        companyName: json['companyName'],
        trending: json['trending'],
        options: json['options'] != null
            ? new Options.fromJson(json['options'])
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price_1year'] = this.price1year;
    data['price_2years'] = this.price2years;
    data['companyName'] = this.companyName;
    data['trending'] = this.trending;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class Options {
  String? length;
  bool? additionsAllowed;
  String? deductible;

  Options({this.length, this.additionsAllowed, this.deductible});

  Options.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    additionsAllowed = json['additions_allowed'];
    deductible = json['deductible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['additions_allowed'] = this.additionsAllowed;
    data['deductible'] = this.deductible;
    return data;
  }
}
