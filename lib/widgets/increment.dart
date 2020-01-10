import 'package:flutter/material.dart';
import 'package:busca_ao_tesouro/blocs/game_bloc.dart';
import 'package:provider/provider.dart';

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameBloc gameBloc = Provider.of<GameBloc>(context);
    return MaterialButton(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Avançar',
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: .8,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    )
              ),
            ),
            onPressed: () => gameBloc.increment(),
         
    );
      
    
  }
}