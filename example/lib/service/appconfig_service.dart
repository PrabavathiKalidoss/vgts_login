
import 'dart:convert';
import 'package:vgts_login/web_view.dart';


class AppConfigService {
  AppConfig? _appConfig;
  AppEnvironment? _appEnvironment;

  AppEnvironment? get appEnvironment => _appEnvironment;

  AppConfig? get config {
    return _appConfig;
  }

  setConfig(String value, AppEnvironment appEnvironment) {
    _appConfig = AppConfig.fromJson(jsonDecode(value));
    _appEnvironment = appEnvironment;
  }
}

class AppConfig {
 late int vendorId;
 late String appName;
 late String baseApiUrl;
 late  String googleAPIKey;
 late String openApiUrl;
 late AppLinks appLinks;
 late AppStore androidStore;
 late AppStore iosStore;

  bool get isVendorApp => vendorId != null;

  AppConfig(
      {required this.appName,
        required this.baseApiUrl,
        required this.googleAPIKey,
        required this.iosStore,
        required this.androidStore,
        required this.appLinks,required this.openApiUrl,required this.vendorId});

  AppConfig.fromJson(Map<String, dynamic> json) {
    vendorId = json['VendorId'];
    appName = json['AppName'];
    baseApiUrl = json['BaseApiUrl'];
    googleAPIKey = json['GoogleAPIKey'];
    openApiUrl = json['openApiUrl'];
    androidStore = json['AndroidStore'] ?? new AppStore.fromJson(json['AndroidStore']);
    iosStore = json['IosStore']  ?? new AppStore.fromJson(json['IosStore']) ;
    appLinks = json['AppLinks']  ?? new AppLinks.fromJson(json['AppLinks']) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VendorId'] = this.vendorId;
    data['AppName'] = this.appName;
    data['BaseApiUrl'] = this.baseApiUrl;
    data['openApiUrl'] = this.openApiUrl;
    data['GoogleAPIKey'] = this.googleAPIKey;
    if (this.androidStore != null) {
      data['AndroidStore'] = this.androidStore.toJson();
    }
    if (this.iosStore != null) {
      data['IosStore'] = this.iosStore.toJson();
    }
    if (this.appLinks != null) {
      data['AppLinks'] = this.appLinks.toJson();
    }
    return data;
  }
}

class AppStore {
  String? url;
  String? appID;
  String? version;
  String? reviewUrl;
  String? updateMessage;
  bool? forceUpdate;

  AppStore(
      {this.url, this.appID, this.version, this.reviewUrl, this.forceUpdate});

  AppStore.fromJson(Map<String, dynamic> json) {
    url = json['Url'];
    appID = json['AppID'];
    version = json['Version'];
    reviewUrl = json['ReviewUrl'];
    updateMessage = json['UpdateMessage'];
    forceUpdate = json['ForceUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Url'] = this.url;
    data['AppID'] = this.appID;
    data['Version'] = this.version;
    data['ReviewUrl'] = this.reviewUrl;
    data['UpdateMessage'] = this.updateMessage;
    data['ForceUpdate'] = this.forceUpdate;
    return data;
  }
}


class AppLinks {
  String? supportEmail;
  String? supportUrl;
  String? privacy;
  String? userAgreement;
  String? contactPhone;

  AppLinks(
      {this.supportEmail,
        this.supportUrl,
        this.privacy,
        this.userAgreement,
        this.contactPhone});

  AppLinks.fromJson(Map<String, dynamic> json) {
    supportEmail = json['SupportEmail'];
    supportUrl = json['SupportUrl'];
    privacy = json['Privacy'];
    userAgreement = json['UserAgreement'];
    contactPhone = json['ContactPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SupportEmail'] = this.supportEmail;
    data['SupportUrl'] = this.supportUrl;
    data['Privacy'] = this.privacy;
    data['UserAgreement'] = this.userAgreement;
    data['ContactPhone'] = this.contactPhone;
    return data;
  }
}