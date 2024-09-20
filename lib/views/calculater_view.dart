import 'package:calc_app/constants.dart';
import 'package:calc_app/widgets/custom_calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculaterView extends StatefulWidget {
  const CalculaterView({super.key});

  @override
  State<CalculaterView> createState() => _CalculaterViewState();
}

class _CalculaterViewState extends State<CalculaterView> {
  String input = '';
  String output = '';

  void pressButton(String value) {
    if (value == 'C') {
      setState(() {
        input = '';
        output = '';
      });
    } else if (value == 'Del') {
      setState(() {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      });
    } else if (value == '/' ||
        value == '%' ||
        value == 'x' ||
        value == '+' ||
        value == '-') {
      if (input.endsWith('/') ||
          input.endsWith('%') ||
          input.endsWith('x') ||
          input.endsWith('-') ||
          input.endsWith('+')) {
        null;
      } else {
        setState(() {
          if (value == 'x') {
            input += '*';
          } else {
            input += value;
          }
        });
      }
    } else if (value == '=') {
      setState(() {
        if (input.isNotEmpty && !input.startsWith('/') ||
            !input.startsWith('%') ||
            !input.startsWith('x') ||
            !input.startsWith('-') ||
            !input.startsWith('+')) {
          input = '0$input';
          try {
            Expression exp = Parser().parse(input);
            double result = exp.evaluate(EvaluationType.REAL, ContextModel());
            output = result.toStringAsFixed(2);

            if (output == 'Infinity') {
              output = 'Divide by zero';
            }
            input = '';
          } catch (e) {
            output = 'error';
          }
        }
      });
    } else if (value == 'Ans') {
      setState(() {
        if (output.isNotEmpty &&
            output != 'error' &&
            output != 'Divide by zero') {
          input = output;
          output = '';
        }
      });
    } else {
      setState(() {
        if (value == '.') {
          // 5.3 + 3.2
          var listNumber = input.split(RegExp(r'[+\-*/%]')); // [5.3 , 3.2]
          var lastNumber = listNumber.isNotEmpty ? listNumber.last : ''; // 3.2
          if (lastNumber.contains('.')) {
            return; // last number contain .
          }
        }
        input += value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  child: Text(
                    input,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    output,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 48,
                      color: kResultColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCalcButton(
                calcBtn: 'C',
                txtColor: const Color(0xff343434),
                backgroundColor: kDeleteColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: 'Del',
                txtColor: const Color(0xff343434),
                backgroundColor: kDeleteColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '%',
                txtColor: kCalcColor,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '/',
                txtColor: kCalcColor,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCalcButton(
                calcBtn: '9',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '8',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '7',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: 'x',
                txtColor: kCalcColor,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCalcButton(
                calcBtn: '4',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '5',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '6',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '-',
                txtColor: kCalcColor,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCalcButton(
                calcBtn: '1',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '2',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '3',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '+',
                txtColor: kCalcColor,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCalcButton(
                calcBtn: 'Ans',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '0',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '.',
                txtColor: Colors.white,
                backgroundColor: kBackgroundColor,
                onTap: pressButton,
              ),
              CustomCalcButton(
                calcBtn: '=',
                txtColor: Colors.black,
                backgroundColor: kCalcColor,
                onTap: pressButton,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
