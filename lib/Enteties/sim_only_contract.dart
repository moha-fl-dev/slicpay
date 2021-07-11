class SimOnlyContract {
  String productName;
  double price;
  String provider;
  String companyLogo;
  String data;
  String calls;
  bool fiveG;

  SimOnlyContract(
      {required this.productName,
      required this.price,
      required this.provider,
      required this.companyLogo,
      required this.data,
      required this.calls,
      required this.fiveG});

  static SimOnlyContract fromJson(json) => SimOnlyContract(
        productName: json['productName'],
        price: json['price'],
        provider: json['provider'],
        companyLogo: json['CompanyLogo'],
        data: json['data'],
        calls: json['calls'],
        fiveG: json['five_g'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['provider'] = this.provider;
    data['CompanyLogo'] = this.companyLogo;
    data['data'] = this.data;
    data['calls'] = this.calls;
    data['five_g'] = this.fiveG;
    return data;
  }
}
