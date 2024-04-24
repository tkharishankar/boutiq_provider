import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/button/buttons.dart';
import '../../../../../core/common/textfield/textfield.dart';
import '../../../../../core/themes/color_scheme.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../../core/utils/input_validation.dart';
import '../../../../../core/utils/loading_overlay.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../router/router.dart';
import 'states/registration_bloc.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen>
    with InputValidationMixin, LoadingOverlayMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final isValidate = ValueNotifier<bool>(false);

  // final phoneNumberValidate = ValueNotifier<bool>(false);

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _companyNameNode = FocusNode();
  final FocusNode _phoneNumberNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  OverlayEntry? _overlayEntry;
  var _passwordVisible = false;
  var _confirmPasswordVisible = false;
  double maxWidth = 0;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = kIsWeb ? 400 : double.infinity;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalMargin(50),
                    Text(AppTexts.createAccount,
                        style: Config.h2(context).copyWith(
                          fontSize: 24,
                        )),
                    // 📝 Note: The code below is the same as the one in the previous snippet.
                    Text(AppTexts.createAccountDescription,
                        style: Config.b3(context).copyWith(
                          color: AppColors.grey100,
                        )),
                    const VerticalMargin(20),
                    AppTextField(
                      controller: _companyNameController,
                      hintText: AppTexts.companyName,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.none,
                      focusNode: _companyNameNode,
                      textInputAction: TextInputAction.next,
                      validator: combine([
                        withMessage(AppTexts.fieldEmpty("Company Name"), isTextEmpty),
                      ]),
                    ),
                    const VerticalMargin(20),
                    AppTextField(
                        controller: _phoneNumberController,
                        hintText: AppTexts.phoneNumber,
                        inputType: TextInputType.number,
                        textCapitalization: TextCapitalization.none,
                        focusNode: _phoneNumberNode,
                        textInputAction: TextInputAction.done,
                        validator: combine([
                          withMessage(AppTexts.phoneNumberInvalid, isInvalidPhoneNumber),
                          withMessage(AppTexts.fieldEmpty("Phone number"), isTextEmpty),
                        ])),
                    const VerticalMargin(20),
                    AppTextField(
                      controller: _emailController,
                      hintText: AppTexts.email,
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      focusNode: _emailNode,
                      textInputAction: TextInputAction.done,
                      validator: combine([
                              withMessage(AppTexts.emailInvalid, isInvalidEmail),
                              withMessage(AppTexts.fieldEmpty("Email"), isTextEmpty),
                            ])
                    ),
                    const VerticalMargin(20),
                    AppTextField(
                      controller: _passwordController,
                      hintText: AppTexts.password,
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      focusNode: _passwordNode,
                      obscureText: !_passwordVisible,
                      textInputAction: TextInputAction.done,
                      validator:combine([
                              withMessage(AppTexts.passwordInvalid, isPasswordInvalid),
                              withMessage(AppTexts.fieldEmpty("Password"), isTextEmpty),
                            ]),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    const VerticalMargin(20),
                    AppTextField(
                      controller: _confirmPasswordController,
                      hintText: AppTexts.confirmPassword,
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      focusNode: _confirmPasswordNode,
                      obscureText: !_confirmPasswordVisible,
                      textInputAction: TextInputAction.done,
                      validator:combine([
                              withMessage(AppTexts.confirmPasswordInvalid, isPasswordInvalid),
                              withMessage(AppTexts.fieldEmpty("Confirm Password"), isTextEmpty),
                            ]),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    const VerticalMargin(20),
                    BlocConsumer<RegistrationBloc, RegistrationState>(
                      listener: _listener,
                      builder: (context, state) {
                        return AppButton(
                          text: AppTexts.createAccountButton,
                          onTap: () {
                            _companyNameNode.unfocus();
                            _phoneNumberNode.unfocus();
                            _emailNode.unfocus();
                            _passwordNode.unfocus();
                            _confirmPasswordNode.unfocus();

                            if (_formKey.currentState!.validate()) {
                              // isValidate.value = true;
                              context.read<RegistrationBloc>().add(RegisterUser(
                                  phoneNumber: _phoneNumberController.text,
                                  companyName: _companyNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text));
                            } else {
                              isValidate.value = false;
                            }
                          },
                          textSize: 18,
                          textColor: AppColors.white100,
                          color: AppColors.primaryColor,
                        );
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                          onPressed: () {
                            GoRouter.of(context).pushReplacementNamed(RouteConstants.login);
                          },
                          child: Row(
                            children: [
                              Text(
                                AppTexts.alreadyHaveAccount,
                                style: Config.b3(context).copyWith(
                                  fontSize: 16,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const HorizontalMargin(5),
                              Text(
                                AppTexts.login,
                                style: Config.b3(context).copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: AppColors.black200,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _companyNameNode.dispose();
    _phoneNumberNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, RegistrationState state) {
    state.maybeWhen(orElse: () {
      _overlayEntry?.remove();
    }, loading: () {
      _overlayEntry = showLoadingOverlay(context, _overlayEntry);
    }, registrationError: (message) {
      _overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.errorColor,
          duration: const Duration(seconds: 3),
        ),
      );
    }, registrationSuccessful: (message) {
      _overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.secondaryColor,
          duration: const Duration(seconds: 3),
        ),
      );
      GoRouter.of(context).pushReplacementNamed(RouteConstants.login);
    });
  }
}
