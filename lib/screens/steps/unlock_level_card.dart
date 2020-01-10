import 'package:busca_ao_tesouro/screens/steps/unlock_level_card_animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:busca_ao_tesouro/widgets/decrement.dart';
import 'package:busca_ao_tesouro/widgets/unlock.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class UnlockLevelCard extends StatefulWidget {
  final String color;
  final Color altColor;
  final String title;
  final String subtitle;
  int fasedesbloquear, faseanterior;

  UnlockLevelCard({this.color, this.fasedesbloquear, this.faseanterior, this.title = "", this.subtitle, this.altColor})
      : super();

  @override
  _UnlockLevelCard createState() => _UnlockLevelCard();
}

class _UnlockLevelCard extends State<UnlockLevelCard> {
  Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((d) {
      setState(() {});
    })
      ..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var time = DateTime.now().millisecondsSinceEpoch / 2000;
    var scaleX = 1.2 + sin(time) * .05;
    var scaleY = 1.2 + cos(time) * .07;
    var offsetY = 20 + cos(time) * 20;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        Transform(
          transform: Matrix4.diagonal3Values(scaleX, scaleY, 1),
          child: Transform.translate(
            offset: Offset(-(scaleX - 1) / 2 * size.width,
                -(scaleY - 1) / 2 * size.height + offsetY),
            child:
                Image.asset('images/Bg-${widget.color}.png', fit: BoxFit.cover),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                //Top Image
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: UnlockLevelCardAnimation( child: Image.asset(
                      'images/Illustration-${widget.color}.png',
                      fit: BoxFit.contain,
                    ), 
                    ),
                  ),
                ),

                //Slider circles
                //Container(height: 14, child: Image.asset('images/Slider-${widget.color}.png' )),

                //Bottom content
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: _buildBottomContent(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBottomContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.2,
                  fontSize: 30.0,
                  fontFamily: 'DMSerifDisplay',
                  color: Colors.black)),
          Text(widget.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'OpenSans',
                  color: Colors.black)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
          ),
          UnlockButton( fasedesbloquear: widget.fasedesbloquear,
                 faseanterior: widget.faseanterior ),
          DecrementButton(),
        ],
      ),
    );
  }


  
}
