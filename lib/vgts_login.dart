import 'package:flutter/material.dart';
import 'package:vgts_login/web_view.dart';

class VGTSLogin {

  WebViewWidget? webView;

  Function(dynamic)? onSuccess;
  Function(String)? onFailure;

  VGTSLogin({this.onSuccess, this.onFailure}) {
    webView = new WebViewWidget();
  }

  openWebView(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewWidget())).then((value){
      if(value!=null) {
        onSuccess!(value);
      }
      else {
        onFailure!("Error");
      }
   });
  }

}





