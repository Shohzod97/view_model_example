import 'package:flutter/material.dart';
import 'package:view_model_test/view_model_data.test/view_model_data.dart';

class ViewModelBuilder <T extends ViewModelData>  //указываем тип, чтоб в разных классах применять - при создани экземпляра НАДО УКАЗАТЬ
    extends StatefulWidget {

  final Widget Function(          //Widget - это то, что возврашает эта функция
      BuildContext context,
      // ViewModelData modelData  // чтобы управлять данными этого билдера
      T modelData,   //T содержит в себе ViewModelData, зато можно для разных классов применять
                     //modelData принимает тип, который будет указан при создании - ViewModelBuilder<ExampleModelData>
      ) builder;


  final T Function() createModelDataEx;  //чтобы создать экземплях с рашисрением ViewModelData
                                        //в виде функции для того чтобы передать аргументы для создания (как Widget ex() => Container())

  const ViewModelBuilder({
    Key? key,
    required this.builder,
    required this.createModelDataEx,
  }) : super(key: key);



  @override
  State<ViewModelBuilder> createState() => _ViewModelBuilderState<T>(); //надо указать тип, чтоб передать в state - класс с расширением ViewModelData
}

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



  @override
  Widget build(BuildContext context) {
    return widget.builder(                //builder это виджет
        context,
        modelDataEx                       //а это данные - класс с расширением ViewModelData
    );
  }
}
