import 'package:flutter/cupertino.dart';
import 'package:flutter_mvu/core/model_notifier.dart';

abstract class StatefulNotifiablesWidget extends StatefulWidget {

  const StatefulNotifiablesWidget();

  @override
  State<StatefulWidget> createState() {
    return _StatefulNotifiablesWidget();
  }

  T getArgument<T>(BuildContext context) =>
      ModalRoute.of(context)?.settings?.arguments as T;

  Widget onBuild(BuildContext context);
}

class _StatefulNotifiablesWidget<T extends ModelNotifier>
    extends State<StatefulNotifiablesWidget> {
  @override
  Widget build(BuildContext context) =>
      widget.onBuild(context);
}
