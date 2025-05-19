import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/app/gradient_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _loaderController;
  late Animation<double> _fadeLogo;
  late Animation<double> _fadeLoader;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeLogo = CurvedAnimation(
      parent: _fadeController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    );
    _fadeLoader = CurvedAnimation(
      parent: _fadeController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
    );
    _fadeController.forward().whenComplete(() {
      _loaderController.forward();
    });
    _loaderController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _loaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: FadeTransition(
                opacity: _fadeLogo,
                child: SvgPicture.asset(
                  'assets/routivise_logo.svg',
                  width: 160,
                  height: 300,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeLoader,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 32.0,
                left: 32.0,
                right: 32.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.white,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: AnimatedBuilder(
                        animation: _loaderController,
                        builder: (context, child) {
                          return LinearProgressIndicator(
                            value: _loaderController.value,
                            minHeight: 50,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF1999F9),
                            ),
                            backgroundColor: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
