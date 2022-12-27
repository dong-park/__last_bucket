import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {

  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text('대화형 입력'),
              ],
            ),
            renderQuestion(),
          ],
        ),
      ),
    );
  }

  Widget renderQuestion() {
    if(questionIndex == 0) {
      return _FirstQuestion(onNext: () => setState(() {
        questionIndex = 1;
      }),);
    } else if(questionIndex == 1){
      return _SecondQuestion(onNext: () => setState(() {
        questionIndex = 2;
      }),);
    } else if (questionIndex == 2) {
      return _ThirdQuestion(onNext: () => setState(() {
        questionIndex = 3;
      }),);
    } else {
      return Container();
    }
  }
}

abstract class _Question extends StatelessWidget {
  final String question;

  const _Question({Key? key, required this.onNext, required this.question}) : super(key: key);

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getQuestion(),
          renderAnswer(),
        ],
      ),
    );
  }

  final TextStyle textStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  Widget getQuestion() {
    return Text(question, style: textStyle,);
  }

  Widget renderAnswer();
}

class _FirstQuestion extends _Question {
  const _FirstQuestion({Key? key, required VoidCallback onNext}) : super(key: key, onNext: onNext, question: '첫번째 질문');

  @override
  Widget renderAnswer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('새로운 루틴 추가!'),
        Text('당신을 응원합니다.'),
        // input text box
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // button
          ],
        ),
      ],
    );
  }
}

class _SecondQuestion extends _Question {
  const _SecondQuestion({Key? key, required VoidCallback onNext}) : super(key: key, onNext: onNext, question: '두번째 질문');

  @override
  Widget renderAnswer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // emogi list flexsible area
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('😀', style: TextStyle(fontSize: 50),),
            const Text('😀', style: TextStyle(fontSize: 50),),
            const Text('😀', style: TextStyle(fontSize: 50),),
            const Text('😀', style: TextStyle(fontSize: 50),),
            const Text('😀', style: TextStyle(fontSize: 50),),
          ],
        ),
      ],
    );
  }
}

class _ThirdQuestion extends _Question {
  const _ThirdQuestion({Key? key, required VoidCallback onNext}) : super(key: key, onNext: onNext, question: '세번째 질문');

  @override
  Widget renderAnswer() {
    return Container(

    );
  }
}
