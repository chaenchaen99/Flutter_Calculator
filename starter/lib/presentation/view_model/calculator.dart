import 'package:calculator_basic_starter/domain/entity/calculator.dart';
import 'package:calculator_basic_starter/domain/use_case/fetch_calculator.dart';
import 'package:calculator_basic_starter/domain/use_case/save_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorViewModel extends ValueNotifier<CalculatorEntity> {
  final FetchCalculatorUseCase _fetchCalculatorUserCase;
  final SaveCalculatorUseCase _saveCalculatorUseCase;

  CalculatorViewModel(super.calculator, this._fetchCalculatorUserCase,
      this._saveCalculatorUseCase);

  Future<void> load() async {
    value = await _fetchCalculatorUserCase.execute();
  }

  Future<void> save() async {
    final SaveCalculatorParams params = SaveCalculatorParams(
      entity: value,
    );
    await _saveCalculatorUseCase.execute(params);
  }

  void calculate(String buttonText) {
    value.calculate(buttonText);
    notifyListeners();
  }
}
