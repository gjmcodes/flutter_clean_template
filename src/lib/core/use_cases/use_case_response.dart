import 'package:clean_resources/core/operations/validation_result.dart';

abstract class UseCaseResponse{
  ValidationResult validationResult;

  UseCaseResponse({this.validationResult});

  bool isValid() => this.validationResult?.isValid();

  UseCaseResponse.invalidResponse(this.validationResult);

}