import 'package:flutter/cupertino.dart';
import 'package:flutter_mvu/core/model_notifier.dart';

abstract class StatefulNotifiableWidget<T extends ModelNotifier>
    extends StatefulWidget {
  final T _modelNotifier;

  const StatefulNotifiableWidget(this._modelNotifier);

  @override
  State<StatefulWidget> createState() {
    return _NotifiableWidget();
  }

  T getArgument<T>(BuildContext context) =>
      ModalRoute.of(context)?.settings?.arguments as T;

  Widget onBuild(BuildContext context, T modelNotifier);
}

class _NotifiableWidget<T extends ModelNotifier>
    extends State<StatefulNotifiableWidget<T>> {
  @override
  Widget build(BuildContext context) =>
      widget.onBuild(context, widget._modelNotifier);
}
