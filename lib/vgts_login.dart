import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:vgts_login/service/api.dart';
import 'package:vgts_login/web_view.dart';

import 'core/path.dart';

class VGTSLogin {

  WebViewWidget? webView;

  Function(dynamic)? onSuccess;
  Function(String)? onFailure;

  VGTSLogin({this.onSuccess, this.onFailure}) {
    webView = new WebViewWidget(url: '',);
  }

  //http://accounts.dev.vgts.xyz/signin?mode=mobile

  //prod url
  //http://accounts.yoloworks.in



  Future<Dev?> getPath() async {

    AppEnvironment? environment = await Api().configure();

    Path? data = await Api().getUrl();
    if(environment == AppEnvironment.DEV){
      return data?.dev;
    }
    else if(environment == AppEnvironment.STAGING){
      return data?.staging;
    }
    else{
      return data?.production;
    }

  }


  signIn(BuildContext context) async {

    Dev? dev = await getPath();

   await Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewWidget(url:dev!.login,))).then((value){
      if(value!=null) {
        onSuccess!(value);
      }
      else {
        onFailure!("Error");
      }
   });
  }

  signUp(BuildContext context) async {

    Dev? dev = await getPath();

   await Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewWidget(url:dev!.register))).then((value){
      if(value!=null) {
        onSuccess!(value);
      }
      else {
        onFailure!("Error");
      }
    });
  }

}





