import 'package:flutter/material.dart';

class ConditionalChild extends StatelessWidget {
  final bool _condition;
  final Widget _child;
  final Widget _replacement;

  const ConditionalChild(
      {Key? key,
        required bool condition,
        required Widget child,
        Widget replacement = const SizedBox()})
      : _condition = condition,
        _child = child,
        _replacement = replacement,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _condition ? _child : _replacement;
  }
}
