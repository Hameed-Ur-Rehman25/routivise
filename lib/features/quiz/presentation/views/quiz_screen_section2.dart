import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/gradient_scaffold.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_next_button.dart';
import 'section2/quiz_screen_no_16.dart';
import 'section2/quiz_screen_no_17.dart';
import 'section2/quiz_screen_no_18.dart';
import 'section2/quiz_screen_no_19.dart';
import 'section2/quiz_screen_no_20.dart';
import 'section2/quiz_screen_no_21.dart';
import 'section2/quiz_screen_no_22.dart';
import 'section2/quiz_screen_no_23.dart';
import 'section2/quiz_screen_no_24.dart';
import 'section3/quiz_splash_screen_03.dart';

class QuizScreenSection2 extends StatefulWidget {
  const QuizScreenSection2({super.key});

  @override
  State<QuizScreenSection2> createState() => _QuizScreenSection2State();
}

class _QuizScreenSection2State extends State<QuizScreenSection2> {
  int _currentIndex = 0;

  // Controllers for text inputs
  final TextEditingController _controller16 = TextEditingController();
  final TextEditingController _controller18 = TextEditingController();

  // Selection states
  int _selected17 = -1;
  int _selected20 = -1;
  int _selected22 = -1;
  int _selected23 = -1;
  int _selected24 = -1;
  final List<bool> _selected19 = [false, false, false, false];
  final List<bool> _selected21 = [false, false, false, false, false];

  List<Widget> get _quizScreens => [
    QuizScreenNo16(controller: _controller16),
    QuizScreenNo17(
      selected: _selected17,
      onChanged: (val) => setState(() => _selected17 = val),
    ),
    QuizScreenNo18(controller: _controller18),
    QuizScreenNo19(
      selected: _selected19,
      onChanged: (index) => setState(() => _selected19[index] = !_selected19[index]),
    ),
    QuizScreenNo20(
      selected: _selected20,
      onChanged: (val) => setState(() => _selected20 = val),
    ),
    QuizScreenNo21(
      selected: _selected21,
      onChanged: (index) => setState(() => _selected21[index] = !_selected21[index]),
    ),
    QuizScreenNo22(
      selected: _selected22,
      onChanged: (val) => setState(() => _selected22 = val),
    ),
    QuizScreenNo23(
      selected: _selected23,
      onChanged: (val) => setState(() => _selected23 = val),
    ),
    QuizScreenNo24(
      selected: _selected24,
      onChanged: (val) => setState(() => _selected24 = val),
    ),
  ];

  void _goToNext() {
    if (_currentIndex < _quizScreens.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // Navigate to section 3 splash screen when all section 2 questions are done
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const QuizSplashScreen03()),
      );
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  void dispose() {
    _controller16.dispose();
    _controller18.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_currentIndex > 0)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: TextButton(
                    onPressed: _goToPrevious,
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child:
                    _quizScreens.isNotEmpty
                        ? _quizScreens[_currentIndex]
                        : const SizedBox.shrink(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: CustomQuizNextButton(onPressed: _goToNext),
            ),
          ],
        ),
      ),
    );
  }
}
