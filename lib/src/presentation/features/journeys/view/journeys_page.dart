import 'package:flutter/material.dart';
import 'package:flutter_template/src/presentation/core/widgets/glass_app_bar.dart';
import 'package:flutter_template/src/presentation/features/journeys/widgets/journey_card.dart';

class JourneysPage extends StatefulWidget {
  const JourneysPage({super.key});

  @override
  State<JourneysPage> createState() => _JourneysPageState();
}

class _JourneysPageState extends State<JourneysPage> {
  final PageController _pageController = PageController(viewportFraction: 0.5);

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
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;
                  if (_pageController.position.haveDimensions) {
                    final double page = _pageController.page ?? 0;
                    scale = (1 - (page - index).abs() * 0.4).clamp(0.6, 1.0);
                  }
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: JourneyCard(index: index),
              );
            },
          ),
        ),
      ),
    );
  }
}
