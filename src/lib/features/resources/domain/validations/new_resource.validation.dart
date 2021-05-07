import 'package:clean_resources/core/operations/validation_result.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';
import 'package:clean_resources/features/resources/domain/validations/specifications/resource_empty_name.specification.dart';

class NewResourceValidation{
  ValidationResult validationResult;
  final ResourceEmptyName emptyNameSpecification = ResourceEmptyName();
  NewResourceValidation(){
    this.validationResult = ValidationResult();
  }
  Future<ValidationResult> validateAsync(Resource model) async {
    var _nameValidation = this.emptyNameSpecification.validateEmptyName(model);
    this.validationResult.addBusinessValidation(_nameValidation);

    return this.validationResult;
  }
}