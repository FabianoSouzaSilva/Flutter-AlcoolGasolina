import 'package:flutter/material.dart';

import 'loading-button.widget.dart';

class Success extends StatelessWidget {
  final fontFamily = "Big Shoulders Display";
  var result = "";
  Function reset;

  Success({
    @required this.result, 
    @required this.reset
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
          LoadingButton(
            text: "Calcular Novamente",
            busy: false,
            invert: true,
            fun: reset,
          )
        ],
      ),
    );
  }
}
