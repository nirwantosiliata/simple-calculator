import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calkulator Sederhana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String screenText = '0';
  num result = 0;
  String lastOperator = '';

  void pressNumber(int number) {
    setState(() {
      if (screenText == '0') {
        screenText = '$number';
      } else {
        screenText = '$screenText$number';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Theme.of(context).primaryColorLight,
        title: const Text(
          'Calculator',
        ),
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColorLight,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  screenText,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            crossAxisCount: 4,
            shrinkWrap: true,
            children: <Widget>[
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () {
                  setState(() {
                    if (screenText.isNotEmpty) {
                      screenText = '0';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
                onTap: () {
                  setState(() {
                    if (screenText != '0' && screenText.isNotEmpty) {
                      if (screenText[0] == '-') {
                        screenText = screenText.substring(1);
                      } else {
                        screenText = '-$screenText';
                      }
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {
                  setState(() {
                    if (screenText != '0') {
                      num number1 = double.parse(screenText);
                      number1 /= 100;
                      screenText = number1.toString();
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  setState(() {
                    if (screenText == '0' ||
                        screenText == '' ||
                        screenText.length == 1) {
                      screenText = '0';
                    } else {
                      screenText =
                          screenText.substring(0, screenText.length - 1);
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
                onTap: () {
                  pressNumber(7);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
                onTap: () {
                  pressNumber(8);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
                onTap: () {
                  pressNumber(9);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '/',
                onTap: () {
                  setState(() {
                    result = num.parse(screenText);
                    screenText = '0';
                    lastOperator = '/';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
                onTap: () {
                  pressNumber(4);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
                onTap: () {
                  pressNumber(5);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
                onTap: () {
                  pressNumber(6);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'X',
                onTap: () {
                  setState(() {
                    result = num.parse(screenText);
                    screenText = '0';
                    lastOperator = 'x';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
                onTap: () {
                  pressNumber(1);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
                onTap: () {
                  pressNumber(2);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
                onTap: () {
                  pressNumber(3);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '-',
                onTap: () {
                  setState(() {
                    result += num.parse(screenText);
                    screenText = '0';
                    lastOperator = '-';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () {
                  pressNumber(0);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () {
                  setState(() {
                    if (!screenText.contains('.')) {
                      screenText += '.';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () {
                  setState(() {
                    switch (lastOperator) {
                      case '+':
                        result += num.parse(screenText);
                        break;
                      case '-':
                        result -= num.parse(screenText);
                        break;
                      case 'x':
                        result *= num.parse(screenText);
                        break;
                      case '/':
                        if (result != 0) {
                          result /= num.parse(screenText);
                        } else {
                          screenText = 'Error';
                          return;
                        }
                        break;
                    }
                    screenText = result.toString();
                    result = 0;
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+',
                onTap: () {
                  setState(() {
                    result += num.parse(screenText);
                    screenText = '0';
                    lastOperator = '+';
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final IconData? icon;
  final Function() onTap;

  const CalculatorButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: foregroundColor),
                  )
                : Icon(
                    icon,
                    color: foregroundColor,
                  ),
          ),
        ),
      ),
    );
  }
}
