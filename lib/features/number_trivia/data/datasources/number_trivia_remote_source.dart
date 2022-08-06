import 'package:flutter_clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(dynamic number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
