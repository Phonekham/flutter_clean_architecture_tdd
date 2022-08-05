import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../data/datasources/number_trivia_local_source.dart';
import '../../data/datasources/number_trivia_remote_source.dart';
import '../../domain/entities/number_trivia.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  late NumberTriviaRemoteDataSource remoteDataSource;
  late NumberTriviaLocalDataSource localDataSource;
  late NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}