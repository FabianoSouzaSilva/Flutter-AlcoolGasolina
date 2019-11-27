import 'package:alcool/widgets/logo-widget.dart';
import 'package:alcool/widgets/submit-form.widget.dart';
import 'package:alcool/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar Álcool";
   var _color;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(         
          duration: Duration(microseconds: 1200),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(
                      reset: reset,
                      result: _resultText,
                    )
                  : SubmitForm(
                      busy: _busy,
                      submitFunc: calculate,
                      gasCtrl: _gasCtrl,
                      alcCtrl: _alcCtrl,
                    )
            ],
          ),
        ));
  }

  Future calculate(BuildContext context) {
    double alc = parseDouble(_alcCtrl.text) / 100;
    double gas = parseDouble(_gasCtrl.text) / 100;
    double res = alc / gas;
    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _color = Theme.of(context).accentColor;
        _resultText =
            "Compensa utilizar " + ((res >= 0.7) ? "Gasolina!" : "Álcool!");
        _busy = false;
        _completed = true;
      });
    });
  }

  reset(BuildContext context) {
    setState(() {
      _gasCtrl = new MoneyMaskedTextController();
      _alcCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color =Theme.of(context).primaryColor;
    });
  }

  double parseDouble(String value) {
    return double.parse(value.replaceAll(new RegExp(r'[,.]'), ''));
  }
}
