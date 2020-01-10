import 'package:busca_ao_tesouro/models/fases_model.dart';
import 'package:flutter/material.dart';
import 'package:busca_ao_tesouro/blocs/game_bloc.dart';
import 'package:provider/provider.dart';

class UnlockButton extends StatelessWidget {
  int fasedesbloquear, faseanterior;
  UnlockButton( {this.fasedesbloquear, this.faseanterior});

  @override
  Widget build(BuildContext context) {
    final GameBloc gameBloc = Provider.of<GameBloc>(context);
    
    return Container(
        child: Column(
      children: <Widget>[
        gameBloc.compvisivel?Text('Digite o código secreto para prosseguir'):Container(),
        Padding(
          padding: const EdgeInsets.only( left: 30.0, top: 12, bottom: 12, right: 30.0 ),
          child: TextField(
            decoration: new InputDecoration(hintText: "",
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white10,
            ),
            keyboardType: TextInputType.number, 
            textAlign: TextAlign.center,
            style:
                new TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600, color: Colors.black),
            onTap: () => {
               gameBloc.compvisivel = false            
            },
            onChanged: (text) {
              gameBloc.codigosecreto = text;
              print("Data: $text - ${gameBloc.codigosecreto}");
            },
          ),
        ),
        MaterialButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text('Desbloquear & Avançar',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: .8,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
          onPressed: () {
            var senha = fases[faseanterior].password;
            //var senha = fases[fasedesbloquear].password;
            print(
                'Tentativa de desbloqueio: $senha - ${gameBloc.codigosecreto}');
            if (gameBloc.codigosecreto == senha ) {
              print('Senha correta, comandando desbloqueio fase='+fasedesbloquear.toString()+'-fase anterior:'+faseanterior.toString());
              gameBloc.unlock( fasedesbloquear );
              gameBloc.compvisivel = true;                    
            }
            else
            {
              print( 'Erro na senha, fase:'+fasedesbloquear.toString()+'-fase anterior:'+faseanterior.toString() );
            }
          },
        ),
      ],
    ));
  
  
     
  }
   
}
