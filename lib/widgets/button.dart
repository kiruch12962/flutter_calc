// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
final String text;
final int backgrColor;
final Function callback;

const Button({
  required this.text,
  required this.backgrColor, 
  required this.callback,
  
});
  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(backgrColor)),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(const Size(75, 75)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      )
                    ),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      onPressed: () => callback(text),
                    ),
    );
  }
}