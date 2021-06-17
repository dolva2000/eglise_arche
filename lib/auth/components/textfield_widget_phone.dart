import 'package:flutter/material.dart';
import 'package:apparche/auth/constants.dart';
import 'package:apparche/auth/components/text_field_container.dart';

import 'package:country_code_picker/country_code_picker.dart';

class TextFieldWidgetPhone extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final String initialCode;
  final ValueChanged<String> onChanged;
  final Function onPhoneChanged;
  final Function validator;
  final TextEditingController controller;

  const TextFieldWidgetPhone(
      {Key key,
      this.maxLines = 1,
      this.label,
      this.text,
      this.initialCode = 'CD',
      this.onChanged,
      this.onPhoneChanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidgetPhone> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller =
        widget.controller != null ? widget.controller : TextEditingController();
    controller.text = widget.text;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 1),
        TextFormField(
          cursorColor: kPrimaryColor,
          maxLength: 9,
          controller: controller,
          validator: (text) {
            if (!text.isNotEmpty) {
              return "Entrez un numero valid !";
            }
            return null;
          },
          onChanged: widget.onChanged ?? () {},
          decoration: InputDecoration(
              icon: CountryCodePicker(
                onChanged: widget.onPhoneChanged,
                padding: EdgeInsets.all(0),
                flagWidth: 25,
                dialogSize: Size(size.width - 30, size.height - 100),
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: widget.initialCode,
                showFlagDialog: true,
                comparator: (a, b) => b.name.compareTo(a.name),
                //Get the country information relevant to the initial selection
                onInit: widget.onPhoneChanged,
              ),
              labelText: widget.label),
        ),
      ],
    );
  }
}
