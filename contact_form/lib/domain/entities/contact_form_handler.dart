import 'package:contact_form/data/services/feedback_mail.dart';
import 'package:contact_form/domain/entities/abstract_form.dart';

class ContactFormHandler implements AbstractForm {
  final String name;
  final String userMail;
  final String subject;
  final String mailBody;

  ContactFormHandler({
    required this.name,
    required this.subject,
    required this.userMail,
    required this.mailBody,
  });

  @override
  void submitForm() {
    FeedbackMail().sendEmail(
      name: name,
      userMail: userMail,
      subject: subject,
      mailBody: mailBody,
    );
  }
}
