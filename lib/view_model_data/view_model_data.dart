import 'package:flutter/foundation.dart';

//Этот класс надо один раз создать и потом использовать
abstract class ViewModelData extends ChangeNotifier { //это общий верхний клас для для всех ViewModel

  ViewModelData(){
    initState();
  }

  void initState(){}

}