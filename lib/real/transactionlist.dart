

import 'package:flutter/material.dart';
import '../models/transiction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transiction> transaction;
  final Function deletetranaction;
  TransactionList(this.transaction, this.deletetranaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No Data has been aded yet",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset('assests/waiting.png', fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 9,
                                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                                            child: FittedBox(
                                              child: Text(
                            '\$${transaction[index].amount}',
                            
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMEd().format(transaction[index].date),
                    ),
                    trailing: IconButton( icon: Icon(Icons.delete,color: Colors.red), onPressed: (){
                      deletetranaction(transaction[index].id);
                    }, 
                    ),
                  ),
                );
              },
            ),
    );
  }
}
