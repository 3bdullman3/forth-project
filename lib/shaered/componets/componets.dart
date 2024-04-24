import 'package:flutter/material.dart';
Widget defaultButton({
   double width = double.infinity,
   Color background = Colors.blue,
  bool isUppercase = true,
  required Function() function,// Change parameter name from "function" to "onPressed"
  required String text, // Change parameter name from "Text" to "text"
}) => Container(
  width: width, // Use the provided width
  color: background,
  child: MaterialButton(
    onPressed: function, // Use the provided onPressed function
    child: Text(
     isUppercase? text.toUpperCase(): text, // Use the provided text
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
Widget DefaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  void Function()? onTap,
  required String
  Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool IsPass = false,
}) {
  return TextFormField(
    obscureText: IsPass,
    controller: controller,
    keyboardType: type,
    onTap: onTap,
    onFieldSubmitted: onSubmit != null ? (value) => onSubmit() : null,
    onChanged: onChange != null ? (value) => onChange(value) : null,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      border: OutlineInputBorder(),
      suffixIcon: suffix != null
          ? IconButton(
        onPressed: suffixPressed != null ? () => suffixPressed() : null,
        icon: Icon(suffix),
      )
          : null,
    ),
  );
}


