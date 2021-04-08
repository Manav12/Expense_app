

import 'package:flutter/material.dart';

class Bars extends StatelessWidget {
  final String days;
  final double amount;
  final double totolspend;

  Bars(this.days, this.amount, this.totolspend);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${amount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
            height: 60,
            width: 20,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: totolspend,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 4,
        ),
        Text(days),
      ],
    );
  }
}
