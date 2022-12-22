import 'package:flutter/material.dart';
import 'package:view_model_test/example_widget/example_model_data.dart';
import 'package:view_model_test/view_model_data.test/view_model_builder.dart';

class ExampleModelWidget extends StatelessWidget {
  const ExampleModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExampleModelData> //Надо указывать, чтоб он понимал какого типа model, иначе model - это Object
        (
        createModelDataEx: () => ExampleModelData(initValue: 100),    //передаем модель для управления
        builder: (context, model) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Test'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    model.getCount.toString(), //взяли значение
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: model.increment, //применили функцию
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
