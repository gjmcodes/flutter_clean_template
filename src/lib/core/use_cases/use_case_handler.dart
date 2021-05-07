import 'package:clean_resources/core/operations/validation_result.dart';

class UseCaseHandler{
  ValidationResult validationResult;

  Handler() {
    validationResult = new ValidationResult();
  }

  bool isValid() => this.validationResult.isValid();
}