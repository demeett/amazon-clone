import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/contants.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;
  final double height = 120;
  @override
  Widget build(BuildContext context) {
    final double contHeight = context.screenHeight / 6;
    final double contWidth = context.screenWidth / 5;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd == (largeAds.length - 1)) {
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(largeAds[currentAd], width: double.infinity),
              Positioned(
                bottom: 0,
                child: Container(
                  width: context.screenWidth,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: backgroundColor,
            width: context.screenWidth,
            height: contHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsFormIndex(0, contHeight, contWidth),
                getSmallAdsFormIndex(1, contHeight, contWidth),
                getSmallAdsFormIndex(2, contHeight, contWidth),
                getSmallAdsFormIndex(3, contHeight, contWidth),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getSmallAdsFormIndex(int index, double height, double width) {
    print((height / 20).toString());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height / 20),
      child: Container(
        //margin: EdgeInsets.zero,
        height: width,
        width: width,
        decoration: ShapeDecoration(
          color: whiteColor,
          shadows: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                smallAds[index],
                height: width - 20,
                width: width - 20,
                alignment: Alignment.bottomCenter,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                adItemNames[index],
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
