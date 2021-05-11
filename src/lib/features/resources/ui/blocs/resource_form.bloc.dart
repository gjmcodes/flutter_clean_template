import 'dart:async';

import 'package:clean_resources/core/blocs/base_form.bloc.dart';
import 'package:clean_resources/features/resources/domain/constants.dart';
import 'package:clean_resources/features/resources/domain/use_cases/handlers/new_resource.use_case_handler.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/new_resource.use_case.dart';
import 'package:clean_resources/features/resources/ui/blocs/resources.bloc.dart';

class ResourceFormBloc extends BaseFormBloc {
  final ResourcesBloc bloc;
  final StreamController<String> nameStreamController =
      StreamController<String>.broadcast();
  final NewResourceUseCaseRequest useCaseHandler = NewResourceUseCaseHandler();

  ResourceFormBloc(this.bloc);

  @override
  void setValidations() {
    validations[RESOURCE_NAME_KEY] = nameStreamController;
  }

  Future<bool> addAsync(NewResourceUseCase useCase) async {
    var result = await this.useCaseHandler.handleAsync(useCase);

    if (!result.validationResult.isValid()) {
      super.addValidations(result.validationResult);
    }

    this.bloc.add(result.model);

    notifyListeners();

    return true;
  }

  @override
  void dispose() {
    this.nameStreamController.close();
    super.dispose();
  }
}
