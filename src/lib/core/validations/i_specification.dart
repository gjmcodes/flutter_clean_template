import 'package:clean_resources/core/entities/entity.dart';
import 'package:clean_resources/core/operations/business_validation.dart';
import 'package:clean_resources/core/operations/validation_result.dart';

abstract class ISpecification<T extends Entity>{
  Future<ValidationResult> isSatisfiedBy(T entity);
}