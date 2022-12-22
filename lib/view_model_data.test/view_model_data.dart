import 'package:flutter/foundation.dart';

abstract class ViewModelData extends ChangeNotifier {  //это общий абстрактный класс

  ViewModelData(){
    initState();
  }

  void initState(){}

}