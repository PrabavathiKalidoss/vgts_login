import 'dart:convert';

import 'package:package_info/package_info.dart';
import 'package:vgts_login/core/path.dart';
import 'package:http/http.dart' as http;

import '../web_view.dart';
class Api {

  Future<Path?> getUrl() async {
      final response = await http.get(Uri.parse('https://firebasestorage.googleapis.com/v0/b/vgts-auth.appspot.com/o/auth_url.json?alt=media'));
      if (response.statusCode == 200) {
        return Path.fromJson(jsonDecode(response.body));
      }
  }

  Future<AppEnvironment?> configure() async {

    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      print("Package Name ${packageInfo.packageName}");

      if (packageInfo.packageName.endsWith(".dev")){
        return AppEnvironment.DEV;
      } else if (packageInfo.packageName.endsWith(".staging") || packageInfo.packageName.endsWith(".stag")){
        return AppEnvironment.STAGING;
      } else {
        return AppEnvironment.PRODUCTION;
      }

    } catch (e) {
      throw e;
    }
  }

}