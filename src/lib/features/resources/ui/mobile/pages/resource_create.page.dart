import 'package:clean_resources/core/widgets/mobile/form_input.dart';
import 'package:clean_resources/features/resources/domain/use_cases/models/new_resource.use_case.dart';
import 'package:clean_resources/features/resources/ui/blocs/resource_form.bloc.dart';
import 'package:clean_resources/features/resources/ui/blocs/resources.bloc.dart';
import 'package:clean_resources/features/resources/ui/mobile/pages/resource_index.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourceCreate extends StatefulWidget {
  final ResourcesBloc _bloc;
  ResourceCreate(this._bloc);
  @override
  _ResourceCreate createState() => _ResourceCreate(this._bloc);
}

class _ResourceCreate extends State<ResourceCreate> {
  final formKey = GlobalKey<FormState>();
  final nameController = new TextEditingController();
  final amountController = new TextEditingController();
  final ResourcesBloc bloc;
  ResourceFormBloc resourceFormBloc;

  _ResourceCreate(this.bloc) {
    this.resourceFormBloc = new ResourceFormBloc(bloc);
  }

  Future submitFormAsync() async {
    var useCase = new NewResourceUseCase();
    useCase.name = this.nameController.text;
    useCase.amount = 3;
    var result = await this.resourceFormBloc.addAsync(useCase);

    if (result) {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => ResourcesIndex()));
    }
  }

  @override
  Widget build(BuildContext context) {
    //var bloc = Provider.of<ResourcesBloc>(context);
    //this.resourceFormBloc = new ResourceFormBloc(bloc);

    return Scaffold(
      body: Form(
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
              ElevatedButton(
                  onPressed: () {
                    submitFormAsync();
                  },
                  child: const Text('submit')),
            ],
          ))),
    );
  }
}
