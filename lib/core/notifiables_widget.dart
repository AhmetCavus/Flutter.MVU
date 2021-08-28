import 'package:flutter/cupertino.dart';

abstract class NotifiablesWidget extends StatelessWidget {

  const NotifiablesWidget();

  T getArgument<T>(BuildContext context) =>
      ModalRoute.of(context)?.settings?.arguments as T;

  @override
  Widget build(BuildContext context) => onBuild(context);

  Widget onBuild(BuildContext context);
}
