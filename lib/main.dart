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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVU Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(di.resolve(), di.resolve(), title: 'Flutter MVU Demo Home Page'),
    );
  }
}

class MyHomePage extends NotifiableWidget<CounterModelNotifier> {
  final CounterUpdate update;

  MyHomePage(this.update, CounterModelNotifier counterNotifier, {Key key, this.title}) : super(counterNotifier);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget onBuild(BuildContext context, CounterModelNotifier modelNotifier) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(this.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}