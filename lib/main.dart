import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // void startAddNewTransaction(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return NewTransaction(addTx);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Manager'),
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
            UserTransaction()
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
        onPressed: () => {},
      ),
    );
  }
}
