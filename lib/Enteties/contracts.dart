// class Contracts {
//   String? type;
//   bool? hasMobile;
//   String? companyName;
//   String? logo;
//   String? productName;
//   String? price;
//   String? startDate;
//   String? endDate;
//   String? duration;
//   Contents? contents;
//   Mobile? mobile;

//   Contracts({
//     this.type,
//     this.hasMobile,
//     this.companyName,
//     this.logo,
//     this.productName,
//     this.price,
//     this.startDate,
//     this.endDate,
//     this.duration,
//     this.contents,
//   });

//   Contracts.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     hasMobile = json['has_mobile'];
//     logo = json['logo'];
//     companyName = json['companyName'];
//     productName = json['productName'];
//     price = json['price'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     duration = json['duration'];
//     contents = json['contents'] != null
//         ? new Contents.fromJson(json['contents'])
//         : null;
//     mobile =
//         json['mobile'] != null ? new Mobile.fromJson(json['mobile']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['has_mobile'] = this.hasMobile;
//     data['companyName'] = this.companyName;
//     data['productName'] = this.productName;
//     data['price'] = this.price;
//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['duration'] = this.duration;
//     if (this.contents != null) {
//       data['contents'] = this.contents!.toJson();
//     }
//     return data;
//   }
// }

// class Contents {
//   String? data;
//   String? calls;
//   String? frequency;

//   Contents({this.data, this.calls, this.frequency});

//   Contents.fromJson(Map<String, dynamic> json) {
//     data = json['data'];
//     calls = json['calls'];
//     frequency = json['frequency'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['data'] = this.data;
//     data['calls'] = this.calls;
//     data['frequency'] = this.frequency;
//     return data;
//   }
// }

class Mobile {
  String? name;
  String? model;
  String? logo;

  Mobile({this.name, this.model, this.logo});

  Mobile.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    name = json['name'];
    logo = json['logo'];
  }
}

class Contracts {
  String? type;
  bool? hasMobile;
  String? companyName;
  String? logo;
  String? productName;
  String? price;
  String? startDate;
  String? endDate;
  String? duration;
  Contents? contents;
  Info? info;
  Mobile? mobile;

  Contracts(
      {this.type,
      this.hasMobile,
      this.companyName,
      this.logo,
      this.productName,
      this.price,
      this.startDate,
      this.endDate,
      this.duration,
      this.contents,
      this.info,
      this.mobile});

  Contracts.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    hasMobile = json['has_mobile'];
    companyName = json['companyName'];
    logo = json['logo'];
    productName = json['productName'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    duration = json['duration'];
    contents = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    mobile =
        json['mobile'] != null ? new Mobile.fromJson(json['mobile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['has_mobile'] = this.hasMobile;
    data['companyName'] = this.companyName;
    data['logo'] = this.logo;
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['duration'] = this.duration;
    if (this.contents != null) {
      data['contents'] = this.contents!.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Contents {
  String? data;
  String? calls;
  String? frequency;

  Contents({this.data, this.calls, this.frequency});

  Contents.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    calls = json['calls'];
    frequency = json['frequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['calls'] = this.calls;
    data['frequency'] = this.frequency;
    return data;
  }
}

class Info {
  String? phoneNumber;
  String? unblockingKey;

  Info({this.phoneNumber, this.unblockingKey});

  Info.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    unblockingKey = json['unblockingKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['unblockingKey'] = this.unblockingKey;
    return data;
  }
}
