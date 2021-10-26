//
// // import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:package_info/package_info.dart';
// import 'package:vgts_login/web_view.dart';
// import 'package:vgts_login_example/service/appconfig_service.dart';
// import '../locator.dart';
//
// class FirebaseRemoteHelper {
//
//   // final AppConfigService appConfigService = locator<AppConfigService>();
//   // RemoteConfig? remoteConfig;
//   //
//   // Future<void> configure() async {
//   //   remoteConfig = await RemoteConfig.instance;
//   //   try {
//   //     //Version Changed
//   //     // await remoteConfig.fetch(expiration: Duration(seconds: 300));
//   //     // await remoteConfig.activateFetched();
//   //
//   //     await remoteConfig?.setConfigSettings(RemoteConfigSettings(
//   //       fetchTimeout: const Duration(seconds: 10),
//   //       minimumFetchInterval: Duration.zero,
//   //     ));
//   //     await remoteConfig?.fetch();
//   //     await remoteConfig?.fetchAndActivate();
//   //     String configKey;
//   //
//   //     AppEnvironment appEnvironment;
//   //
//   //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   //
//   //     if (packageInfo.packageName.contains("dev")){
//   //       appEnvironment = AppEnvironment.DEV;
//   //       configKey = "auth_dev";
//   //     } else if (packageInfo.packageName.contains("stag")){
//   //       appEnvironment = AppEnvironment.STAGING;
//   //       configKey = "auth_staging";
//   //     } else {
//   //       appEnvironment = AppEnvironment.PRODUCTION;
//   //       configKey = "auth";
//   //     }
//   //
//   //     print(configKey);
//   //
//   //     appConfigService.setConfig(getStringValue(configKey), appEnvironment);
//   //     print('Init RemoteConfig: SUCCESS');
//   //
//   //   } catch (e) {
//   //     // var connectivityResult = await (Connectivity().checkConnectivity());
//   //     //
//   //     // if (connectivityResult == ConnectivityResult.none){
//   //     //
//   //     //   locator<ToastService>().showText(text:"No Network Connection. Please Enable Internet and Try Again.");
//   //     // }
//   //
//   //     print(e) ;
//   //   }
//   // }
//   //
//   // String getStringValue(String value) =>
//   //     remoteConfig!.getString(value);
//   // bool getBoolValue(String value) =>
//   //     remoteConfig!.getBool(value);
//   // int getIntValue(String value) =>
//   //     remoteConfig!.getInt(value);
//   // double getDoubleValue(String value) =>
//   //     remoteConfig!.getDouble(value);
//
// }
