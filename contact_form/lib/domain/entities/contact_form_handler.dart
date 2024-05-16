import 'package:contact_form/domain/entities/abstract_form.dart';

class ContactFormHandler implements AbstractForm {
  final String name;
  final String email;
  final String subject;
  final String message;

  ContactFormHandler({
    required this.name,
    required this.subject,
    required this.email,
    required this.message, 
  });

  @override
  String submitForm() {
    return 'Name: $name, subject: $subject, Email: $email, Message: $message';
  }
}
