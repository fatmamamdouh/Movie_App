import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class TrailerWebView extends StatefulWidget {
  final String url;

  const TrailerWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<TrailerWebView> createState() => _TrailerWebViewState();
}

class _TrailerWebViewState extends State<TrailerWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    WebViewPlatform.instance = AndroidWebViewPlatform();

    final PlatformWebViewControllerCreationParams params =
    const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
