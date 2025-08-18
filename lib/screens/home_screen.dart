import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:exam_prep_adda/screens/profile_screen.dart';
import 'package:exam_prep_adda/screens/exam_detail_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:async'; // For Timer
import 'dart:math'; // For the flip animation

// Import the new hourly questions data file
import 'package:exam_prep_adda/data/question_hour.dart';
// Import the app theme file to access the new background
import 'package:exam_prep_adda/utils/app_theme.dart';

// Custom logging function that only prints in debug mode
void log(String message) {
  if (kDebugMode) {
    print(message);
  }
}

// AdManager class to hold your Ad Unit IDs
class AdManager {
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String nativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  final List<String> exams = const [
    'AFCAT', 'BSF Constable', 'CAT', 'CDS', 'CRPF Constable', 'CTET', 'GATE', 'IAF (Group X & Y)', 'IB-ACIO', 
    'IBPS Clerk', 'IBPS PO', 'IBPS RRB', 'Indian Navy Sailor (SSR & AA)', 'ISRO', 'JEE Mains', 'NDA', 
    'NEET-UG', 'SBI Clerk', 'SBI PO', 'SSC CHSL', 'SSC CGL', 'SSC GD Constable', 'SSC Stenographer', 
    'UGC NET', 'UPSC CAPF', 'UPSC', 'UPSC ESE', 'RBI Grade B', 'RRB NTPC', 'RRB Group D', 'LIC AAO', 
    'IPPB Officer', 'UPPSC', 'BPSC', 'MPPSC', 'HPSC', 'GPSC', 'RPSC', 'MPSC',
  ];

  late final List<String> _sortedExams;
  final List<NativeAd> _nativeAds = [];
  final Set<int> _loadedAdIndexes = {};

  // Animation controllers
  late AnimationController _dialogAnimationController;
  late Animation<double> _scaleAnimation;
  late AnimationController _pulsingAnimationController;
  late AnimationController _gridAnimationController; // For staggered grid

  // State for the Hourly Challenge
  Question? _questionOfTheHour;
  Timer? _countdownTimer;
  Duration _timeUntilNextQuestion = Duration.zero;

  @override
  void initState() {
    super.initState();
    _sortedExams = List.from(exams)..sort();

    _loadBannerAd();
    for (int i = 0; i < (_sortedExams.length / 4) + 1; i++) {
      _loadNativeAd(i * 4 + 3);
    }

    _initializeAnimations();
    _loadQuestionOfTheHour();
    _startCountdown();

    // Show the dialog and start grid animation after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _showUpdateDialog();
        _gridAnimationController.forward();
      }
    });
  }

  void _initializeAnimations() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _dialogAnimationController,
      curve: Curves.easeOutBack,
    );

    _pulsingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _gridAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  void _loadQuestionOfTheHour() {
    if (mounted) {
      setState(() {
        _questionOfTheHour = getQuestionOfTheHour();
      });
    }
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      int currentHour = now.hour;
      DateTime nextQuestionTime;

      if (currentHour >= 23 || currentHour < 6) {
        // If it's 11 PM or later, or before 6 AM, the next question is at 6 AM tomorrow.
        DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
        nextQuestionTime = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 6, 0, 0);
      } else {
        // Otherwise, the next question is at the start of the next hour.
        nextQuestionTime = DateTime(now.year, now.month, now.day, currentHour + 1, 0, 0);
      }

      final remaining = nextQuestionTime.difference(now);

      if (mounted) {
        setState(() {
          _timeUntilNextQuestion = remaining;
        });
      }

      // Check if it's time for a new question
      if (remaining.isNegative || remaining.inSeconds == 0) {
        _loadQuestionOfTheHour();
      }
    });
  }

  void _showUpdateDialog() {
    _dialogAnimationController.forward(from: 0.0);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Center(
                child: AnimatedBuilder(
                  animation: _pulsingAnimationController,
                  builder: (context, child) {
                    final scale =
                        1.0 + (_pulsingAnimationController.value * 0.05);
                    return Transform.scale(
                      scale: scale,
                      child: child,
                    );
                  },
                  child: SizedBox(
                    width: 350,
                    height: 250,
                    child: CustomPaint(
                      painter: ComicCloudPainter(),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: Colors.orangeAccent,
                              size: 40,
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 55.0),
                              child: Text(
                                'New Questions and Practice Sets every Sunday!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
      ),
    )..load();
  }

  void _loadNativeAd(int index) {
    NativeAd(
      adUnitId: AdManager.nativeAdUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          log('Native ad loaded for index: $index');
          if (mounted) {
            setState(() {
              _nativeAds.add(ad as NativeAd);
              _loadedAdIndexes.add(index);
            });
          }
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
    _dialogAnimationController.dispose();
    _pulsingAnimationController.dispose();
    _gridAnimationController.dispose();
    _countdownTimer?.cancel(); // Cancel the countdown timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: AppBackground(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  if (_questionOfTheHour != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HourlyChallengeCard(
                        question: _questionOfTheHour!,
                        timeUntilNext: _timeUntilNextQuestion,
                      ),
                    ),
                  const SizedBox(height: 16.0),
                  SafeArea(
                    child: _isBannerAdLoaded
                        ? SizedBox(
                            width: _bannerAd!.size.width.toDouble(),
                            height: _bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd!),
                          )
                        : const BannerAdPlaceholder(),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Text(
                      'Choose Your Exam',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Staggered Animation Logic
                    final animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _gridAnimationController,
                        curve: Interval(
                          (1 / totalItems) * index,
                          1.0,
                          curve: Curves.easeOut,
                        ),
                      ),
                    );

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(animation),
                        child: (index > 0 && (index + 1) % 5 == 0)
                            ? _buildAdCard(index)
                            : _buildExamCard(index),
                      ),
                    );
                  },
                  childCount: totalItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdCard(int index) {
    final adIndex = index - (index ~/ 5);
    final nativeAd =
        _nativeAds.length > (adIndex ~/ 4) ? _nativeAds[adIndex ~/ 4] : null;
    return nativeAd != null
        ? AdWidget(ad: nativeAd)
        : const NativeAdPlaceholder();
  }

  Widget _buildExamCard(int index) {
    final examIndex = index - (index ~/ 5);
    return ExamCard(examName: _sortedExams[examIndex]);
  }
}

// A custom painter that draws a comic-book style explosion cloud.
class ComicCloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.025 // Responsive stroke width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    _drawMainCloud(canvas, size, fillPaint, strokePaint);
    _drawSmallClouds(canvas, size, fillPaint, strokePaint);
    _drawMotionLines(canvas, size, strokePaint);
  }

  void _drawMainCloud(
      Canvas canvas, Size size, Paint fillPaint, Paint strokePaint) {
    final Path path = Path();
    path.moveTo(size.width * 0.15, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.2,
        size.width * 0.3, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.1,
        size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15,
        size.width * 0.85, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.5,
        size.width * 0.8, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.9,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.9,
        size.width * 0.15, size.height * 0.5);
    path.close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  void _drawSmallClouds(
      Canvas canvas, Size size, Paint fillPaint, Paint strokePaint) {
    _drawPoof(canvas, size, fillPaint, strokePaint,
        Offset(size.width * 0.1, size.height * 0.15), 0.15);
    _drawPoof(canvas, size, fillPaint, strokePaint,
        Offset(size.width * 0.85, size.height * 0.1), 0.2);
    _drawPoof(canvas, size, fillPaint, strokePaint,
        Offset(size.width * 0.15, size.height * 0.85), 0.18);
    _drawPoof(canvas, size, fillPaint, strokePaint,
        Offset(size.width * 0.8, size.height * 0.9), 0.22);
    _drawPoof(canvas, size, fillPaint, strokePaint,
        Offset(size.width * 0.2, size.height * 0.1), 0.08);
  }

  void _drawPoof(Canvas canvas, Size size, Paint fillPaint, Paint strokePaint,
      Offset center, double scale) {
    final Path path = Path();
    final double r = size.width * scale;
    path.moveTo(center.dx, center.dy - r * 0.5);
    path.quadraticBezierTo(center.dx - r * 0.8, center.dy - r * 0.8,
        center.dx - r, center.dy);
    path.quadraticBezierTo(center.dx - r * 0.5, center.dy + r * 0.8,
        center.dx, center.dy + r * 0.5);
    path.quadraticBezierTo(center.dx + r * 0.6, center.dy + r * 0.9,
        center.dx + r * 0.8, center.dy);
    path.quadraticBezierTo(
        center.dx + r * 0.8, center.dy - r * 0.8, center.dx, center.dy - r * 0.5);
    path.close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  void _drawMotionLines(Canvas canvas, Size size, Paint strokePaint) {
    _drawMotionLineGroup(canvas, size, strokePaint,
        Offset(size.width * 0.12, size.height * 0.17), -2.2, 0.08);
    _drawMotionLineGroup(canvas, size, strokePaint,
        Offset(size.width * 0.83, size.height * 0.12), -0.8, 0.1);
    _drawMotionLineGroup(canvas, size, strokePaint,
        Offset(size.width * 0.17, size.height * 0.83), 2.2, 0.1);
    _drawMotionLineGroup(canvas, size, strokePaint,
        Offset(size.width * 0.78, size.height * 0.88), 0.8, 0.12);
    _drawMotionLineGroup(canvas, size, strokePaint,
        Offset(size.width * 0.3, size.height * 0.25), -1.2, 0.05);
    _drawMotionLineGroup(canvas, size, strokePaint,
        Offset(size.width * 0.7, size.height * 0.2), -0.4, 0.06);
  }

  void _drawMotionLineGroup(Canvas canvas, Size size, Paint paint,
      Offset origin, double angle, double length) {
    final double l = size.width * length;
    canvas.save();
    canvas.translate(origin.dx, origin.dy);
    canvas.rotate(angle);
    canvas.drawLine(const Offset(0, 0), Offset(l, 0), paint);
    canvas.drawLine(Offset(l * 0.2, -l * 0.2), Offset(l, -l * 0.2),
        paint..strokeWidth = paint.strokeWidth * 0.8);
    canvas.drawLine(Offset(l * 0.2, l * 0.2), Offset(l, l * 0.2),
        paint..strokeWidth = paint.strokeWidth * 0.8);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Converted ExamCard to a StatefulWidget for animations
class ExamCard extends StatefulWidget {
  const ExamCard({super.key, required this.examName});

  final String examName;

  @override
  State<ExamCard> createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse().then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExamDetailScreen(examName: widget.examName),
        ),
      );
    });
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
                  widget.examName,
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
      ),
    );
  }
}

// New Widget for the Hourly Challenge Card
class HourlyChallengeCard extends StatefulWidget {
  final Question question;
  final Duration timeUntilNext;

  const HourlyChallengeCard(
      {super.key, required this.question, required this.timeUntilNext});

  @override
  State<HourlyChallengeCard> createState() => _HourlyChallengeCardState();
}

class _HourlyChallengeCardState extends State<HourlyChallengeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFlipped = false;
  int? _selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant HourlyChallengeCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the question changes, reset the card to the front face
    if (widget.question.questionText != oldWidget.question.questionText) {
      if (_isFlipped) {
        _controller.reverse();
      }
      setState(() {
        _isFlipped = false;
        _selectedOptionIndex = null;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_selectedOptionIndex != null && !_isFlipped) {
          _flipCard();
        } else if (_isFlipped) {
          _flipCard();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * -pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);
          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: _controller.value >= 0.5
                ? _buildCardFace(isFront: false)
                : _buildCardFace(isFront: true),
          );
        },
      ),
    );
  }

  Widget _buildCardFace({required bool isFront}) {
    final transform =
        isFront ? Matrix4.identity() : (Matrix4.identity()..rotateY(pi));
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: isFront
                  ? [Colors.blue.shade200, Colors.blue.shade400]
                  : (_selectedOptionIndex == widget.question.correctAnswerIndex
                      ? [Colors.green.shade200, Colors.green.shade400]
                      : [Colors.red.shade200, Colors.red.shade400]),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isFront ? _buildFront() : _buildBack(),
        ),
      ),
    );
  }

  Widget _buildFront() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Question of the Hour",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Next in:",
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
                Text(
                  _formatDuration(widget.timeUntilNext),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          widget.question.questionText,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 12),
        ...widget.question.options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: InkWell(
              onTap: () {
                if (!_isFlipped) {
                  setState(() {
                    _selectedOptionIndex = index;
                  });
                  // Automatically flip after a short delay
                  Future.delayed(
                      const Duration(milliseconds: 300), _flipCard);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _selectedOptionIndex == index
                      ? Colors.white.withAlpha(128) // 50% opacity
                      : Colors.white.withAlpha(51), // 20% opacity
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}. ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(option,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBack() {
    final bool isCorrect =
        _selectedOptionIndex == widget.question.correctAnswerIndex;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined,
          color: Colors.white,
          size: 40,
        ),
        const SizedBox(height: 8),
        Text(
          isCorrect ? 'Correct!' : 'Incorrect',
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 12),
        const Text(
          "Explanation:",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          widget.question.explanation,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          'Tap to flip back',
          style: TextStyle(color: Colors.white.withAlpha(179), fontSize: 12),
        ),
      ],
    );
  }
}

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
