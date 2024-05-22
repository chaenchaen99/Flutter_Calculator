import 'package:calculator_basic_starter/domain/entity/calculator.dart';

abstract class ICalculatorRepository {
  Future<CalculatorEntity> fetch();

  Future<void> save(CalculatorEntity entity);
}
