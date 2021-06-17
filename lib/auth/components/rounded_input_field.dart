import 'package:flutter/material.dart';
import 'package:apparche/auth/components/text_field_container.dart';
import 'package:apparche/auth/constants.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function validator;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: widget.keyboardType,
        validator: (text) {
          if (!text.isNotEmpty) {
            return "Renseignez ce champ !";
          }
          return widget.validator != null ? widget.validator(text) : null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          labelText: widget.hintText,
          filled: true,
          fillColor: kPrimaryLightColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(29)),
        ),
      ),
    );
  }
}
