import 'business_validation.dart';

class ValidationResult {
  ValidationResult() {
    _validations = Map<String, String>();
  }

  Map<String, String> _validations;
  Map<String, String> get validations => _validations;

  bool isValid() => _validations == null || _validations.isEmpty;

  void _checkValidationsInstance() {
    if (this._validations == null)
      this._validations = Map<String, String>();
  }

  void addValidation(String key, String value) {
    _validations[key] = value;
  }

  void addBusinessValidation(BusinessValidation validation) {
    this._checkValidationsInstance();
    this.addValidation(validation.errorKey, validation.errorMsg);
  }

  void addBusinessValidations(List<BusinessValidation> validations) {
    this._checkValidationsInstance();

    validations.forEach((element) {
      this.addValidation(element.errorKey, element.errorMsg);
    });
  }
}
