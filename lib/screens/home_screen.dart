import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/profile_screen.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart';

// 1. Import the Google Mobile Ads package
import 'package:google_mobile_ads/google_mobile_ads.dart';

// You will also need to add 'google_mobile_ads: ^3.0.0' (or the latest version)
// to your pubspec.yaml file and run 'flutter pub get'.

// Custom logging function that only prints in debug mode
void log(String message) {
  if (kDebugMode) {
    print(message);
  }
}

// 2. Define a simple AdManager class to hold your Ad Unit IDs
// This makes it easy to switch between test and production IDs.
class AdManager {
  // Use test ad unit IDs for development.
  // DO NOT use these in production.
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String nativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // A variable to hold the banner ad instance.
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  // List of exams, now with more items for demonstration
  final List<String> exams = const [
    'AFCAT', 'CAT', 'CDS', 'CTET', 'GATE', 'IB-ACIO', 'IBPS Clerk', 'IBPS PO',
    'IBPS RRB', 'ISRO', 'JEE Main', 'NDA', 'NEET-UG', 'SBI PO', 'SSC CHSL',
    'SSC CGL', 'SSC GD Constable', 'State PSC', 'UGC NET', 'UPSC CAPF',
    'UPSC', 'UPSC ESE', 'UPSC EPFO', 'RBI Grade B', 'NABARD Grade A', 'SEBI Grade A',
    'RRB NTPC', 'RRB Group D', 'DFCCIL', 'LIC AAO', 'NIACL AO', 'IPPB Officer',
  ];

  // A new list to hold the sorted exams
  late final List<String> _sortedExams;

  // List to hold the loaded native ads
  final List<NativeAd> _nativeAds = [];
  final Set<int> _loadedAdIndexes = {};

  @override
  void initState() {
    super.initState();
    // Sort the exams list alphabetically
    _sortedExams = List.from(exams);
    _sortedExams.sort();

    _loadBannerAd();
    // Load the first few native ads
    for (int i = 0; i < (_sortedExams.length / 4) + 1; i++) {
      _loadNativeAd(i * 4 + 3);
    }
  }

  // Method to load the banner ad
  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          log('BannerAd failed to load: $err');
          setState(() {
            _isBannerAdLoaded = false;
          });
        },
        onAdClicked: (Ad ad) => log('Ad clicked.'),
        onAdImpression: (Ad ad) => log('Ad impression.'),
      ),
    )..load();
  }

  // Method to load a native ad for a specific index
  void _loadNativeAd(int index) {
    NativeAd(
      adUnitId: AdManager.nativeAdUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          log('Native ad loaded for index: $index');
          setState(() {
            _nativeAds.insert(index, ad as NativeAd);
            _loadedAdIndexes.add(index);
          });
        },
        onAdFailedToLoad: (ad, error) {
          log('Native ad failed to load: $error');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    for (final ad in _nativeAds) {
      ad.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total number of items to display in the list.
    // This includes the exam cards and the native ad placeholders.
    final int totalItems = _sortedExams.length + (_sortedExams.length ~/ 4);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exam Adda',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://placehold.co/100x100/FF0000/FFFFFF?text=User',
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0), // Added spacing between AppBar and the ad
          // Banner Ad at the top with a placeholder
          SafeArea(
            child: _isBannerAdLoaded
                ? SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  )
                : const BannerAdPlaceholder(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: totalItems,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  // Check if the current index is where an ad should be placed (every 4th item, starting from index 3)
                  if (index > 0 && (index + 1) % 5 == 0) {
                    // This is an ad position
                    final adIndex = (index ~/ 5) * 4;
                    if (_loadedAdIndexes.contains(adIndex)) {
                      // Native ad is loaded, show it.
                      return AdWidget(ad: _nativeAds.firstWhere((ad) => ad.adUnitId == AdManager.nativeAdUnitId));
                    } else {
                      // Ad is not loaded yet, show a placeholder.
                      return const NativeAdPlaceholder();
                    }
                  } else {
                    // This is an exam card position
                    final examIndex = index - (index ~/ 5);
                    return ExamCard(examName: _sortedExams[examIndex]);
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 16.0), // Added padding at the bottom of the screen
        ],
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.examName});

  final String examName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(examName: examName),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 40,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 8),
              Text(
                examName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A simple placeholder widget for the native ad
class NativeAdPlaceholder extends StatelessWidget {
  const NativeAdPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Ad Placeholder',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// A simple placeholder widget for the banner ad
class BannerAdPlaceholder extends StatelessWidget {
  const BannerAdPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 50,
      child: const Center(
        child: Text(
          'Banner Ad Placeholder',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
