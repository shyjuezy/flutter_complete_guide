import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(
      {@required this.userTransactions, @required Function this.deleteTx});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height * 0.5);
    return userTransactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 150,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : Column(
            children: userTransactions.map(
              (tx) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          '\$${tx.amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () {
                      print('Delete');
                      deleteTx(tx.id);
                    },
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).colorScheme.primary,
                //             width: 2,
                //           ),
                //         ),
                //         child: Text(
                //           '\$${tx.amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Theme.of(context).colorScheme.primary,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(tx.title,
                //               style: Theme.of(context).textTheme.subtitle1),
                //           Text(
                //             DateFormat.yMMMMEEEEd().format(tx.date),
                //             style: TextStyle(
                //               fontSize: 12,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                //   elevation: 5,
                // );
              },
            ).toList(),
          );
  }
}
