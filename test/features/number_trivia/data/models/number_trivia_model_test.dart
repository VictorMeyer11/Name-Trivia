import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_app/core/fixtures/fixture_reader.dart';
import 'package:trivia_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

void main() {
  const testNumberTriviaModel = NumberTriviaModel(number: 1, text: 'test');

  test('should be a subclass of NumberTrivia entity',
    () async {
      expect(testNumberTriviaModel, isA<NumberTrivia>());
    }
  );

  group('fromJson', () {
    test('should return a valid model when the json number is an integer',
    () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, testNumberTriviaModel);
    });
    test('should return a valid model when the json number is regarded as a double',
    () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));
      
      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, testNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a json map containing the proper data',
    () async {
      final result = testNumberTriviaModel.toJson();
      final expectedMap = {'text': 'Test', 'number': 1};
      expect(result, expectedMap);
    });
  });
}