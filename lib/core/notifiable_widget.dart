import 'package:flutter/cupertino.dart';
import 'package:flutter_mvu/core/model_notifier.dart';

abstract class NotifiableWidget<T extends ModelNotifier>
    extends StatelessWidget {
  final T _modelNotifier;

  const NotifiableWidget(this._modelNotifier);

  T getArgument<T>(BuildContext context) =>
      ModalRoute.of(context)?.settings?.arguments as T;

  @override
  Widget build(BuildContext context) => onBuild(context, _modelNotifier);

  Widget onBuild(BuildContext context, T modelNotifier);
}
