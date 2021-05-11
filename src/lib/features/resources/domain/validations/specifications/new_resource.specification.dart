import 'package:clean_resources/core/operations/business_validation.dart';
import 'package:clean_resources/core/operations/validation_result.dart';
import 'package:clean_resources/core/validations/i_specification.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';
import 'package:clean_resources/features/resources/domain/validations/business_rules/resource_empty_amount.br.dart';
import 'package:clean_resources/features/resources/domain/validations/business_rules/resource_empty_name.br.dart';

class NewResourceValidation implements ISpecification<Resource> {
  ValidationResult validationResult;
  final ResourceEmptyNameBR emptyNameValidation = ResourceEmptyNameBR();
  final ResourceEmptyAmountBR amountValidation = ResourceEmptyAmountBR();

  NewResourceValidation() {
    this.validationResult = ValidationResult();
  }

  @override
  Future<ValidationResult> isSatisfiedBy(Resource entity) async {
    var _nameValidation = this.emptyNameValidation.isValid(entity);
    this.validationResult.addBusinessValidation(_nameValidation);

    var _amountValidation = this.amountValidation.isValid(entity);
    this.validationResult.addBusinessValidation(_amountValidation);

    return this.validationResult;
  }
}
