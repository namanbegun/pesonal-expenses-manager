import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amounntController = TextEditingController();

  DateTime _selecctedDate=DateTime.now();

  void _submitdata() {
    if (_amounntController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amounntController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selecctedDate == null) {
      return;
    }

    widget.addtx(
      enteredTitle,
      enteredAmount,
      _selecctedDate,
    );
    Navigator.of(context).pop();
  }

  // void _presentDatePicker() {
  //   showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2019),
  //       lastDate: DateTime.now(),
  //       ).then((pickedDate) {
  //     if (pickedDate == null) {
  //       return;
  //     }
  //     setState(() {
  //       _selecctedDate = pickedDate;
  //     });
  //   });
  //   print('...');
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      // stylinging chart widegt
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitdata(),
              // onChanged: (val) {
              //   titleinput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amounntController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitdata(),
              // onChanged: (val) => amountinput = val,
            ),
            Flexible(child: 
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selecctedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selecctedDate)}',
                    ),
                  ),
    //               FlatButton(
    //                 textColor: Theme.of(context).primaryColor,
    //                 child: Text(
    //                   'Choose Date',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 onPressed: (){
    //                   showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2019),
    //     lastDate: DateTime.now(),
    //     ).then((pickedDate) {
    //   if (pickedDate == null) {
    //     return;
    //   }
    //   setState(() {
    //     _selecctedDate = pickedDate;
    //   });
    // });
    //                 },
    //               ),
                  // Text('No date chosen'),
                  // FlatButton(
                  //   textColor: Theme.of(context).primaryColor,
                  //   child: Text(
                  //     'Choose Date',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold),
                  //   ),
                  //   onPressed: _presentDatePicker,
                  // ),
                ],
              ),
            ),
            ),
            RaisedButton(
              child: Text('Add Transcation'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: _submitdata,
            ),
          ],
        ),
      ),
    );
  }
}
