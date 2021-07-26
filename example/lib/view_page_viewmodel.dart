import 'package:stacked/stacked.dart';
import 'package:vgts_login/vgts_login.dart';
import 'package:vgts_login/core/user.dart';

class ViewPageViewModel extends BaseViewModel {

  VGTSLogin? login;

  User? _user;

  onSuccess(dynamic response) async {
    this._user = response;
    print("SuccessResponse ${_user!.toJson()}");
  }

  onFail(String response) async {
    print(response);
  }

  void init() {
    login =  new VGTSLogin(onSuccess: onSuccess,onFailure: onFail);
  }



}