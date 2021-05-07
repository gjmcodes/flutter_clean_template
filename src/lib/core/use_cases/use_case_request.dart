
import 'package:clean_resources/core/use_cases/use_case.dart';
import 'package:clean_resources/core/use_cases/use_case_response.dart';

abstract class UseCaseRequest<T extends UseCase, U extends UseCaseResponse>{
  Future<U> handleAsync(T useCase);
}