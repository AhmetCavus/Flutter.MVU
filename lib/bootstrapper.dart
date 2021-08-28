import 'package:flutter_mvu/core/dicontainer.dart';
import 'package:flutter_mvu/core/dicontainer_light.dart';
import 'package:flutter_mvu/model/counter_model.dart';
import 'package:flutter_mvu/model/counter_model_notifier.dart';
import 'package:flutter_mvu/update/counter_update.dart';

class Bootstrapper {

  DiContainer init() {
    final di = DiContainerLight.instance;
    
    final counterNotifier = CounterModelNotifier(CounterModel(0));
    di.registerSingleton(counterNotifier);

    final counterUpdate = CounterUpdate(counterNotifier);
    di.registerSingleton(counterUpdate);

    return di;
  }
}