import 'package:flutter/material.dart';
import 'package:quizzler/commons/common_chip.dart';
import 'package:quizzler/commons/common_spacing.dart';
import 'package:quizzler/commons/common_text.dart';
import 'package:quizzler/models/quetion.dart';
import 'package:quizzler/resources/COLORS.dart';
import 'package:quizzler/resources/consts.dart';
import 'package:quizzler/resources/media_query_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [
    x,
    v,
  ];

  List<Quetion> quetions = [
    
  ];

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQueryHelper(context);
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
                    data: "This is the question.",
                    fontColor: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
              h50,
              customBotton("YES", Colors.green, () => {print("Green One")}),
              h12,
              customBotton("No", Colors.red, () => {print("Red One")}),
              h12,
              h10,
              scoreKeeper.isEmpty
                  ? h0
                  : CommonChip(
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
