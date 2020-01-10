import 'package:flutter/material.dart';
import 'package:busca_ao_tesouro/blocs/game_bloc.dart';
import 'package:provider/provider.dart';

class DecrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameBloc gameBloc = Provider.of<GameBloc>(context);
    return new FlatButton.icon( 
         icon: Icon(Icons.remove),
         label: Text('Retornar'),
         onPressed: () => gameBloc.decrement(),
    );
      
    
  }
}