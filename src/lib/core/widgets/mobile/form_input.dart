import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class FormTextInput extends StatelessWidget {
  final TextEditingController controller;
  final Stream<String> validationStream;
  final TextInputAction inputAction;
  final String labelKey;
  final TextInputType inputType;
  final bool required;

  FormTextInput(this.controller, this.validationStream, this.labelKey,
      this.inputAction, this.inputType, this.required);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: validationStream,
        builder: (context, snapshot) {
          var _errorText = snapshot.data;
          return TextFormField(
            controller: controller,
            textInputAction: inputAction,
            keyboardType: inputType,
            validator: (value){
              if(value.isEmpty && this.required){
                return 'Field cannot be empty';
              }

              return null;
            },
            decoration: InputDecoration(
                errorText: _errorText,
                labelText: this.labelKey
            ) ,
          );
        }
    );
  }
}
