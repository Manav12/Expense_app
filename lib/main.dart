
import './real/New_transaction.dart';
import 'package:flutter/material.dart';
import './real/transactionlist.dart';
import './models/transiction.dart';
import './real/chart.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transiction> transaction = [
    // Transiction(
    //   id: DateTime.now().toString(),
    //   title: "Lol",
    //   amount: 10.9,
    //   date: DateTime.now(),

    // )
  ];


 List<Transiction> get recenttransaction{
   return transaction.where((element) {
     return element.date.isAfter(DateTime.now().subtract(Duration(days: 7),));
   }).toList();
 }

  void addnewtransaction(String title, double amount, DateTime choosen) {
    final newtx = Transiction(
        title: title,
        amount: amount,
        date: choosen,
        id: DateTime.now().toString());

    setState(() {
      transaction.add(newtx);
    });
  }

  void buttontransaction(BuildContext ctx) {
  
    showModalBottomSheet(
        context: ctx,
        builder: (_) {

          return  GestureDetector( child: NewTransction(addnewtransaction),
          onTap: (){},
          );
        });
    }
    void _deletetranaction(String id){
      setState(() {
        transaction.removeWhere((element)  {
         return element.id == id;
      });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              buttontransaction(context);
            },
          )
        ],
      ),
      body: 
      
      SingleChildScrollView(
        child: Column(
          children: [
            
           Chart(recenttransaction),
            TransactionList(transaction,_deletetranaction ),
            
          ],
        ),
        
      ),
      
        
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
              buttontransaction(context);
            },
      ),
    );
  }
}
