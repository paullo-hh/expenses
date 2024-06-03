import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: '0001',
        title: 'Novo tênis de corrida',
        value: 350.00,
        date: DateTime.now()),
    Transaction(
        id: '0002', title: 'Conta de luz', value: 150.50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Controle de Despesas",
          ),
          backgroundColor: Color.fromARGB(255, 109, 0, 160),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                child: const Card(
                  color: Color.fromARGB(255, 109, 0, 160),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                        'If you are using Visual Studio Code, highlight your widget, click on the lightbulb, and select Wrap with Padding from the menu.'),
                  ),
                ),
              ),
              Column(
                children: _transactions.map((tr) {
                  return Card(
                    child: Text(tr.title),
                  );
                }).toList(),
              )
            ]));
  }
}
