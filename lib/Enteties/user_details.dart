class User {
  String? customerNumber;
  String? name;
  String? lastName;
  String? dateOfBirth;
  String? sex;
  String? initial;
  String? emaldAdres;
  String? phoneNumber;
  Adres? adres;

  User({
    this.customerNumber,
    this.name,
    this.lastName,
    this.dateOfBirth,
    this.sex,
    this.initial,
    this.emaldAdres,
    this.phoneNumber,
    this.adres,
  });

  User.fromJson(Map<String, dynamic> json) {
    customerNumber = json['customer_number'];
    name = json['name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    sex = json['sex'];
    initial = json['initial'];
    emaldAdres = json['emald_adres'];
    phoneNumber = json['phone_number'];
    adres = json['adres'] != null ? new Adres.fromJson(json['adres']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_number'] = this.customerNumber;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['sex'] = this.sex;
    data['initial'] = this.initial;
    data['emald_adres'] = this.emaldAdres;
    data['phone_number'] = this.phoneNumber;
    if (this.adres != null) {
      data['adres'] = this.adres!.toJson();
    }
    return data;
  }
}

class Adres {
  String? street;
  String? zipCode;
  String? stateProvice;
  String? country;

  Adres({this.street, this.zipCode, this.stateProvice, this.country});

  Adres.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    zipCode = json['zip_code'];
    stateProvice = json['state_provice'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['zip_code'] = this.zipCode;
    data['state_provice'] = this.stateProvice;
    data['country'] = this.country;
    return data;
  }
}
