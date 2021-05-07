import 'package:clean_resources/core/i18ln/field_keys.dart';
import 'file:///E:/Projetos/Flutter/clean_resources/clean_resources/lib/core/widgets/mobile/form_input.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/new_resource.use_case.dart';
import 'package:clean_resources/features/resources/ui/blocs/resource_form.bloc.dart';
import 'package:flutter/material.dart';

class ResourceCreate extends StatefulWidget {
  @override
  _ResourceCreate createState() => _ResourceCreate();
}

class _ResourceCreate extends State<ResourceCreate> {

  final formKey = GlobalKey<FormState>();
  final nameController = new TextEditingController();
  final amountController = new TextEditingController();
  final resourceFormBloc = new ResourceFormBloc();

  Future submitFormAsync() async {
    var useCase = new NewResourceUseCase();
    useCase.name = this.nameController.text;
    this.resourceFormBloc.addAsync(useCase);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Container(
            child: ListView(
              children: [
                FormTextInput(
                    nameController,
                    resourceFormBloc.nameStreamController.stream,
                    'Name',
                    TextInputAction.next,
                    TextInputType.name,
                    true),
                ElevatedButton(onPressed: (){
                  submitFormAsync();
                }, child: const Text('submit')),
              ],
            )));
  }
}
