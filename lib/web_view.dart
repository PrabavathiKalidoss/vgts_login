import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:vgts_login/core/user.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewWidget> {

  String _selectedUrl = 'http://account.dev.vgts.xyz/signin?mode=mobile';
  String _userAgent = "";
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    getUserAgent();
  }

  WebViewController? controllerGlobal;

  Future<bool> _onWillPop (BuildContext context) async {
    if (await controllerGlobal!.canGoBack()) {
      print("onwillpop");
      await controllerGlobal!.goBack();
      return Future.value(false) ;
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
        return WillPopScope(
          onWillPop: () =>_onWillPop(context),
          child: Scaffold(
            appBar: AppBar(
              title: Text("VGTS Login",textScaleFactor: 1,),
              automaticallyImplyLeading: false,
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () async{
                if (await controllerGlobal!.canGoBack()) {
                await controllerGlobal!.goBack();
                return;
                }
                Navigator.pop(context);
                return;
              },),
            ),
            body: WebView(
              userAgent: _userAgent,
              initialUrl: _selectedUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.future.then((value) => controllerGlobal = value);
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            ),
          ),
        );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'setUserForMobile',
        onMessageReceived: (JavascriptMessage msg) {
            Map<String, dynamic> message = json.decode(msg.message);
            User data = User.fromJson(message);
            print(data.toJson());
            Navigator.pop(context,data);
            return;
    });
  }

  void getUserAgent() async {
    this._userAgent =  await FlutterUserAgent.getPropertyAsync('userAgent');
    setState(() {

    });
  }
}
