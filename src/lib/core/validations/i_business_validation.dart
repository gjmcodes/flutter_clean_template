import 'package:clean_resources/core/entities/entity.dart';
import 'package:clean_resources/core/operations/business_validation.dart';

abstract class IBusinessValidation<T extends Entity> {
  BusinessValidation isValid(T entity);
}
