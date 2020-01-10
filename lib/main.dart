import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:busca_ao_tesouro/screens/game.dart';
import 'package:busca_ao_tesouro/blocs/game_bloc.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
   runApp(App());
}

class App extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameBloc>(
      create: (BuildContext context) => GameBloc(),
      child: MaterialApp(
        title: "My App",
        home: new Home(title: 'Busca ao Tesouro'),
      ),
    );
     
  }
}
