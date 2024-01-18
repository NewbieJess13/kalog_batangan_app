import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputAction? inputAction;
  final VoidCallback? onEditingComplete;
  final TextInputType? inputType;
  final bool isRequired;
  final String? initVal;
  const PrimaryTextField(
      {this.onChanged,
      this.validator,
      this.inputAction,
      this.inputType,
      this.onEditingComplete,
      required this.label,
      super.key,
      this.isRequired = false,
      this.initVal});

  @override
  Widget build(BuildContext context) {
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
          TextFormField(
            initialValue: initVal,
            onChanged: onChanged,
            validator: validator,
            onEditingComplete: onEditingComplete,
            keyboardType: inputType,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
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
