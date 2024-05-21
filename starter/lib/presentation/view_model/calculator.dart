import 'package:calculator_basic_starter/data/repository/calculator.dart';
import 'package:calculator_basic_starter/data/source/calculator.dart';
import 'package:calculator_basic_starter/data/source/local/calculator.dart';
import 'package:calculator_basic_starter/ui/screen/calculator.dart';
import 'package:calculator_basic_starter/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorViewModel extends ValueNotifier<CalculatorEntity> {
  final FetchCalculatorUseCase _fetchCalculatorUserCase;
  final SaveCalculatorUseCase _saveCalculatorUseCase;

  CalculatorViewModel(super.calculator, this._fetchCalculatorUserCase,
      this._saveCalculatorUseCase);

  Future<void> load() async {
    value = await _fetchCalculatorUserCase.execute();
  }

  Future<void> save() async {
    await _saveCalculatorUseCase.execute(value);
  }

  void calculate(String buttonText) {
    value.calculate(buttonText);
    notifyListeners();
  }
}

class FetchCalculatorUseCase {
  Future<CalculatorEntity> execute() {
    return CalculatorRepository(
            CalculatorDataSource(CalculatorLocalDataSource()))
        .fetch();
  }
}

class SaveCalculatorUseCase {
  Future<void> execute(CalculatorEntity entity) {
    return CalculatorRepository(
            CalculatorDataSource(CalculatorLocalDataSource()))
        .save(entity);
  }
}
