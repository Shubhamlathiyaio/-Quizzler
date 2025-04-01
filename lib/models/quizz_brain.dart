import 'package:quizzler/models/quetion.dart';

class QuizzBrain {
  int _quetionNumber = 0;
  final List<Quetion> _quetions = [
    Quetion(quetion: "🌍 Is the Earth round?", answer: true),
    Quetion(quetion: "🔥 Can fire be cold?", answer: false),
    Quetion(quetion: "🐱 Do cats have nine lives?", answer: false),
    Quetion(quetion: "🚀 Have humans been to the Moon?", answer: true),
    Quetion(quetion: "🍕 Is pizza a vegetable?", answer: false),
    Quetion(quetion: "🤖 Can robots feel emotions?", answer: false),
    Quetion(quetion: "🎸 Is rock music awesome?", answer: true),
    Quetion(
        quetion: "🐘 Are elephants the largest land animals?", answer: true),
    Quetion(
        quetion: "💡 Did Thomas Edison invent the light bulb?", answer: true),
    Quetion(quetion: "🦄 Do unicorns exist in real life?", answer: false),
  ];

  void nextQuetion() => _quetionNumber < len - 1 ? _quetionNumber++ : _quetionNumber=0;
  String getQuetion() => _quetions[_quetionNumber].quetion;
  bool getAnswer() => _quetions[_quetionNumber].answer;
  int get len => _quetions.length;
  int get currentQuetionIndex => _quetionNumber;
}
