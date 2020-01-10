import 'package:flutter/material.dart';
import 'package:busca_ao_tesouro/models/fases_model.dart';

class GameBloc extends ChangeNotifier {
  int _level = 0;
  int get level => _level;

  String _codigosecreto = '';
  String get codigosecreto => _codigosecreto;
  
  bool _compvisivel = true;
  bool get compvisivel => _compvisivel;

  int get levelMin => 0;
  int get levelMax => 17;

  set level( int val ){
    _level = val;
    notifyListeners();
  }

  set codigosecreto( String val ){
    _codigosecreto = val;
    print( 'set codigo secreto $val' );
    notifyListeners();
  }

  set compvisivel( bool val ){
    _compvisivel = val;
    notifyListeners();
  }

  increment(){
    _level++;
    if ( _level > levelMax ){
      _level = levelMax;
    }
    // print('increment: $_level' );
    notifyListeners();
  }

  decrement(){
    _level--;
    if ( _level < 0  ){
      _level = 0;
    }
    // print('decrement: $_level' );
    notifyListeners();
  }

  unlock(int faseno){
    fases[faseno].unlocked = true;
    print('unlocked: $faseno' );
    notifyListeners();
  }


}