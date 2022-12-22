import 'package:flutter/material.dart';
import 'package:view_model_test/example_widget/example_model_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return
        const ExampleModelWidget();
        // ViewModelBuilder<ViewModelData>  //Надо указывать, чтоб он понимал какого типа model, иначе model это Object
        //   (builder: (context, model){
        //   return
        //     Scaffold(
        //     appBar: AppBar(
        //       title: Text(widget.title),
        //     ),
        //     body: Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           const Text(
        //             'You have pushed the button this many times:',
        //           ),
        //           Text(
        //             '$_counter',
        //             style: Theme.of(context).textTheme.headline4,
        //           ),
        //         ],
        //       ),
        //     ),
        //     floatingActionButton: FloatingActionButton(
        //       onPressed: _incrementCounter,
        //       tooltip: 'Increment',
        //       child: const Icon(Icons.add),
        //     ),
        //   );
        // });
  }
}
