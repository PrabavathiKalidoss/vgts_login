import 'package:get_it/get_it.dart';
import 'package:vgts_login_example/service/appconfig_service.dart';
import 'package:vgts_login_example/service/navigation_service.dart';
import 'package:vgts_login_example/service/toast_service.dart';
import 'helper/firebase_remote_helper.dart';


GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => FirebaseRemoteHelper());
  locator.registerLazySingleton(() => AppConfigService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ToastService());

  // locator.registerFactory(() => SplashViewModel());
  // locator.registerFactory(() => CreateCompanyViewModel());
  // locator.registerFactory(() => InventoryListViewModel());
  // locator.registerFactory(() => EstimationProductListViewModel());

}
