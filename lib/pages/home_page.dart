import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzler/commons/common_chip.dart';
import 'package:quizzler/commons/common_icon_text.dart';
import 'package:quizzler/commons/common_spacing.dart';
import 'package:quizzler/commons/common_text.dart';
import 'package:quizzler/models/quizz_brain.dart';
import 'package:quizzler/resources/COLORS.dart';
import 'package:quizzler/resources/consts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizBrain = QuizzBrain();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];

  void reset(BuildContext context) {
    scoreKeeper = [];
    Navigator.pop(context);
    setState(() {});
  }

  Future<void> next(BuildContext context) async {
    quizBrain.nextQuetion();
    if (quizBrain.currentQuetionIndex == 0) {
      Alert(
        closeFunction: () => reset(context),
        image: FaIcon(
          FontAwesomeIcons.medal,
          color: Color(0xfff7cf00),
          size: 72,
        ),
        context: context,
        title: "Score: ${scoreKeeper.where(
              (e) => e == v,
            ).length} / ${quizBrain.len}",
        buttons: [
          DialogButton(
              color: Colors.green,
              child: CommonIconText(
                  icon: FaIcon(
                    FontAwesomeIcons.rotateLeft,
                    color: Colors.white,
                  ),
                  child: CommonText(
                    data: "Retry",
                    fontColor: Colors.white,
                    fontSize: 22,
                  )),
              onPressed: () => reset(context))
        ],
      ).show();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: CommonText(
            data: "Quizzler",
            fontSize: 24,
          )),
      backgroundColor: bg,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 2, child: w12),
              Expanded(
                flex: 4,
                child: Center(
                  child: CommonText(
                    data: quizBrain.getQuetion(),
                    textAlign: TextAlign.center,
                    fontColor: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
              h50,
              customBotton("YES", Colors.green, () {
                scoreKeeper.add(quizBrain.getAnswer() ? v : x);
                next(context);
              }),
              h12,
              customBotton("No", Colors.red, () {
                scoreKeeper.add(quizBrain.getAnswer() ? x : v);
                next(context);
              }),
              h12,
              h10,
              CommonChip(
                height: 50,
                radius: 5,
                child: Wrap(
                  children: scoreKeeper,
                ),
              ),
              h10,
            ],
          ),
        ),
      ),
    );
  }

  Widget customBotton(String s, Color color, Function onTab) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTab(),
        child: CommonChip(
          alignment: Alignment.center,
          backgroundColor: color,
          child: CommonText(
            data: s,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            fontColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
