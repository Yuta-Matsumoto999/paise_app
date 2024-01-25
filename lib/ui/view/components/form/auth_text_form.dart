import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/ui/controller/password_form_controller.dart';
import 'package:praise_app_flutter/ui/view/validation/execute_validation.dart';
import 'package:praise_app_flutter/ui/view/validation/validator.dart';

class AuthTextForm extends ConsumerWidget {
  final String label;
  final String? hintText;
  final bool isPassword;
  final TextEditingController formController;
  final AutoDisposeStateProvider<String> formErrorProvider;
  final bool formActive;
  final List<Validator> validators;
  const AuthTextForm({
    Key? key,
    required this.label,
    this.hintText,
    required this.isPassword,
    required this.formController,
    required this.formErrorProvider,
    required this.formActive,
    required this.validators
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(formErrorProvider);
    final passwordIsHidden = ref.watch(hidePassword);

    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: error == "" ? const Color(CustomColor.authFormBackground) : const Color(CustomColor.errorColor),
              boxShadow: const [
                BoxShadow(
                  color: Color(CustomColor.authFormBoxShadow),
                  offset: Offset(5, 5),
                  blurRadius: 7.0, 
                  spreadRadius: 1.0,
                )
              ]
            ),
            child: SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.05,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText ?? hintText,
                  suffixIcon: isPassword ? IconButton(
                    icon: Icon(passwordIsHidden ? Icons.visibility : Icons.visibility_off, size: 18),
                    onPressed: () => {
                      ref.read(hidePassword.notifier).state = !passwordIsHidden
                    },
                  ) : null
                ),
                controller: formController,
                onChanged: (value) {
                  var result = _validate(value);
                  ref.read(formErrorProvider.notifier).state = result.first;
                },
                enabled: formActive,
                obscureText: isPassword ? passwordIsHidden : false,
              ),
            ),
          ),
          error != "" ?
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              error,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red
              ),
            ),
          ) :
          const SizedBox()
        ],
      )
    );
  }

  List<dynamic> _validate(value) {
    return ExecuteValidation(validators: validators).execute(value);
  }
}