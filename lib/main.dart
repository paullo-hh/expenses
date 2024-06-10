import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        value: 350.76,
        date: DateTime.now()),
    Transaction(
        id: '0002', title: 'Conta de luz', value: 150.50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expenses",
        ),
        backgroundColor: const Color.fromARGB(255, 69, 89, 204),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              child: const Card(
                color: Color.fromARGB(255, 69, 89, 204),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'If you are using Visual Studio Code, highlight your widget, click on the lightbulb, and select Wrap with Padding from the menu.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Center(
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Column(
                        // ignore: sort_child_properties_last
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color.fromARGB(255, 69, 89, 204)),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      Container(
                        width: 75,
                        height: 40,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(0, 49, 50, 53),
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('dd MMM').format(tr.date).toUpperCase(),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 117, 117, 117),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
