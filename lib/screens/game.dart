import 'package:busca_ao_tesouro/models/fases_enum.dart';
import 'package:busca_ao_tesouro/models/fases_model.dart';
import 'package:busca_ao_tesouro/screens/steps/unlock_level_card.dart';
import 'package:flutter/material.dart';
import 'extras/content_card.dart';
import 'package:busca_ao_tesouro/blocs/game_bloc.dart';
import 'package:provider/provider.dart';
// Imagens from:
// <a href="https://pt.vecteezy.com/vetor-gratis/car">Vetores por Vecteezy</a>
//https://www.youtube.com/watch?v=8II1VPb-neQ

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final GameBloc gameBloc = Provider.of<GameBloc>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          gameBloc.level <= gameBloc.levelMin 
              ? _loadCard()
              : Container(),
          gameBloc.level >= 1 && gameBloc.level <= gameBloc.levelMax && fases[fase_model_index(null)].unlocked
              ? _loadCard()            
              : Container(),
          gameBloc.level >= 1 && gameBloc.level <= gameBloc.levelMax && !fases[fase_model_index(null)].unlocked
              ? UnlockLevelCard(
                      fasedesbloquear: fase_model_index(null),
                      faseanterior: fase_model_index( gameBloc.level-1 ),
                      color: 'Red',
                      title: "Desbloqueio",
                      subtitle: "Uauuu! Você está na fase ${gameBloc.level}!Id=${_sequencia()[ gameBloc.level ].index},Model=${fase_model_index(null)}")
              : Container(),     
          gameBloc.level > gameBloc.levelMax 
               ?_loadCard()
               :Container(),
           ],
      ),
    );
  }

  List<FaseE>_sequencia(){
    final GameBloc gameBloc = Provider.of<GameBloc>(context);    
    final List<FaseE>gameSequencia = new List.filled( gameBloc.levelMax+1, FaseE.inicial );
    gameSequencia[gameBloc.levelMin]=FaseE.inicial;
    
    gameSequencia[1]=FaseE.desafioTapaTapa;
    gameSequencia[2]=FaseE.desafioPistaria;
    gameSequencia[3]=FaseE.desafioPesoLivro;
    gameSequencia[4]=FaseE.desafioPlacas;
    gameSequencia[5]=FaseE.desafioAmor;
    gameSequencia[6]=FaseE.desafioIdadeAmigos;
    gameSequencia[7]=FaseE.desafioEnigmaMusicaRacionais;
    gameSequencia[8]=FaseE.desafioQuebraCabeca;
    gameSequencia[9]=FaseE.desafioBiblia;
    gameSequencia[10]=FaseE.desafioInformatica;
    gameSequencia[11]=FaseE.desafioMassaMolhoBranco;
    gameSequencia[12]=FaseE.desafioFogo;
    gameSequencia[13]=FaseE.desafioParaquedismo;
    gameSequencia[14]=FaseE.desafioDado;
    gameSequencia[15]=FaseE.desafioIdadeDosPais;
    gameSequencia[16]=FaseE.desafioDatasAvos;    
    gameSequencia[gameBloc.levelMax]=FaseE.faseFinal;
    return gameSequencia;
  }

  Widget _loadCard({ String color = 'White', Color altColor = Colors.black}) {
    final GameBloc gameBloc = Provider.of<GameBloc>(context);    
    final List<String>colorList= new List.filled(gameBloc.levelMax+1, 'White');
    final List<Color>altColorList=new List.filled(gameBloc.levelMax+1, Colors.white);
    
    int faseatualindex = 0;

    // Fase 
    colorList[ FaseE.inicial.index ]='Blue';
    altColorList[ FaseE.inicial.index ]=Colors.white54;
    // Fase 
    colorList[ FaseE.desafioTapaTapa.index ]='CurativoPurple';
    altColorList[ FaseE.desafioTapaTapa.index ]=Color.fromRGBO(229, 241, 143, 0.5 ); //fromRGBO(199, 124, 196, 0.7 );
    // Fase
    colorList[ FaseE.desafioPistaria.index ]='Pizzaria';
    altColorList[ FaseE.desafioPistaria.index ]=Colors.white60;
    // Fase 
    colorList[ FaseE.desafioIdadeDosPais.index ]='Pais';
    altColorList[ FaseE.desafioIdadeDosPais.index ]=Colors.blueGrey;
    // Fase 
    colorList[ FaseE.desafioIdadeAmigos.index ]='Amigos';
    altColorList[ FaseE.desafioIdadeAmigos.index ]=Colors.white30;
    // Fase
    colorList[ FaseE.desafioPesoLivro.index ]='Livros';
    altColorList[ FaseE.desafioPesoLivro.index ]=Colors.white70;
    // Fase
    colorList[ FaseE.desafioMassaMolhoBranco.index ]='MassaMolhoBranco';
    altColorList[ FaseE.desafioMassaMolhoBranco.index ]=Colors.black;
    // Fase 
    colorList[ FaseE.desafioDatasAvos.index ]='Avos';
    altColorList[ FaseE.desafioDatasAvos.index ]=Colors.black;
    // Fase
    colorList[ FaseE.desafioEnigmaMusicaRacionais.index ]='HipHop';
    altColorList[ FaseE.desafioEnigmaMusicaRacionais.index ]=Colors.white30;
    // Fase
    colorList[ FaseE.desafioBiblia.index ]='Biblia';
    altColorList[ FaseE.desafioBiblia.index ]=Colors.black;
    // Fase
    colorList[ FaseE.desafioQuebraCabeca.index ]='QuebraCabeca';
    altColorList[ FaseE.desafioQuebraCabeca.index ]=Colors.black54;
    // Fase
    colorList[ FaseE.desafioDado.index ]='Dado';
    altColorList[ FaseE.desafioDado.index ]=Colors.black;
    // Fase
    colorList[ FaseE.desafioParaquedismo.index ]='Paraquedismo';
    altColorList[ FaseE.desafioParaquedismo.index ]=Colors.black;
    // Fase
    colorList[ FaseE.desafioAmor.index ]='Amor';
    altColorList[ FaseE.desafioAmor.index ]=Colors.white54;
    // Fase
    colorList[ FaseE.desafioFogo.index ]='Fogo';
    altColorList[ FaseE.desafioFogo.index ]=Colors.white54;
    // Fase
    colorList[ FaseE.desafioPlacas.index ]='Kombi';
    altColorList[ FaseE.desafioPlacas.index ]=Colors.lightBlue;
    // Fase
    colorList[ FaseE.desafioInformatica.index ]='Informatica';
    altColorList[ FaseE.desafioInformatica.index ]=Colors.black87;
    // Fase
    colorList[ FaseE.faseFinal.index ]='White';
    altColorList[ FaseE.faseFinal.index ]=Colors.black;

    faseatualindex = fase_model_index(null);
     
    return ContentCard(
        color: colorList[_sequencia()[gameBloc.level].index],
        altColor: altColorList[_sequencia()[gameBloc.level].index],
        title: fases[faseatualindex].title,
        subtitle: fases[faseatualindex].message,
        tip: fases[faseatualindex].tip);
  }

/*  
 gameBloc.level é a seguencia normal, mas,
 tem que converter para saber de fato qual a 
 a fase do momento baseando-se na lista
 de sequencia, assim a lista pode ser ajustada
 conforme desejado e nada mais precisará ser 
 modificado.
*/  
    int fase_model_index( int fasedesejada ){
    final GameBloc gameBloc = Provider.of<GameBloc>(context);    
    if ( fasedesejada == null ){
        fasedesejada = gameBloc.level;
    }

    int faseatualindex =_sequencia()[fasedesejada].index;
    FaseE faseatual;
    //print( 'Fase gameBloc:' + fasedesejada.toString() );   
    //print( 'Fase na sequencia: ' + faseatualindex.toString() );
    faseatual = _sequencia()[fasedesejada];
    // Fase no model, pegar informacoes
    for (var i=0; i<18; ++i){
        if ( fases[ i ].id == faseatual ) { 
          faseatualindex = i; 
          break;
        }
    }
    //print( 'Fase no model: ' + faseatualindex.toString() );
    return faseatualindex;
  }


}
