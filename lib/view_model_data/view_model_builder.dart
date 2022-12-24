import 'package:flutter/material.dart';
import 'package:view_model_test/view_model_data.test/view_model_data.dart';

//Этот класс надо один раз создать и потом использовать
class ViewModelBuilder <T extends ViewModelData>  //указываем тип, чтоб в разных классах применять - при создани экземпляра НАДО УКАЗАТЬ
    extends StatefulWidget {

  //1. Чтобы передать ViewModel для управления
  final T Function() createModelDataEx;  //чтобы создать экземплях с расширением ViewModelData
  //в виде функции для того чтобы передать аргументы для создания (как Widget ex() => Container())

  //2. Функция builder(context, modelData) - должен возвращать виджет
  final Widget Function(
      BuildContext context,
      T modelData,     //ViewModelData modelData - чтобы управлять данными этого билдера
                      //T содержит в себе ViewModelData, зато можно для разных классов применять
                     //modelData принимает тип, который будет указан при создании - ViewModelBuilder<ExampleModelData>
      ) builder;


  const ViewModelBuilder({
    Key? key,
    required this.builder,
    required this.createModelDataEx,
  }) : super(key: key);


  @override
  State<ViewModelBuilder> createState() => _ViewModelBuilderState<T>(); //надо указать тип, чтоб передать в state - класс с расширением ViewModelData
}

//Получится такое
// ViewModelBuilder<ExampleModelData>(
//     createModelDataEx: () => ExampleModelData(initValue: 100),
//     builder: (context, model) {return Scaffold(...)}
// )

class _ViewModelBuilderState<T extends ViewModelData>   //надо сюда передать T как ViewModelData, чтоб он знал, что T - не просто какой-то Object
    extends State<ViewModelBuilder<T>> {                //и тут надо указать тип T

  late T modelDataEx;

  @override
  void initState() {
    modelDataEx = widget.createModelDataEx();  //создали экзпемпляр с расширением ViewModelData

    //и теперь можем исп. его свойства
    modelDataEx.addListener(() {       //сработает при вызове notifyListener()
      setState(() {});                //т.к. этот stateFul класс оборачивает в себя детей, то он обновит их состояние
    });

    super.initState();
  }

  //В обзем, в ViewModel виджета указываем функцию.
  //И добавляем в конце notifyListeners - сработает setState() - и таким образом ребилднется вся страница

  @override
  Widget build(BuildContext context) {
    return widget.builder(                //builder это виджет
        context,
        modelDataEx                       //а это данные - класс с расширением ViewModelData
    );
  }
}
