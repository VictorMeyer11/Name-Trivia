import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_app/core/use_cases/use_case.dart';
import 'package:trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivia_app/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock 
  implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  const testNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia from the repository', 
    () async {
    when(mockNumberTriviaRepository?.getRandomNumberTrivia())
    .thenAnswer((_) async => Right(testNumberTrivia));

    final result = await usecase!(NoParams());

    expect(result, Right(testNumberTrivia));
    verify(mockNumberTriviaRepository?.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
    }
  );
}