import 'package:clean_resources/core/operations/validation_result.dart';
import 'package:clean_resources/core/use_cases/use_case_response.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';

class NewResourceUseCaseResponse extends UseCaseResponse {
  NewResourceUseCaseResponse.invalidResponse(ValidationResult validationResult)
      : super.invalidResponse(validationResult);

  Resource model;

  NewResourceUseCaseResponse.validResponse(this.model) {
    this.validationResult = ValidationResult();
  }
}
