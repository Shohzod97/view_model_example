import 'package:view_model_test/view_model_data.test/view_model_data.dart';

class ExampleModelData extends ViewModelData{

  final int initValue;
  ExampleModelData({required this.initValue}){
    _count = initValue;
  }


  int _count = 0;
  int get getCount => _count;

  void increment(){
    _count++;
    notifyListeners();      //надо добавить addListener, чтобы это срабатывало
                            //добавить надо в ViewModelBuilder в initState
  }

}