import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';

class WebPageLoad extends StatefulWidget {
  @override
  WebViewState createState() =>
      WebViewState("HDO World Express", "https://www.hdoworldexpress.com/");
}

// class WebPageLoadState extends State<WebPageLoad> {
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child:
//           WebView(
//             initialUrl: 'https://hdoworldexpress.com/',
//             javascriptMode: JavascriptMode.unrestricted,
//           ),
//
//         )
//       ),
//     );
//   }
// }

class WebViewState extends State<WebPageLoad> {
  String title, url;
  bool isLoading = true;
  final _key = UniqueKey();

  WebViewState(String title, String url) {
    this.title = title;
    this.url = url;
  }
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.blue,
      //   // title: Text(this.title,
      //   //     style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
      //   // centerTitle: true,
      // ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: WebView(
              onWebResourceError: NoInternet(),
              key: _key,
              initialUrl: this.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}

NoInternet() {
  return Container(
    child: Center(
      child: Image.asset("assets/images/no internet.gif"),
    ),
  );
}
