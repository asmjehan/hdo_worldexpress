import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageLoad extends StatefulWidget {
  @override
  WebPageLoadState createState() => WebPageLoadState();
}

class WebPageLoadState extends State<WebPageLoad> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'http://hdoworldexpress.com/',
    );
  }
}
