import 'package:aoa/service/provider/calisanmodel.dart';
import 'package:aoa/service/provider/chartgelir.dart';
import 'package:aoa/service/provider/chartgider.dart';
import 'package:aoa/service/provider/chartmesai.dart';
import 'package:aoa/service/provider/chartsaat.dart';
import 'package:aoa/service/provider/db/calisanlarmodel.dart';
import 'package:aoa/service/provider/db/paramodel.dart';
import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/service/provider/db/workermodel.dart';
import 'package:aoa/service/provider/gelirmodel.dart';
import 'package:aoa/service/provider/gidermodel.dart';
import 'package:aoa/service/provider/gunmodel.dart';
import 'package:aoa/service/provider/indexmodel.dart';
import 'package:aoa/service/provider/monthmodel.dart';
import 'package:aoa/service/provider/pdfpersonalgelir.dart';
import 'package:aoa/service/provider/pdfpersonalgider.dart';
import 'package:aoa/service/provider/pdfpersonalsaat.dart';
import 'package:aoa/service/provider/pdfworkertoplamgider.dart';
import 'package:aoa/service/provider/pdfworkertoplamis.dart';
import 'package:aoa/service/provider/saatmodel.dart';
import 'package:aoa/service/provider/stackmodel.dart';
import 'package:aoa/service/provider/tarihmodel.dart';
import 'package:aoa/service/provider/workertoplamcalisan.dart';
import 'package:aoa/service/provider/workertoplamgider.dart';
import 'package:aoa/views/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-3421453932487412/6161984402',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad){
            print('ad is loaded');
            openAd = ad;
            openAd!.show();
          },
          onAdFailedToLoad: (error) {
            print('ad failed to load $error');
          }), orientation: AppOpenAd.orientationPortrait
  );
}

void showAd() {
  if(openAd == null) {
    print('trying tto show before loading');
    loadAd();
    return;
  }

  openAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        print('onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error){
        ad.dispose();
        print('failed to load $error');
        openAd = null;
        loadAd();
      },
      onAdDismissedFullScreenContent: (ad){
        ad.dispose();
        print('dismissed');
        openAd = null;
        loadAd();
      }
  );

  openAd!.show();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();

  await loadAd();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonalModel()),
        ChangeNotifierProvider(create: (_) => WorkerModel()),
        ChangeNotifierProvider(create: (_) => TarihModel()),
        ChangeNotifierProvider(create: (_) => GelirModel()),
        ChangeNotifierProvider(create: (_) => GiderModel()),
        ChangeNotifierProvider(create: (_) => CalisanlarModel()),
        ChangeNotifierProvider(create: (_) => StackModel()),
        ChangeNotifierProvider(create: (_) => GunModel()),
        ChangeNotifierProvider(create: (_) => MonthModel()),
        ChangeNotifierProvider(create: (_) => ChartGelirModel()),
        ChangeNotifierProvider(create: (_) => ChartGiderModel()),
        ChangeNotifierProvider(create: (_) => ChartMesaiModel()),
        ChangeNotifierProvider(create: (_) => ChartSaatModel()),
        ChangeNotifierProvider(create: (_) => CalisanModel()),
        ChangeNotifierProvider(create: (_) => ParaModel()),
        ChangeNotifierProvider(create: (_) => IndexModel()),
        ChangeNotifierProvider(create: (_) => WorkerToplamCalisan()),
        ChangeNotifierProvider(create: (_) => WorkerToplamGider()),
        ChangeNotifierProvider(create: (_) => SaatModel()),
        ChangeNotifierProvider(create: (_) => PdfPersonalSaat()),
        ChangeNotifierProvider(create: (_) => PdfPersonalGider()),
        ChangeNotifierProvider(create: (_) => PdfPersonalGelir()),
        ChangeNotifierProvider(create: (_) => PdfWorkerToplamGider()),
        ChangeNotifierProvider(create: (_) => PdfWorkerToplaIs()),
      ],
      child: GetMaterialApp(
        title: 'Yevmiye - Puantaj Hesabım',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}