import 'package:calculator_basic_starter/domain/domain.dart';
import 'package:calculator_basic_starter/util/util.dart';

class FetchCalculatorUseCase implements IUseCase<CalculatorEntity, void> {
  final ICalculatorRepository _calculatorRepository;

  FetchCalculatorUseCase(this._calculatorRepository);

  @override
  Future<CalculatorEntity> execute([void params]) {
    return _calculatorRepository.fetch();
  }
}
