
import 'package:clean_resources/core/use_cases/use_case_request.dart';
import 'package:clean_resources/features/resources/domain/repositories/i_resource.local.repository.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/get_resources.use_case.dart';
import 'package:clean_resources/features/resources/domain/use_cases/responses/new_resource.use_case_response.dart';
import 'package:clean_resources/features/resources/infra/data/local/resource.local.repository.dart';

abstract class GetResourcesUseCaseRequest extends UseCaseRequest<GetResourcesUseCase, NewResourceUseCaseResponse>{}


class GetResourcesUseCaseHandler implements GetResourcesUseCaseRequest{

final IResourceLocalRepository resourceLocalRepository = ResourceLocalRepository();
  @override
  Future<NewResourceUseCaseResponse> handleAsync(GetResourcesUseCase useCase) {
    // TODO: implement handleAsync
    throw UnimplementedError();
  }

}