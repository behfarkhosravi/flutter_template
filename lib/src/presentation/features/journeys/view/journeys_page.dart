import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/presentation/core/widgets/glass_app_bar.dart';

class JourneysPage extends StatefulWidget {
  const JourneysPage({super.key});

  @override
  State<JourneysPage> createState() => _JourneysPageState();
}

class _JourneysPageState extends State<JourneysPage> {
  final PageController _pageController = PageController(viewportFraction: 0.6);
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const GlassAppBar(),
      body: Center(
        child: SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 10,
            itemBuilder: (context, index) {
              final double scale =
                  (1 - (_currentPage - index).abs() * 0.3).clamp(0.8, 1.0);
              return Transform.scale(
                scale: scale,
                child: _buildJourneyCard(index),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildJourneyCard(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.airplanemode_active, size: 50),
              const SizedBox(height: 16),
              Text(
                'Journey ${index + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
