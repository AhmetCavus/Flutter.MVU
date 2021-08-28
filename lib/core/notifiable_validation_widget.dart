import 'package:flutter/material.dart';
import 'package:flutter_mvu/core/notifiable_widget.dart';
import 'package:flutter_mvu/core/validation_notifier.dart';
import 'package:flutter_mvu/core/validation_state.dart';

class NotifiableValidationWidget extends NotifiableWidget<ValidationNotifier> {
  NotifiableValidationWidget(ValidationNotifier modelNotifier)
      : super(modelNotifier);

  @override
  Widget onBuild(BuildContext context, ValidationNotifier modelNotifier) {
    return ValueListenableBuilder(
        valueListenable: modelNotifier,
        builder: (context, validationState, widget) {
          return Visibility(
            visible: (validationState as ValidationState).hasFailure(),
            child: Card(
              elevation: 4,
              color: Colors.deepOrange,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  validationState.failMessage,
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
