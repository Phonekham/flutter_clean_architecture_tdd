import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_tdd/core/error/failures.dart';
import 'package:flutter_clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  // Future<Either<Failure, NumberTrivia>> call(Params params) async {
  //   return await repository.getConcreteNumberTrivia(params.number);
  // }
  Future<Either<Failure, NumberTrivia>> execute({@required int? number}) async {
    return await repository.getConcreteNumberTrivia(number!);
  }

// class Params extends Equatable {
//   final int number;

//   Params({required this.number});

//   @override
//   List<Object> get props => [number];
}
