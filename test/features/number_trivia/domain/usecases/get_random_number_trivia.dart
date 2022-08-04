// import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
// import 'package:flutter_clean_architecture_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mockito/mockito.dart';

// import 'package:flutter_clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
// import 'package:flutter_clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

// void main() {
//   GetRandomNumberTrivia usecase;
//   MockNumberTriviaRepository? mockNumberTriviaRepository;
//   setUp(() {
//     mockNumberTriviaRepository = MockNumberTriviaRepository();
//     usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
//   });

//   final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

//   test('shoild get trivia for number from the repository', () async {
//     // ignore: null_check_always_fails
//     when(mockNumberTriviaRepository?.getConcreteNumberTrivia(any!))
//         .thenAnswer((_) async => Right(tNumberTrivia));
//     // act
//     final result = await usecase(NoParams());
//     // asset
//     expect(result, Right(tNumberTrivia));
//     verify(mockNumberTriviaRepository?.getRandomNumberTrivia());
//     verifyNoMoreInteractions(mockNumberTriviaRepository);
//   });
// }
