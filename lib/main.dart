// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_calculator_2/widgets/button.dart';

void main() {
  runApp(const RybakovCalcApp());
}

class RybakovCalcApp extends StatefulWidget {
  const RybakovCalcApp({super.key});

  @override
  _RybakovCalcAppState createState() => _RybakovCalcAppState();
}

class _RybakovCalcAppState extends State<RybakovCalcApp> {
  late int firstValue;
  late int secondValue;
  late String history = "";
  late String textToDisplay = "";
  late String result = "";
  late String operation;
  late String lastClick = "";

  void click(String click) {
    if (click == "AC") {
      textToDisplay = "";
      firstValue = 0;
      secondValue = 0;
      result = "";
      history = "";
      lastClick = "";
    } else if (result == "" && click == "+") {
      return;
    } else if (result == "" && click == "-") {
      return;
    } else if (result == "" && click == "X") {
      return;
    } else if (result == "" && click == "~/") {
      return;
    } else if (result == "" && click == "<") {
      return;
    } else if (result == "" && click == "=") {
      return;
    } else if (result == "" && click == "+/-") {
      return;
    } else if (lastClick == "=") {
      return;
    } else if (click == "+/-") {
      if (textToDisplay[0] != "-") {
        result = "-$textToDisplay";
      } else {
        result = textToDisplay.substring(1);
      }
    } else if (click == "<") {
      result = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (lastClick != "" && click == "+") {
      return;
    } else if (lastClick != "" && click == "-") {
      return;
    } else if (lastClick != "" && click == "X") {
      return;
    } else if (lastClick != "" && click == "~/") {
      return;
    } else if (click == "+" || click == "-" || click == "X" || click == "~/") {
      firstValue = int.parse(textToDisplay);
      result = "";
      operation = click;
      lastClick = click;
      history = firstValue.toString();
    } else if (click == "=") {
      secondValue = int.parse(textToDisplay);
      if (operation == "+") {
        result = (firstValue + secondValue).toString();
        history = (firstValue.toString() +
            operation.toString() +
            secondValue.toString());
        lastClick = "=";
      }
      if (operation == "-") {
        result = (firstValue - secondValue).toString();
        history = (firstValue.toString() +
            operation.toString() +
            secondValue.toString());
        lastClick = "=";
      }
      if (operation == "X") {
        result = (firstValue * secondValue).toString();
        history = (firstValue.toString() +
            operation.toString() +
            secondValue.toString());
        lastClick = "=";
      }
      if (operation == "~/" && secondValue != 0) {
        result = (firstValue ~/ secondValue).toString();
        history = (firstValue.toString() +
            operation.toString() +
            secondValue.toString());
        lastClick = "=";
      }
      if (operation == "~/" && secondValue == 0) {
        result = "error";
        history = (firstValue.toString() +
            operation.toString() +
            secondValue.toString());
        lastClick = "=";
      }
    } else {
      result = result + (click).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 41, 41, 41),
          centerTitle: true,
          title: const Text("Rybakov Calculator"),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: const TextStyle(fontSize: 32, color: Colors.grey),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0)),
            Container(
              // ignore: sort_child_properties_last
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Button(
                  text: "AC",
                  backgrColor: 0xFF9E9E9E,
                  callback: click,
                ),
                Button(
                  text: "+/-",
                  backgrColor: 0xFF9E9E9E,
                  callback: click,
                ),
                Button(
                  text: "<",
                  backgrColor: 0xFF9E9E9E,
                  callback: click,
                ),
                Button(
                  text: "~/",
                  backgrColor: 0xFFFFAB00,
                  callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Button(
                  text: "7",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "8",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "9",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "X",
                  backgrColor: 0xFFFFAB00,
                  callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Button(
                  text: "4",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "5",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "6",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "-",
                  backgrColor: 0xFFFFAB00,
                  callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Button(
                  text: "1",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "2",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "3",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "+",
                  backgrColor: 0xFFFFAB00,
                  callback: click,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Button(
                  text: "0",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "00",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "000",
                  backgrColor: 0xFF212121,
                  callback: click,
                ),
                Button(
                  text: "=",
                  backgrColor: 0xFFFFAB00,
                  callback: click,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
