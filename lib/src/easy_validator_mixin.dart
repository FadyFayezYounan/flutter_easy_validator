import 'easy_validator.dart';

/// A mixin that provides easy validation functionality.
///
/// This mixin extends the functionality of the [EasyValidator] class by adding a method to retrieve error messages.
/// The [getErrorMessage] method takes a message and an optional replacement string, and returns the error message with any placeholders replaced by the replacement string.
/// If no replacement string is provided, the method returns the error message as is.
///
/// Example usage:
/// ```dart
/// mixin EasyValidatorMixin on EasyValidator {
///   String getErrorMessage(String message, [String? replacement]) {
///     final msg = errorMessage ?? message;
///     return replacement != null ? msg.replaceAll('{0}', replacement) : msg;
///   }
/// }
/// ```
///
/// See also:
///   - [EasyValidator], the base class that this mixin extends.

mixin EasyValidatorMixin on EasyValidator {
  /// Returns the error message with optional replacement.
  ///
  /// The [message] parameter represents the original error message.
  /// The [replacement] parameter is an optional string that can be used to replace the placeholder '{0}' in the error message.
  /// If [replacement] is provided, the placeholder '{0}' in the error message will be replaced with the [replacement] string.
  /// If [replacement] is not provided, the original error message will be returned as is.
  String getErrorMessage(String message, [String? replacement]) {
    final msg = errorMessage ?? message;
    return replacement != null ? msg.replaceAll('{0}', replacement) : msg;
  }
}
