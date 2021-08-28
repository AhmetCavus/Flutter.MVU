import 'package:flutter/material.dart';
import 'package:flutter_mvu/core/error_notifier.dart';
import 'package:flutter_mvu/core/notifiable_widget.dart';

import 'error_state.dart';

class NotifiableErrorWidget extends NotifiableWidget<ErrorNotifier> {
  NotifiableErrorWidget(ErrorNotifier modelNotifier) : super(modelNotifier);

  @override
  Widget onBuild(BuildContext context, ErrorNotifier modelNotifier) {
    return ValueListenableBuilder(
        valueListenable: modelNotifier,
        builder: (context, errorState, widget) {
          return Visibility(
            visible: (errorState as ErrorState).hasException(),
            child: Card(
              elevation: 4,
              color: Colors.redAccent,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  errorState.toString(),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
