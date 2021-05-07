import 'package:clean_resources/core/operations/business_validation.dart';
import 'package:clean_resources/core/validations/messages_constants.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';

import '../../constants.dart';

class ResourceEmptyName{
  BusinessValidation validateEmptyName(Resource model) {

    if (model.name == null || model.name.trim().isEmpty)
      return new BusinessValidation(RESOURCE_NAME_KEY, REQUIRED_FIELD);

    return BusinessValidation.validBusiness();
  }
}