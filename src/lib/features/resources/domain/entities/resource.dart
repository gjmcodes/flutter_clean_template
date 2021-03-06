import 'package:clean_resources/core/entities/entity.dart';
import 'package:clean_resources/core/operations/validation_result.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/new_resource.use_case.dart';
import 'package:clean_resources/features/resources/domain/validations/specifications/new_resource.specification.dart';

class Resource extends Entity {
  String id;
  String name;
  int amount;

  Resource.fromNewUseCase(NewResourceUseCase useCase) {
    this.name = useCase.name;
    this.amount = useCase.amount;
  }

  Future<ValidationResult> validateNewUseCaseAsync() async {
    return await new NewResourceValidation().isSatisfiedBy(this);
  }
}
