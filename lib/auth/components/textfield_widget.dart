import 'package:flutter/material.dart';
import 'package:apparche/auth/constants.dart';
import 'package:apparche/auth/components/text_field_container.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final bool readOnly;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function onPress;
  final Function validator;
  final TextEditingController controller;

  const TextFieldWidget(
      {Key key,
      this.maxLines = 1,
      this.label,
      this.text,
      this.readOnly = false,
      this.icon,
      this.onChanged,
      this.onPress,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller;
  FocusNode focusNode = new FocusNode();

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
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 1),
          TextFormField( 
            onTap: widget.onPress ?? () {},
            onChanged: widget.onChanged ?? () {},
            controller: controller,
            cursorColor: kPrimaryColor,
            readOnly: widget.readOnly,
            //enabled: !widget.readOnly,
            validator: widget.validator,
            decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: widget.label,
              prefixIcon: Icon(widget.icon),
               filled: true,
          fillColor: kPrimaryLightColor,
              suffixIcon:
                  !widget.readOnly ? Icon(Icons.edit, size: 15) : SizedBox(),
            ),
            maxLines: widget.maxLines,
          ),
        ],
      );
}
