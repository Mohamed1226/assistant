
import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  final String hint;
  final String label;
  final bool obscureText;
  final validator;
  final onSaved;
  final onChanged;
  final prefixIcon;
  final suffixIcon;
  final double width;
  final Color backgroundColor;
  final TextInputType keyboardType;
  final double borderRaduis;
  final int maxLine;

  const CustomTextFormField({
    Key key,
    this.hint,
    this.label,
    this.obscureText,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.width,
    this.keyboardType,
    this.borderRaduis,
    this.maxLine,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width ?? size.width * .8,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.amber,
        borderRadius: BorderRadius.circular(widget.borderRaduis ?? 50),
      ),
      margin: EdgeInsets.symmetric(
        vertical: size.height*0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width*0.05,
      ),
      child: TextFormField(
        textAlign: TextAlign.right,
        maxLines: widget.maxLine ?? 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        validator: widget.validator ?? null,
        onSaved: widget.onSaved ?? null,
        onChanged:  widget.onChanged ?? null,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          icon: widget.prefixIcon ?? null,
          suffixIcon: widget.suffixIcon ?? null,
          border: InputBorder.none,
          hintText: widget.hint == null ? null : '${widget.hint}',
          labelText: widget.label == null ? null : '${widget.label}',
          hintStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
