class MobileContract {
  String productName;
  String companyLogo;
  String productImage;
  double rating;
  String body;
  String data;
  String callMinutes;
  int price1Year;
  int price2Year;
  bool trending;
  bool vensyanRecomended;

  MobileContract(
      {required this.productName,
      required this.companyLogo,
      required this.productImage,
      required this.rating,
      required this.body,
      required this.data,
      required this.callMinutes,
      required this.price1Year,
      required this.price2Year,
      required this.trending,
      required this.vensyanRecomended});

  static MobileContract fromJson(json) => MobileContract(
        productName: json['productName'],
        companyLogo: json['companyLogo'],
        productImage: json['productImage'],
        rating: json['rating'],
        body: json['body'],
        data: json['data'],
        callMinutes: json['callMinutes'],
        price1Year: json['price1Year'],
        price2Year: json['price2Year'],
        trending: json['trending'],
        vensyanRecomended: json['vensyanRecomended'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['companyLogo'] = this.companyLogo;
    data['productImage'] = this.productImage;
    data['rating'] = this.rating;
    data['body'] = this.body;
    data['data'] = this.data;
    data['callMinutes'] = this.callMinutes;
    data['price1Year'] = this.price1Year;
    data['price2Year'] = this.price2Year;
    data['trending'] = this.trending;
    data['vensyanRecomended'] = this.vensyanRecomended;
    return data;
  }
}
