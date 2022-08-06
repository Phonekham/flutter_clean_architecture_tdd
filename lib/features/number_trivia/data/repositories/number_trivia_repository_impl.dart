import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_tdd/core/error/exceptions.dart';

import '../../../../core/platform/network_info.dart';
import '../../data/datasources/number_trivia_local_source.dart';
import '../../data/datasources/number_trivia_remote_source.dart';
import '../../domain/entities/number_trivia.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/number_trivia_repository.dart';

typedef _CongreteOrRandomChooser = Future<NumberTrivia> Function();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  late NumberTriviaRemoteDataSource? remoteDataSource;
  late NumberTriviaLocalDataSource? localDataSource;
  late NetworkInfo? networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await _getTrivia(() {
      return remoteDataSource!.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource!.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _CongreteOrRandomChooser getCongreteOrRandom) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteTrivia = await getCongreteOrRandom();
        localDataSource?.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locaTrivia = await localDataSource!.getLastNumberTrivia();
        return Right(locaTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
