import 'package:busca_ao_tesouro/blocs/game_bloc.dart';
import 'package:busca_ao_tesouro/widgets/decrement.dart';
import 'package:busca_ao_tesouro/widgets/increment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:flutter/scheduler.dart';

class ContentCard extends StatefulWidget {
  final String color;
  final Color altColor;
  final String title;
  final String subtitle;
  final String tip;

  ContentCard({this.color, this.title = "", this.tip, this.subtitle, this.altColor}) : super();

  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
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
    final GameBloc gameBloc = Provider.of<GameBloc>(context); 
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
            offset: Offset(-(scaleX - 1) / 2 * size.width, -(scaleY - 1) / 2 * size.height + offsetY),
            child: Image.asset('images/Bg-${widget.color}.png', fit: BoxFit.cover ),
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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset('images/Illustration-${widget.color}.png', 
                    fit: BoxFit.contain, 
                     ),
                  ),
                ),

                //Bottom content
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: _buildBottomContent(),
                  ),
                ),

                //Slider circles
                /*
                Container(height: 14, child: Image.asset('images/Slider-${widget.color}.png' )),
                */
                 
                Container( height: 50, 
                   child:     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: _buildCircleProgress( gameBloc.level ), 
                          
                      ),
                  
                ),
                 
        
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildCircleProgress( int level ){
    List<Widget> progresso;
    progresso = [];
    for ( var i = 0; i<18; i++ ){
       if ( level == i ){ 
          progresso.add( _buildCircle( Colors.black12 ) );
       }
       else if ( i > level ){
          progresso.add( _buildCircle( Colors.white24 ) );
       }
       else {
          progresso.add( _buildCircle( Colors.white70 ) );
       }
    }
    return progresso;
  }

  Widget _buildCircle( Color cor ){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container( width: 10.0,
            height: 10.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: cor,
              ),
            ),
    );
  }


  Widget _buildBottomContent() {
    final GameBloc gameBloc = Provider.of<GameBloc>(context); 
    return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.2, fontSize: 36.0, fontFamily: 'DMSerifDisplay', color: widget.altColor)),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(widget.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, fontFamily: 'OpenSans', color: widget.altColor )),
          ),
          widget.tip!=null?Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Dica',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300, fontFamily: 'OpenSans', color: widget.altColor )),
          ):Text(''),
          widget.tip!=null?Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.tip,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, fontFamily: 'OpenSans', color: widget.altColor )),
          ):Text(''),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            
            ),
            gameBloc.level<gameBloc.levelMax?IncrementButton():Text(''),
            gameBloc.level>0?DecrementButton():Text(''),
        ],
      ),
    );
  }
}
