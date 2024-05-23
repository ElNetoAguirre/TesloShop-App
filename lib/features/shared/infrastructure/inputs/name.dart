import "package:formz/formz.dart";

// Define input validation errors
// enum NameError {empty, length, format}
enum FullNameError {empty, length}

// Extend FormzInput and provide the input type and error type.
class FullName extends FormzInput<String, FullNameError> {

  // static final RegExp nameRegExp = RegExp(
  //   // r"(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$",
  //   // r"([a-zA-Z]+) ([a-zA-Z]+)",
  //   // r"/^[\p{Letter}\s\-.']+$/u",
  // );

  // Call super.pure to represent an unmodified form input.
  const FullName.pure() : super.pure("");

  // Call super.dirty to represent a modified form input.
  const FullName.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == FullNameError.empty) return "El campo es requerido";
    if (displayError == FullNameError.length) return "Mínimo 6 caracteres";
    // if (displayError == NameError.format) return "El formato no es válido";

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  FullNameError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return FullNameError.empty;
    if (value.length < 6) return FullNameError.length;
    // if (!nameRegExp.hasMatch(value)) return NameError.format;

    return null;
  }
}
