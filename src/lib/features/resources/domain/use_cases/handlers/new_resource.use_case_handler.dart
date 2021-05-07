import 'package:clean_resources/core/use_cases/use_case_handler.dart';
import 'package:clean_resources/core/use_cases/use_case_request.dart';
import 'package:clean_resources/features/resources/domain/entities/resource.dart';
import 'package:clean_resources/features/resources/domain/repositories/i_resource.local.repository.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/get_resources.use_case.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/new_resource.use_case.dart';
import 'package:clean_resources/features/resources/domain/use_cases/responses/new_resource.use_case_response.dart';
import 'package:clean_resources/features/resources/infra/data/local/resource.local.repository.dart';



abstract class NewResourceUseCaseRequest extends UseCaseRequest<NewResourceUseCase, NewResourceUseCaseResponse>{}

class NewResourceUseCaseHandler extends UseCaseHandler
implements NewResourceUseCaseRequest{

  final IResourceLocalRepository resourceLocalRepository = ResourceLocalRepository();

  @override
  Future<NewResourceUseCaseResponse> handleAsync(NewResourceUseCase useCase) async {

    var model = new Resource.fromNewUseCase(useCase);
    super.validationResult = await model.validateNewUseCaseAsync();

    if(!this.isValid()) return NewResourceUseCaseResponse.invalidResponse(super.validationResult);

    model = await this.resourceLocalRepository.addResourceAsync(model);

    return NewResourceUseCaseResponse.validResponse(model);
  }


}