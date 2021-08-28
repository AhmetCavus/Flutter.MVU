import 'package:flutter/material.dart';

abstract class Pagebuilder {
  Widget build(BuildContext context) {
    return onBuild(context);
  }

  Widget onBuild(BuildContext context);
}
