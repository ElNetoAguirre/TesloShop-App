import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:formz/formz.dart";
import "package:teslo_shop/features/shared/shared.dart";
import "package:teslo_shop/features/auth/presentation/providers/auth_provider.dart";

// 3.- Como consumir el provider
final registerFormProvider =
  StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>((ref) {

  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;

  return RegisterFormNotifier(
    registerUserCallback: registerUserCallback
  );
});

// 2.- Como implementamos un notifier
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String) registerUserCallback;

  RegisterFormNotifier({
    required this.registerUserCallback,
  }) : super(RegisterFormState());

  onFullNameChanged(String value) {
    final newFullName = FullName.dirty(value);
    state = state.copyWith(
      fullName: newFullName,
      isValid: Formz.validate([newFullName, state.email, state.password, state.password2])
    );
  }

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.fullName, state.password, state.password2])
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.fullName, state.email, state.password2])
    );
  }

  onPassword2Changed(String value) {
    final newPassword2 = Password.dirty(value);
    state = state.copyWith(
      password2: newPassword2,
      isValid: Formz.validate([newPassword2, state.fullName, state.email, state.password])
    );
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    await registerUserCallback(state.email.value, state.password.value, state.fullName.value);

    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final fullName = FullName.dirty(state.fullName.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final password2 = Password.dirty(state.password2.value);

    state = state.copyWith(
      isFormPosted: true,
      fullName: fullName,
      email: email,
      password: password,
      password2: password2,
      isValid: Formz.validate([fullName, email, password, password2])
    );
  }
}

// 1.- State del provider
class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final FullName fullName;
  final Email email;
  final Password password;
  final Password password2;

  RegisterFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.fullName = const FullName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.password2 = const Password.pure(),
  });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    FullName? fullName,
    Email? email,
    Password? password,
    Password? password2,
  }) => RegisterFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    password: password ?? this.password,
    password2: password2 ?? this.password2,
  );

  @override
  String toString() {
    return '''
      RegisterFormState:
        isPosting: $isPosting
        isFormPosted: $isFormPosted
        isValid: $isValid
        fullName: $fullName
        email: $email
        password: $password
        password2: $password2
    ''';
  }
}
