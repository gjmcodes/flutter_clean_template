import 'package:clean_resources/core/operations/validation_result.dart';
import 'package:clean_resources/core/use_cases/use_case_response.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';

class GetResourcesUseCaseResponse extends UseCaseResponse {
  GetResourcesUseCaseResponse.invalidResponse(ValidationResult validationResult)
      : super.invalidResponse(validationResult);

  List<Resource> resources;

  GetResourcesUseCaseResponse.validResponse(this.resources);
}
