import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String displayText = '0'; 
  double num1 = 0; 
  double num2 = 0; 
  String operation = ''; 
  bool isSecondNum = false; 

  void buttonPressed(String text) {
    setState(() {
      if (text == 'C') {
        // Função para limpar 
        displayText = '0';
        num1 = 0;
        num2 = 0;
        operation = 'C';
        isSecondNum = false;
      } else if (text == '+' || text == '-' ||  text == '×' || text == '÷') {
        // Função para salvar e somar o número
        num1 = double.parse(displayText);
        operation = text;
        isSecondNum = true;
      } else if (text == '=') {
        // Função para realizar a soma e o resultado
        num2 = double.parse(displayText);
        if (operation == '+') {
          displayText = (num1 + num2).toString();
        } else if (operation == '-') {
          displayText = (num1 - num2).toString();
        } else if (operation == '×') {
          displayText = (num1 * num2).toString();
        } else if (operation == '÷') {
          displayText = (num1 / num2).toString();
        }
        isSecondNum = false;
      } else {
        // Função para adicionar números 
        if (isSecondNum) {
          displayText = text;
          isSecondNum = false;
        } else {
          displayText = displayText == '0' ? text : displayText + text;
        }
      }
    });
  }
  
  //  Função para ajuda a manter o código organizado 
  Widget buildButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          backgroundColor: color,
        ),
        onPressed: () => buttonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
  
  // Função para que calculadora seja fácil de usar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          Row(
            children: [
              
              buildButton('7', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('8', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('9', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('÷', Color.fromARGB(255, 157, 170, 160)),
            ],
          ),
          Row(
            children: [
              buildButton('4', Color.fromARGB(255, 255, 255, 255)),
              buildButton('5', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('6', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('×', Color.fromARGB(255, 157, 170, 160)),
            ],
          ),
          Row(
            children: [
              buildButton('1', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('2', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('3', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('-', const Color.fromARGB(255, 157, 170, 160)),
            ],
          ),
          Row(
            children: [
              buildButton('0', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('.', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('C', const Color.fromARGB(255, 255, 255, 255)),
              buildButton('+', Color.fromARGB(255, 157, 170, 160)),
            ],
          ),
          Row(
            children: [
              buildButton('=', Color.fromARGB(255, 0, 255, 55)),
            ],
          ),
        ],
      ),
    );
  }
}
