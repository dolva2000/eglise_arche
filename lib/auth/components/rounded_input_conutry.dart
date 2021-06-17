import 'package:flutter/material.dart';
import 'package:apparche/auth/components/text_field_container.dart';
import 'package:apparche/auth/constants.dart';

import 'package:country_code_picker/country_code_picker.dart';

class RoundedInputCountry extends StatefulWidget {
   final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function validator;
  final Function onPhoneChanged;

  const RoundedInputCountry({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
      this.validator,
    this.onPhoneChanged,
  }) : super(key: key);

  @override
  _RoundedInputCountryState createState() => _RoundedInputCountryState();
}


class _RoundedInputCountryState extends State<RoundedInputCountry>  {
 
  @override
  Widget build(BuildContext context) {
    debugPrint(CountryCode.fromCountryCode('CD').flagUri);
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextFormField(
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.phone,
        maxLength: 9,
         validator: (text) {
            if (!text.isNotEmpty) {
              return "Renseignez ce champ !";
            }
            return widget.validator != null ? widget.validator(text) : null;
          },
        decoration: InputDecoration(
          prefixIcon: CountryCodePicker(
            onChanged: widget.onPhoneChanged,
            padding: EdgeInsets.only(left: 10),
            flagWidth: 25,
            dialogSize: Size(size.width - 30, size.height - 100),
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'CD',
            showFlagDialog: true,
            comparator: (a, b) => b.name.compareTo(a.name),
            //Get the country information relevant to the initial selection
            onInit: widget.onPhoneChanged,
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

/* String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  } */
