import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/gradient_scaffold.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_next_button.dart';
import 'quiz_completed_screen.dart';
import 'section3/quiz_screen_no_25.dart';
import 'section3/quiz_screen_no_26.dart';
import 'section3/quiz_screen_no_27.dart';
import 'section3/quiz_screen_no_28.dart';
import 'section3/quiz_screen_no_29.dart';
import 'section3/quiz_screen_no_30.dart';
import 'section3/quiz_screen_no_31.dart';
import 'section3/quiz_screen_no_32.dart';
import 'section3/quiz_screen_no_33.dart';

class QuizScreenSection3 extends StatefulWidget {
  const QuizScreenSection3({super.key});

  @override
  State<QuizScreenSection3> createState() => _QuizScreenSection3State();
}

class _QuizScreenSection3State extends State<QuizScreenSection3> {
  int _currentIndex = 0;

  // Controllers for text inputs
  final TextEditingController _controller25 = TextEditingController();
  final TextEditingController _controller26 = TextEditingController();

  // Selection states
  int _selected29 = -1;
  int _selected30 = -1;
  int _selected31 = -1;
  int _selected32 = -1;
  int _selected33 = -1;
  final List<bool> _selected27 = [false, false, false, false];
  final List<bool> _selected28 = [false, false, false, false];

  List<Widget> get _quizScreens => [
    QuizScreenNo25(controller: _controller25),
    QuizScreenNo26(controller: _controller26),
    QuizScreenNo27(
      selected: _selected27,
      onChanged: (index) => setState(() => _selected27[index] = !_selected27[index]),
    ),
    QuizScreenNo28(
      selected: _selected28,
      onChanged: (index) => setState(() => _selected28[index] = !_selected28[index]),
    ),
    QuizScreenNo29(
      selected: _selected29,
      onChanged: (val) => setState(() => _selected29 = val),
    ),
    QuizScreenNo30(
      selected: _selected30,
      onChanged: (val) => setState(() => _selected30 = val),
    ),
    QuizScreenNo31(
      selected: _selected31,
      onChanged: (val) => setState(() => _selected31 = val),
    ),
    QuizScreenNo32(
      selected: _selected32,
      onChanged: (val) => setState(() => _selected32 = val),
    ),
    QuizScreenNo33(
      selected: _selected33,
      onChanged: (val) => setState(() => _selected33 = val),
    ),
  ];

  void _goToNext() {
    if (_currentIndex < _quizScreens.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // Navigate to quiz completion screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const QuizCompletedScreen()),
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
    _controller25.dispose();
    _controller26.dispose();
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
