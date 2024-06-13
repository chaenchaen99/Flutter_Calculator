import 'package:flutter/foundation.dart';
import 'package:modularization_domain_final/domain.dart';

class CounterModeViewModel {
  final CounterModeModel _counterModeModel;

  CounterModeViewModel(this._counterModeModel);

  final ValueNotifier<CounterMode> _counterMode = ValueNotifier<CounterMode>(CounterMode.plus);

  ValueNotifier<CounterMode> get counterMode => _counterMode;

  void toggleMode() {
    _counterModeModel.toggleMode();
    _update();
  }

  void _update() {
    _counterMode.value = _counterModeModel.counterMode;
  }
}
