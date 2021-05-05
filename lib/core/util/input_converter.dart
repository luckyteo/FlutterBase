import 'package:dartz/dartz.dart';
import 'package:flutter_base_clean_architecture/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final num = int.parse(str);

      if (num < 0) throw FormatException();

      return Right(num);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
