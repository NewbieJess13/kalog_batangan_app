import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      this.onChanged,
      this.validator,
      this.inputAction,
      this.inputType,
      this.onEditingComplete,
      required this.label,
      this.obscureText = true,
      this.hideShowPassword,
      this.isRequired = false});

  final String label;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputAction? inputAction;
  final VoidCallback? onEditingComplete;
  final TextInputType? inputType;
  final bool obscureText;
  final VoidCallback? hideShowPassword;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    print(obscureText);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
              TextSpan(text: label, children: [
                if (isRequired)
                  TextSpan(text: '*', style: TextStyle(color: Colors.red))
              ]),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onChanged,
            validator: validator,
            onEditingComplete: onEditingComplete,
            keyboardType: inputType,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: hideShowPassword,
                  child: Icon(
                    obscureText
                        ? Ionicons.eye_outline
                        : Ionicons.eye_off_outline,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                filled: true),
          ),
        ],
      ),
    );
  }
}
