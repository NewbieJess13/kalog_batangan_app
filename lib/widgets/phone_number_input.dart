import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ionicons/ionicons.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput(
      {super.key,
      required this.title,
      this.type,
      this.onChanged,
      this.validator});

  final String title;
  final TextInputType? type;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          InternationalPhoneNumberInput(
            initialValue: PhoneNumber(isoCode: 'PH', dialCode: "+63"),
            selectorConfig: SelectorConfig(
                showFlags: false,
                trailingSpace: false,
                selectorType: PhoneInputSelectorType.DIALOG),
            validator: validator,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            keyboardAction: TextInputAction.next,
            onInputChanged: onChanged,
            inputDecoration: InputDecoration(
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
