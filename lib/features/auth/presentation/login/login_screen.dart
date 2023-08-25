import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_tn_boutique/features/auth/presentation/login/states/login_bloc.dart';

import '../../../../../core/common/button/buttons.dart';
import '../../../../../core/common/textfield/textfield.dart';
import '../../../../../core/themes/color_scheme.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../../core/utils/input_validation.dart';
import '../../../../../core/utils/loading_overlay.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../router/router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with InputValidationMixin, LoadingOverlayMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final isValidate = ValueNotifier<bool>(false);
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _phoneNumberNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  OverlayEntry? _overlayEntry;
  var _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalMargin(50),
                  Text(AppTexts.login,
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
                    controller: _phoneNumberController,
                    hintText: AppTexts.phoneNumber,
                    inputType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    focusNode: _phoneNumberNode,
                    textInputAction: TextInputAction.done,
                    validator: isValidate.value
                        ? combine([
                            withMessage(AppTexts.phoneNumberInvalid,
                                isInvalidPhoneNumber),
                            withMessage(AppTexts.fieldEmpty("Phone number"),
                                isTextEmpty),
                          ])
                        : null,
                  ),
                  const VerticalMargin(20),
                  AppTextField(
                    controller: _passwordController,
                    hintText: AppTexts.password,
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    obscureText: !_passwordVisible,
                    focusNode: _passwordNode,
                    textInputAction: TextInputAction.done,
                    validator: isValidate.value
                        ? combine([
                            withMessage(
                                AppTexts.passwordInvalid, isPasswordInvalid),
                            withMessage(
                                AppTexts.fieldEmpty("Password"), isTextEmpty),
                          ])
                        : null,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: _listener,
                    builder: (context, state) {
                      return AppButton(
                        text: AppTexts.login,
                        onTap: () {
                          _phoneNumberNode.unfocus();
                          if (_formKey.currentState!.validate()) {
                            isValidate.value = true;
                            context.read<LoginBloc>().add(LoginUser(
                                phoneNumber: _phoneNumberController.text,
                                password: _passwordController.text));
                          } else {
                            isValidate.value = false;
                          }
                          //sid  MG6fe4fa96fc49b56d102b08ea74ab9638
                          // acc ID  AC7a35033de10ac050ed609058952fd7f9
                          // auth:   0f7d5ad580b27b93e2e17bd7b56e15cc
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
                          GoRouter.of(context)
                              .pushNamed(RouteConstants.register);
                        },
                        child: Column(
                          children: [
                            Text(
                              AppTexts.notRegister,
                              style: Config.b3(context).copyWith(
                                fontSize: 16,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            const HorizontalMargin(5),
                            Text(
                              AppTexts.createAccount,
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
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _phoneNumberNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, LoginState state) {
    state.maybeWhen(orElse: () {
      _overlayEntry?.remove();
    }, loading: () {
      _overlayEntry = showLoadingOverlay(context, _overlayEntry);
    }, loginError: (message) {
      _overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.errorColor,
          duration: const Duration(seconds: 3),
        ),
      );
    }, loginSuccessful: (message) {
      _overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.secondaryColor,
          duration: const Duration(seconds: 3),
        ),
      );
      GoRouter.of(context).pushReplacementNamed(RouteConstants.home);
    });
  }
}
