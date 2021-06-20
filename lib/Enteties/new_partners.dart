class Partners {
  String? companyName;
  String? image;

  Partners({this.companyName, this.image});

  Partners.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyName'] = this.companyName;
    data['image'] = this.image;
    return data;
  }
}
