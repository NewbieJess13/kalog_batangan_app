import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsFeedPage extends ConsumerWidget {
  const NewsFeedPage({super.key});
  static get routeName => 'news_feed';
  static get routeLocation => '/news_feed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}
