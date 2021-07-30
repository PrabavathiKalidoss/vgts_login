import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:vgts_login/core/user.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewWidget> {

  String _selectedUrl = 'http://account.dev.vgts.xyz/signin?mode=mobile';
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  bool showWebView = false;
  String? _userAgent;
  int progress = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // getUserAgent();

    fetchUserAgent().then((value) {
      setState(() {
        showWebView = true;
      });
    });
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

  Future fetchUserAgent() async {

    PackageInfo _packageInfo = await PackageInfo.fromPlatform();

    String versionString = "${_packageInfo.version}-${_packageInfo.buildNumber}-${_packageInfo.packageName}";

    final dartVersionString = Platform.version.split(" ").first;

    final osString = Platform.operatingSystem;
    final osVersionString = Platform.operatingSystemVersion.split(" ").first;

    _userAgent = "Info/$versionString Dart/$dartVersionString OS/$osString-$osVersionString";
    debugPrint("UserAgent $_userAgent");
  }

  @override
  Widget build(BuildContext context) {
        return WillPopScope(
          onWillPop: () =>_onWillPop(context),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [

                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [

                          progress < 100 ? LinearProgressIndicator(
                            value: progress / 100,
                            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                          ) : Container(),

                          Flexible(
                            child: WebView(
                              userAgent: _userAgent,
                              initialUrl: _selectedUrl,
                              javascriptMode: JavascriptMode.unrestricted,
                              onWebViewCreated: (WebViewController webViewController) {
                                controllerGlobal = webViewController;

                                // _controller.future.then((value) => controllerGlobal = value);
                                // _controller.complete(webViewController);
                              },
                              onProgress: (int progress) {
                                setState(() {
                                  this.progress = progress;
                                });
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
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(icon: Icon(Icons.arrow_back),onPressed: () async{
                        if (await controllerGlobal!.canGoBack()) {
                          await controllerGlobal!.goBack();
                          return;
                        }
                        Navigator.pop(context);
                        return;
                      },
                    ),
                  )

                ],
              ),
            )

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

}