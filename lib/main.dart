import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transacion_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: "Quicksand",
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: "Open sans",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // late String titleInput;
  // late String amountInput;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1',
    //   title: "first",
    //   amount: 200.00,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: "second",
    //   amount: 300.00,
    //   date: DateTime.now(),
    // ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Manager'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Text(
                  "Expenses",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              elevation: 5,
            ),
            TransactionList(_userTransactions),
            // Card(
            //   color: Colors.red,
            //   child: Text("Second"),
            // )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
