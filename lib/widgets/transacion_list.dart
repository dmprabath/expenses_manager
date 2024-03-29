import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;
  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transaction",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text("\$${transactions[index].amount}")),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        _deleteTransaction(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              // itemBuilder: (ctx, index) {
              //   return Card(
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //           margin: const EdgeInsets.symmetric(
              //             vertical: 10,
              //             horizontal: 15,
              //           ),
              //           padding: const EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           )),
              //           child: Text(
              //             '\$${transactions[index].amount.toStringAsFixed(2)}',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 20,
              //                 color: Theme.of(context).primaryColor),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(transactions[index].title,
              //                 style: Theme.of(context).textTheme.headline6),
              //             Text(
              //               DateFormat().format(transactions[index].date),
              //               style: const TextStyle(
              //                   fontSize: 16, color: Colors.grey),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   );
              // },
              itemCount: transactions.length),
    );
  }
}
