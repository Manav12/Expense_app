import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransction extends StatefulWidget {
  final Function addnew;

  NewTransction(this.addnew);

  @override
  _NewTransctionState createState() => _NewTransctionState();
}

class _NewTransctionState extends State<NewTransction> {
  final titlecontrol = TextEditingController();
    DateTime date;
  final amounctcontrol = TextEditingController();

  void submitdata() {
    final enteredtitle = titlecontrol.text;
    final enteredamount = double.parse(amounctcontrol.text);

    if (enteredtitle == '' || enteredamount <= 0 || date == null) return;

    widget.addnew(
      enteredtitle,
      enteredamount,
      date,
    );

    Navigator.of(context).pop();
  }
  
  void getdate(){
  { showDatePicker(context: context, 
initialDate: DateTime.now(),
 firstDate: DateTime(2000), 
 lastDate: DateTime.now(),).then((value) {
   if(value==null){
     return;
   }
   setState(() {
          date=value;

   });   
 }); } 

  }
   
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titlecontrol,
                
                onSubmitted: (_) => submitdata(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amounctcontrol,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitdata(),
              ),
              Container(
                height: 80,
                child: Row(
                  children: [
                     Text( date == null ? 'No Date Choosen': DateFormat.yMMMEd().format(date) ),
                    FlatButton(
                      child: Text(
                        "Choose Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.purple),
                      ),
                      onPressed: getdate,),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  "Add New Transiction",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: submitdata,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
