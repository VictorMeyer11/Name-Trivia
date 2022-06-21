import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivia_app/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock 
  implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const testNumber = 1;
  const testNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository', 
    () async {
    when(mockNumberTriviaRepository?.getConcreteNumberTrivia(any as int))
    .thenAnswer((_) async => Right(testNumberTrivia));

    final result = await usecase?.execute(number: testNumber);

    expect(result, Right(testNumberTrivia));
    verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(testNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
    }
  );
}