import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProgramSection extends StatefulWidget {
  const ProgramSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProgramSectionState createState() => _ProgramSectionState();
}

class _ProgramSectionState extends State<ProgramSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _startAnimation() {
    if (!_isVisible) {
      setState(() {
        _isVisible = true;
      });
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Remove or reduce this container's height to remove the large gap
        Container(
          color: Colors.black,
        ),
        VisibilityDetector(
          key: const Key('program-section'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.1) {
              _startAnimation();
            }
          },
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Stack(
              children: [
                if (_isVisible)
                  Container(
                    width: double.infinity,
                    height: 500, // Adjust this height based on your content
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black, // Bottom color
                          Colors.black, // Bottom color
                        ],
                      ),
                    ),
                  ),
                Column(
                  children: [
                    const SizedBox(
                      height: 29,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Our Programs',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                            height:
                                4), // Space between the text and the underline
                        Container(
                          height: 4, // Thickness of the underline
                          width: 150, // Length of the underline
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Your program cards go here
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProgramCard(
                          title: 'Fat Burnout',
                          description:
                              'An intensive program for burning fat effectively.',
                          titleColor: Colors.yellow,
                          imagePath: 'assets/bulking_bear.png',
                        ),
                        ProgramCard(
                          title: 'Cutting Leopard',
                          description:
                              'A cutting program designed to get you lean.',
                          titleColor: Colors.yellow,
                          imagePath: 'assets/cutting_leopard.png',
                        ),
                        ProgramCard(
                          title: 'Bulking Bear',
                          description:
                              'A bulking program for building serious muscle.',
                          titleColor: Colors.yellow,
                          imagePath: 'assets/bulking_bear.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProgramCard extends StatefulWidget {
  final String title;
  final String description;
  final Color titleColor;
  final String imagePath;

  const ProgramCard({
    super.key,
    required this.title,
    required this.description,
    required this.titleColor,
    required this.imagePath,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProgramCardState createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  bool _isHovered = false;

  void _onHover(PointerEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width *
            0.25, // Increased width for the cards
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Circular edges
          boxShadow: _isHovered
              ? [
                  const BoxShadow(
                    color: Color.fromARGB(255, 236, 235, 235),
                    offset: Offset(0, 4), // More balanced shadow offset
                    blurRadius: 24, // Increased blur for a softer shadow
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color.fromARGB(255, 254, 254, 254),
                    offset: Offset(0,
                        2), // Slightly smaller offset for the non-hover state
                    blurRadius: 6,
                  ),
                ],
        ),

        child: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12), // Apply same border radius here
              child: Image.asset(widget.imagePath, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black12,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: widget.titleColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    color: Colors.black12,
                    height: 20,
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
