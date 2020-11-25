class CompaniesResponse {
  String status;
  List<Company> data;

  CompaniesResponse({this.status, this.data});

  CompaniesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Company>();
      json['data'].forEach((v) {
        data.add(new Company.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  String registration;
  String companyName;
  String website;
  String platformName;
  String registrationType;
  String badanHukum;
  bool isSyariah;
  String alamat;
  RegisteredAt registeredAt;

  Company(
      {this.registration,
        this.companyName,
        this.website,
        this.platformName,
        this.registrationType,
        this.badanHukum,
        this.isSyariah,
        this.alamat,
        this.registeredAt});

  Company.fromJson(Map<String, dynamic> json) {
    registration = json['registration'];
    companyName = json['company_name'];
    website = json['website'];
    platformName = json['platform_name'];
    registrationType = json['registration_type'];
    badanHukum = json['badan_hukum'];
    isSyariah = json['is_syariah'];
    alamat = json['alamat'];
    registeredAt = json['registered_at'] != null
        ? new RegisteredAt.fromJson(json['registered_at'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registration'] = this.registration;
    data['company_name'] = this.companyName;
    data['website'] = this.website;
    data['platform_name'] = this.platformName;
    data['registration_type'] = this.registrationType;
    data['badan_hukum'] = this.badanHukum;
    data['is_syariah'] = this.isSyariah;
    data['alamat'] = this.alamat;
    if (this.registeredAt != null) {
      data['registered_at'] = this.registeredAt.toJson();
    }
    return data;
  }
}

class RegisteredAt {
  int iSeconds;

  RegisteredAt({this.iSeconds});

  RegisteredAt.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_seconds'] = this.iSeconds;
    return data;
  }
}
