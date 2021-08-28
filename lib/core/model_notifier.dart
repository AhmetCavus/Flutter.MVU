import 'package:flutter/foundation.dart';

abstract class ModelNotifier<T> extends ValueNotifier<T> {
  ModelNotifier(T value) : super(value);
}
