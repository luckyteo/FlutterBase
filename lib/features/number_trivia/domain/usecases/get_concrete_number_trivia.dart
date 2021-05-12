import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base_clean_architecture/core/error/failures.dart';
import 'package:flutter_base_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_base_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_base_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, ReqNum> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call(ReqNum paramas) async {
    return await repository.getConcreteNumberTrivia(paramas.number);
  }
}

class ReqNum extends Equatable {
  final int number;

  ReqNum({required this.number});

  @override
  List<Object> get props => [number];
}
