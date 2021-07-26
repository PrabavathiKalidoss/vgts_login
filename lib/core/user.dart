class User {
  String? username;
  String? firstName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  Language? language;
  Country? country;
  Timezone? timezone;
  bool? acceptedTerms;
  String? email;
  String? deviceId;
  String? passcode;

  User(
      {this.username,
        this.firstName,
        this.lastName,
        this.gender,
        this.dateOfBirth,
        this.language,
        this.country,
        this.timezone,
        this.acceptedTerms,
        this.email,
        this.deviceId,
        this.passcode});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    timezone = json['timezone'] != null
        ? new Timezone.fromJson(json['timezone'])
        : null;
    acceptedTerms = json['accepted_terms'];
    email = json['email'];
    deviceId = json['device_id'];
    passcode = json['passcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.timezone != null) {
      data['timezone'] = this.timezone!.toJson();
    }
    data['accepted_terms'] = this.acceptedTerms;
    data['email'] = this.email;
    data['device_id'] = this.deviceId;
    data['passcode'] = this.passcode;
    return data;
  }
}

class Language {
  int? id;
  String? name;
  int? code;

  Language({this.id, this.name, this.code});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? iso3;
  String? iso2;
  String? phoneCode;
  String? capital;
  String? currency;
  String? currencySymbol;
  String? tld;
  String? native;
  String? region;
  String? subregion;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiu;

  Country(
      {this.id,
        this.name,
        this.iso3,
        this.iso2,
        this.phoneCode,
        this.capital,
        this.currency,
        this.currencySymbol,
        this.tld,
        this.native,
        this.region,
        this.subregion,
        this.latitude,
        this.longitude,
        this.emoji,
        this.emojiu});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    phoneCode = json['phone_code'];
    capital = json['capital'];
    currency = json['currency'];
    currencySymbol = json['currency_symbol'];
    tld = json['tld'];
    native = json['native'];
    region = json['region'];
    subregion = json['subregion'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    emoji = json['emoji'];
    emojiu = json['emojiu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iso3'] = this.iso3;
    data['iso2'] = this.iso2;
    data['phone_code'] = this.phoneCode;
    data['capital'] = this.capital;
    data['currency'] = this.currency;
    data['currency_symbol'] = this.currencySymbol;
    data['tld'] = this.tld;
    data['native'] = this.native;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['emoji'] = this.emoji;
    data['emojiu'] = this.emojiu;
    return data;
  }
}

class Timezone {
  int? id;
  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  Timezone(
      {this.id,
        this.zoneName,
        this.gmtOffset,
        this.gmtOffsetName,
        this.abbreviation,
        this.tzName});

  Timezone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneName = json['zone_name'];
    gmtOffset = json['gmt_offset'];
    gmtOffsetName = json['gmt_offset_name'];
    abbreviation = json['abbreviation'];
    tzName = json['tz_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zone_name'] = this.zoneName;
    data['gmt_offset'] = this.gmtOffset;
    data['gmt_offset_name'] = this.gmtOffsetName;
    data['abbreviation'] = this.abbreviation;
    data['tz_name'] = this.tzName;
    return data;
  }
}