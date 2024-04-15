import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';
import 'package:kalog_batangan_app/widgets/back_button.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  static get routeName => 'info';
  static get routeLocation => '/info';

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<String> imageList = [
    "assets/info_1.jpeg",
    "assets/info_2.jpeg",
    "assets/info_3.jpeg",
    "assets/info_4.jpeg",
    "assets/info_5.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Information",
        leading: PrimaryBackButton(),
        showInfo: false,
      ),
      body: InfiniteCarousel.builder(
        itemCount: 5,
        itemExtent: 400,
        center: true,
        anchor: 0.0,
        velocityFactor: 0.5,
        onIndexChanged: (index) {},
        // controller: _scrollController,
        axisDirection: Axis.vertical,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Image.asset(
            imageList[itemIndex],
            height: 600,
            width: 500,
          );
        },
      ),
    );
  }
}
