import 'package:calculator_basic_starter/data/data.dart';
import 'package:calculator_basic_starter/data/repository/calculator.dart';
import 'package:calculator_basic_starter/domain/entity/calculator.dart';
import 'package:calculator_basic_starter/domain/repository/repository.dart';
import 'package:calculator_basic_starter/domain/use_case/fetch_calculator.dart';
import 'package:calculator_basic_starter/domain/use_case/save_calculator.dart';
import 'package:calculator_basic_starter/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorProvider extends StatelessWidget {
  final Widget child;

  const CalculatorProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ICalculatorLocalDataSource>(
          create: (context) => CalculatorLocalDataSource(),
        ),
      ],
      child: MultiProvider(
        providers: [
          Provider<CalculatorDataSource>(
            create: (context) => CalculatorDataSource(context.read()),
          ),
        ],
        child: MultiProvider(
          providers: [
            Provider<ICalculatorRepository>(
              create: (context) => CalculatorRepository(context.read()),
            )
          ],
          child: MultiProvider(
            providers: [
              Provider<FetchCalculatorUseCase>(
                create: (context) => FetchCalculatorUseCase(context.read()),
              ),
              Provider<SaveCalculatorUseCase>(
                create: (context) => SaveCalculatorUseCase(context.read()),
              ),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => CalculatorViewModel(
                    CalculatorEntity(),
                    context.read(),
                    context.read(),
                  ),
                ),
              ],
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
