import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/gradient_scaffold.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_next_button.dart';
import 'section1/quiz_screen_no_1.dart';
import 'section1/quiz_screen_no_2.dart';
import 'section1/quiz_screen_no_3.dart';
import 'section1/quiz_screen_no_4.dart';
import 'section1/quiz_screen_no_5.dart';
import 'section1/quiz_screen_no_6.dart';
import 'section1/quiz_screen_no_7.dart';
import 'section1/quiz_screen_no_8.dart';
import 'section1/quiz_screen_no_9.dart';
import 'section1/quiz_screen_no_10.dart';
import 'section1/quiz_screen_no_11.dart';
import 'section1/quiz_screen_no_12.dart';
import 'section1/quiz_screen_no_13.dart';
import 'section1/quiz_screen_no_14.dart';
import 'section1/quiz_screen_no_15.dart';
import 'section2/quiz_splash_screen_02.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;

  int _selected6 = -1;
  int _selected7 = -1;
  int _selected8 = -1;
  int _selected9 = -1;
  int _selected10 = -1;
  int _selected11 = -1;
  int _selected12 = -1;
  int _selected13 = -1;
  final List<bool> _selected15 = [false, false, false, false, false];
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();
  final TextEditingController _controller14 = TextEditingController();

  List<Widget> get _quizScreens => [
    const QuizScreenNo1(),
    const QuizScreenNo2(),
    const QuizScreenNo3(),
    QuizScreenNo4(controller: _controller4),
    QuizScreenNo5(
      selected: _selected6,
      onChanged: (val) => setState(() => _selected6 = val),
    ),
    QuizScreenNo6(
      selected: _selected7,
      onChanged: (val) => setState(() => _selected7 = val),
    ),
    QuizScreenNo7(
      selected: _selected8,
      onChanged: (val) => setState(() => _selected8 = val),
    ),
    QuizScreenNo8(
      selected: _selected9,
      onChanged: (val) => setState(() => _selected9 = val),
    ),
    QuizScreenNo9(
      selected: _selected10,
      onChanged: (val) => setState(() => _selected10 = val),
    ),
    QuizScreenNo10(
      selected: _selected11,
      onChanged: (val) => setState(() => _selected11 = val),
    ),
    QuizScreenNo11(controller: _controller11),
    QuizScreenNo12(
      selected: _selected12,
      onChanged: (val) => setState(() => _selected12 = val),
    ),
    QuizScreenNo13(
      selected: _selected13,
      onChanged: (val) => setState(() => _selected13 = val),
    ),
    QuizScreenNo14(controller: _controller14),
    QuizScreenNo15(
      selected: _selected15,
      onChanged:
          (index) => setState(() => _selected15[index] = !_selected15[index]),
    ),
  ];

  void _goToNext() {
    if (_currentIndex < _quizScreens.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // Navigate to section 2 splash screen when quiz 15 is done
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const QuizSplashScreen02()),
      );
    }
    // Optionally handle quiz completion here
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
    _controller4.dispose();
    _controller11.dispose();
    _controller14.dispose();
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
