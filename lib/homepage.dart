import 'package:flutter/material.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController(text: "");
  var operator = ' ';

  static double firstNumber = 0;
  static double secondNumber = 0;
  static double result = 0;
  static String history = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                darkMode = !darkMode;
                themeManager.toggleTheme(darkMode);
                setState(() {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: 100,
                decoration: BoxDecoration(
                    color: darkMode ? Colors.black : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: darkMode ? Colors.black12 : Colors.grey,
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                          color: darkMode ? Colors.black12 : Colors.white,
                          offset: const Offset(-2.0, -2.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0)
                    ],
                    borderRadius:
                        const BorderRadius.all(Radius.circular(40.0))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: darkMode ? Colors.grey : Colors.redAccent,
                      ),
                      Icon(
                        Icons.nightlight_round,
                        color: darkMode ? Colors.green : Colors.grey,
                      ),
                    ]),
              ),
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          history,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color:
                                  Theme.of(context).primaryColor.withAlpha(200),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    TextField(
                      showCursor: false,
                      enabled: false,
                      style: const TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w500),
                      controller: controller,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.end,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorBtn(
                    context: context,
                    title: 'AC',
                    onPressed: () {
                      firstNumber = 0;
                      secondNumber = 0;
                      result = 0;
                      controller.text = '';
                      history = '';
                      setState(() {});
                    },
                    btnColor: const Color(0xffff5959)),
                calculatorBtn(
                  context: context,
                  icon: const Icon(Icons.backspace_outlined),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      controller.text = controller.text
                          .substring(0, controller.text.length - 1);
                      history = history.substring(0, history.length - 1);
                      setState(() {});
                    }
                  },
                ),
                calculatorBtn(
                    context: context,
                    title: '%',
                    onPressed: () {
                      try {
                        firstNumber =
                            double.parse(controller.text.split(operator)[0]);
                        secondNumber =
                            double.parse(controller.text.split(operator)[1]);
                        result = firstNumber * (secondNumber / 100);
                        controller.text = result.toString();
                        setState(() {});
                        // ignore: empty_catches
                      } catch (e) {}
                      checkAndInsertOperator("%");
                    }),
                calculatorBtn(
                  context: context,
                  title: '÷',
                  onPressed: () {
                    try {
                      firstNumber =
                          double.parse(controller.text.split(operator)[0]);
                      secondNumber =
                          double.parse(controller.text.split(operator)[1]);
                      displayResult();
                      // ignore: empty_catches
                    } catch (e) {}
                    checkAndInsertOperator("÷");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorBtn(
                  context: context,
                  title: '7',
                  onPressed: () {
                    controller.text += "7";
                    history += "7";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '8',
                  onPressed: () {
                    controller.text += "8";
                    history += "8";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '9',
                  onPressed: () {
                    controller.text += "9";
                    history += "9";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: 'x',
                  onPressed: () {
                    try {
                      firstNumber =
                          double.parse(controller.text.split(operator)[0]);
                      secondNumber =
                          double.parse(controller.text.split(operator)[1]);
                      displayResult();
                      // ignore: empty_catches
                    } catch (e) {}
                    checkAndInsertOperator("x");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorBtn(
                  context: context,
                  title: '4',
                  onPressed: () {
                    controller.text += "4";
                    history += "4";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '5',
                  onPressed: () {
                    controller.text += "5";
                    history += "5";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '6',
                  onPressed: () {
                    controller.text += "6";
                    history += "6";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '-',
                  onPressed: () {
                    try {
                      firstNumber =
                          double.parse(controller.text.split(operator)[0]);
                      secondNumber =
                          double.parse(controller.text.split(operator)[1]);
                      displayResult();
                      // ignore: empty_catches
                    } catch (e) {}
                    checkAndInsertOperator("-");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorBtn(
                  context: context,
                  title: '1',
                  onPressed: () {
                    controller.text += "1";
                    history += "1";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '2',
                  onPressed: () {
                    controller.text += "2";
                    history += "2";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '3',
                  onPressed: () {
                    controller.text += "3";
                    history += "3";
                    setState(() {});
                  },
                ),
                calculatorBtn(
                  context: context,
                  title: '+',
                  onPressed: () {
                    try {
                      firstNumber =
                          double.parse(controller.text.split(operator)[0]);
                      secondNumber =
                          double.parse(controller.text.split(operator)[1]);
                      displayResult();
                      // ignore: empty_catches
                    } catch (e) {}
                    checkAndInsertOperator("+");
                  },
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              calculatorBtn(
                context: context,
                title: '0',
                onPressed: () {
                  controller.text += "0";
                  history += "0";
                  setState(() {});
                },
              ),
              calculatorBtn(
                context: context,
                title: '00',
                onPressed: () {
                  controller.text += "00";
                  history += "00";
                  setState(() {});
                },
              ),
              calculatorBtn(
                context: context,
                title: '.',
                onPressed: () {
                  controller.text += ".";
                  history += ".";
                  setState(() {});
                },
              ),
              calculatorBtn(
                  context: context,
                  title: '=',
                  onPressed: () {
                    try {
                      firstNumber =
                          double.parse(controller.text.split(operator)[0]);
                      secondNumber =
                          double.parse(controller.text.split(operator)[1]);
                      displayResult();
                      operator += "=";
                      history += "=";
                      history += result.toString();
                      setState(() {});
                      // ignore: empty_catches
                    } catch (e) {}
                  },
                  btnColor: const Color(0xff66ff7f)),
            ])
          ],
        )),
      ),
    );
  }

  checkAndInsertOperator(String operator) {
    for (int i = 0; i <= 9; i++) {
      if (controller.text.endsWith(i.toString())) {
        controller.text += operator;
        this.operator = operator;
        history += operator;
        setState(() {});
        return;
      }
    }
    controller.text = controller.text.substring(0, controller.text.length - 1);
    controller.text += operator;
    history = history.substring(0, history.length - 1);
    history += operator;
    setState(() {});
  }

  displayResult() {
    if (operator == "%") {
      result = firstNumber * secondNumber / 100;
    } else if (operator == '÷') {
      result = firstNumber / secondNumber;
    } else if (operator == 'x') {
      result = firstNumber * secondNumber;
    } else if (operator == '-') {
      result = firstNumber - secondNumber;
    } else if (operator == '+') {
      result = firstNumber + secondNumber;
    }
    controller.text = result.toString();
  }
}

Widget calculatorBtn({
  required context,
  String? title,
  Icon? icon,
  required Function() onPressed,
  Color? btnColor,
}) {
  Color titleColor = Theme.of(context).primaryColor;
  if (title == "+" ||
      title == "-" ||
      title == "x" ||
      title == "÷" ||
      title == "%") {
    titleColor = darkMode ? const Color(0xff66ff7f) : const Color(0xffff5959);
  }
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      margin: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        // ignore: prefer_if_null_operators
        color: btnColor != null
            ? btnColor
            : (darkMode ? const Color(0xFF343434) : const Color(0xfff0f0f0)),
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Center(
        child: title == null
            ? icon
            : Text(
                title,
                style: TextStyle(fontSize: 28.0, color: titleColor),
              ),
      ),
    ),
  );
}
