import 'package:contact_form/domain/entities/abstract_form.dart';

class ContactFormHandler implements AbstractForm {
  final String name;
  final String email;
  final String message;

  ContactFormHandler({
    required this.name,
    required this.email,
    required this.message,
  });

  @override
  String submitForm() {
    return 'Name: $name, Email: $email, Message: $message';
  }
}
