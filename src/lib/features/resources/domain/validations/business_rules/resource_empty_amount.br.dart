import 'package:clean_resources/core/operations/business_validation.dart';
import 'package:clean_resources/core/validations/i_business_validation.dart';
import 'package:clean_resources/core/validations/messages_constants.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';

import '../../constants.dart';

class ResourceEmptyAmountBR implements IBusinessValidation<Resource> {
  @override
  BusinessValidation isValid(Resource entity) {
    if (entity.amount == null || entity.amount <= 0)
      return new BusinessValidation(RESOURCE_AMOUNT_KEY, GREATER_THAN_ZERO);

    return BusinessValidation.validBusiness();
  }
}
