import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delaz Mart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF544D25)),
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new MyHomePage(),
      backgroundColor: Colors.white,
      // title: new Text('Flutter Javatpoint',textScaleFactor: 2,),
      image: Image.asset("assets/dealz1.png"),
      // loadingText: Text("Loading"),
      photoSize: 120.0,
      loaderColor: Colors.yellow[600]
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.url});

  final String url;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _controller;

  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  // WebViewController _webViewController;

  bool isLoading = true;
      
  //Make sure this function return Future<bool> otherwise you will get an error
  Future<bool> _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text(widget.title),
          // ),
          body: SafeArea(
            child: Stack(children: [
              WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://dealzmart.co/',
                key: UniqueKey(),
                onWebViewCreated: (WebViewController webViewController) {
                  _controllerCompleter.future
                      .then((value) => _controller = value);
                  _controllerCompleter.complete(webViewController);
                },
              ),
            ]),
          ),
        ));
  }
}
