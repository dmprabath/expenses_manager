import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  late DateTime _selectedDate;
  bool isDateSelected = false;

  void _submitData() {
    final submittedTitle = _titleController.text;
    final submittedAmount = double.parse(_amountController.text);
    if (submittedTitle.isEmpty ||
        submittedAmount <= 0 ||
        isDateSelected == false) {
      return;
    }
    widget.addTx(
      submittedTitle,
      submittedAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
        isDateSelected = true;
        print(_selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(isDateSelected == false
                          ? "No Date Chosen"
                          : "Selected Date: ${DateFormat.yMd().format(_selectedDate)}"),
                    ),
                    FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text("Add Transaction"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                // textColor: Theme.of(context).textTheme.button.color,
              )
            ]),
      ),
    );
  }
}
