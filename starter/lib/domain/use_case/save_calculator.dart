import 'package:calculator_basic_starter/domain/entity/calculator.dart';
import 'package:calculator_basic_starter/domain/repository/calculator.dart';
import 'package:calculator_basic_starter/util/util.dart';

class SaveCalculatorUseCase implements IUseCase<void, SaveCalculatorParams> {
  final ICalculatorRepository _calculatorRepository;

  SaveCalculatorUseCase(this._calculatorRepository);
  @override
  Future<void> execute([SaveCalculatorParams? params]) async {
    if (params == null) return;
    return _calculatorRepository.save(params.entity);
  }
}

class SaveCalculatorParams {
  final CalculatorEntity entity;

  SaveCalculatorParams({
    required this.entity,
  });
}
