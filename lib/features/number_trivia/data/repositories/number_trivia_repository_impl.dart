import 'package:trivia_app/core/platform/network_info.dart';
import 'package:trivia_app/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:trivia_app/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  NumberTriviaRepositoryImpl({
    required this.remoteDataSource, 
    required this.localDataSource, 
    required this.networkInfo
  }); 
  
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}