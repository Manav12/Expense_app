

import 'package:expense_application/models/transiction.dart';
import 'package:expense_application/real/bars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Chart extends StatelessWidget {
   final List<Transiction> recenttrasnsaction;

   Chart(this.recenttrasnsaction);
   
  List<Map<String, Object>> get groupedvalues {
    return List.generate(
      7,
      (index) {
       
       final weekday = DateTime.now().subtract(Duration(days: index));
       var sum = 0.0;
       for(var i =0; i<recenttrasnsaction.length;i++)
       {
         if(recenttrasnsaction[i].date.day == weekday.day && recenttrasnsaction[i].date.year == weekday.year ){
              sum+= recenttrasnsaction[i].amount;
         }
       }
      print(DateFormat.E().format(weekday));
      print(sum);

        return {
       'Day': DateFormat.E().format(weekday).substring(0,1), 'Amount': sum,
        };
      },
    ).reversed.toList();
}

double get totalspend{
return  groupedvalues.fold(0.0, (previousValue, item) {
      return previousValue + item['Amount'];
  });
}

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedvalues.map((e){
            return Flexible(
              fit: FlexFit.tight,
                        child: Bars(e["Day"], e["Amount"], totalspend == 0 ? 0 :  (e["Amount"] as double) / totalspend
),
            );
          }).toList(),
        ),
      ),
    );
  }
}
