/// A typedef representing a validator callback function.
///
/// The [ValidatorCallback] takes a value of type [T] and returns a nullable value of type [T].
/// It is commonly used for validating input values in form fields.
typedef ValidatorCallback<T> = T? Function(T? value);
