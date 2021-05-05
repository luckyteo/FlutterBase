import 'package:flutter_base_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_base_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_base_clean_architecture/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'Test');

  test('should get trivia number from the repository', () async {
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((realInvocation) async => Right(tNumberTrivia));
    final result = await usecase(NoParams());

    // UseCase should simply return whatever was returned from the Repository
    expect(result, Right(tNumberTrivia));
    // Verify that the method has been called on the Repository
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
