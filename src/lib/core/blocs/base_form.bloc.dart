import 'dart:async';

import 'package:clean_resources/core/operations/validation_result.dart';
import 'package:flutter/widgets.dart';

abstract class BaseFormBloc extends ChangeNotifier {
  Map<String, StreamController<String>> validations;
  void setValidations();

  BaseFormBloc(){
    validations = new Map<String, StreamController<String>>();
    setValidations();
  }

  void changeValidation(String key, String value) {
    if (validations.containsKey(key)) {
      validations[key].sink.add(value);
    }
  }

  void addValidations(ValidationResult validationResult) {
    validationResult.validations.forEach((key, value) {
      changeValidation(key, value);
    });
  }

  @override
  void dispose(){
    super.dispose();
    this.validations.forEach((key, value) {
      value.close();
    });
  }
}