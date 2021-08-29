import 'package:flutter/material.dart';
import 'package:flutter_mvu/bootstrapper.dart';
import 'package:flutter_mvu/core/dicontainer.dart';
import 'package:flutter_mvu/core/notifiable_widget.dart';
import 'package:flutter_mvu/model/counter_model_notifier.dart';
import 'package:flutter_mvu/update/counter_update.dart';

import 'model/counter_model.dart';

void main() {
  final di = Bootstrapper().init();
  runApp(MyApp(di));
}

class MyApp extends StatelessWidget {

  final DiContainer di; 

  MyApp(this.di);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVU Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(di.resolve(), di.resolve(), title: 'Flutter MVU Demo Home Page'),
    );
  }
}

class MyHomePage extends NotifiableWidget<CounterModelNotifier> {
  final CounterUpdate update;

  MyHomePage(this.update, CounterModelNotifier counterNotifier, {Key key, this.title}) : super(counterNotifier);

  final String title;

  @override
  Widget onBuild(BuildContext context, CounterModelNotifier modelNotifier) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<CounterModel>(valueListenable: modelNotifier, builder: (context, model, widget) {
              return Text(
                modelNotifier.value.count.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: update.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}