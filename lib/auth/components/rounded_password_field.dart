import 'package:flutter/material.dart';
import 'package:apparche/auth/components/text_field_container.dart';
import 'package:apparche/auth/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final Function toggleVisibility;
  final Function validator;
  const RoundedPasswordField(
      {Key key,
      this.onChanged,
      this.validator,
      this.obscureText,
      this.toggleVisibility})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        validator: (text) {
          if (!text.isNotEmpty) {
            return "Renseignez ce champ !";
          }
          return widget.validator != null ? widget.validator(text) : null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            onPressed: () {
              widget.toggleVisibility();
            },
          ),
          labelText: "Mot de passe",
          filled: true,
          fillColor: kPrimaryLightColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(29)),
        ),
      ),
    );
  }
}
