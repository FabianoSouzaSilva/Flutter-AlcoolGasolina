import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var label = "";
  var ctrl = new MoneyMaskedTextController();
  final fontFamily = "Big Shoulders Display";

Input({
  @required this.label,
  @required this.ctrl,
});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: 100,
                child: Text(
                 label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: fontFamily,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  controller: ctrl,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      color: Colors.white,
                      fontSize: 45),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          );
  }
}
