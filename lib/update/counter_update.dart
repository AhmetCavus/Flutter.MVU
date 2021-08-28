import 'package:flutter_mvu/model/counter_model.dart';
import 'package:flutter_mvu/model/counter_model_notifier.dart';

class CounterUpdate {
  final CounterModelNotifier _modelNotifier;

  CounterUpdate(this._modelNotifier);

  void incrementCounter() {
    _modelNotifier.value = CounterModel(_modelNotifier.value.count + 1);  
  }
}