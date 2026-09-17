import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const EstcourtGoApp());
}

class EstcourtGoApp extends StatelessWidget {
  const EstcourtGoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESTCOURT GO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, err) => ad.dispose(),
      ),
    )..load();

    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (e) => print(e),
      ),
    );
  }

  void _book(String type) {
    _interstitialAd?.show();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$type ibhukhiwe MAHHALA! Imali R2.50 ingenile!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ESTCOURT GO - FREE'), backgroundColor: const Color(0xFF0A5C36), foregroundColor: Colors.white),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                Card(child: ListTile(title: const Text('🚕 TAXI Estcourt - MAHHALA'), subtitle: const Text('R95 - Akukhokhi ukubhukha'), onTap: () => _book('Taxi'))),
                Card(child: ListTile(title: const Text('🛻 H100 - MAHHALA'), subtitle: const Text('R350-R800 - Akukhokhi'), onTap: () => _book('H100'))),
                Card(child: ListTile(title: const Text('🌍 International - MAHHALA'), subtitle: const Text('Book from UK/USA'), onTap: () => _book('World'))),
                Container(padding: const EdgeInsets.all(10), color: Colors.yellow[100], child: const Text('💰 WENA UHOLELA: 1 view = R0.80-R5! 100 abantu = R80-R500/ngosuku! Akukho okhokhayo!', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          if (_isLoaded) SizedBox(height: 50, child: AdWidget(ad: _bannerAd!)),
        ],
      ),
    );
  }
}
