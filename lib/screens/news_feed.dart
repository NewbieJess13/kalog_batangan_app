import 'package:flutter/material.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});
  static get routeName => 'news_feed';
  static get routeLocation => '/news_feed';

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  late WebViewController _viewController;

  @override
  void initState() {
    _viewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://twitter.com/phivolcs_dost')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://twitter.com/phivolcs_dost'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Feed",
      ),
      body: WebViewWidget(controller: _viewController),
    );
  }
}
