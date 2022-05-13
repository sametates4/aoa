import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../service/ads/adsManager.dart';

class BottomNavBar extends StatelessWidget{
  BottomNavBar({Key? key}) : super(key: key){
    adManager.addAds(true, true, true);
  }
  final adManager = AdManager();
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: AdWidget(ad: adManager.getBannerAd()!),
      width: adManager.getBannerAd()?.size.width.toDouble(),
      height: adManager.getBannerAd()?.size.height.toDouble(),
    );
  }

}