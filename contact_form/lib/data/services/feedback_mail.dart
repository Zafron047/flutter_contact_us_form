import 'dart:convert';
import 'package:contact_form/data/services/email_services.dart';
import 'package:http/http.dart' as http;

class FeedbackMail implements EmailServices {
  @override
  Future<void> sendEmail({
    required String name,
    required String userMail,
    required String subject,
    required String mailBody,
  }) async {
    final serviceId = 'service_h0ireza';
    final templateId = 'template_8o55egs';
    final publicKey = 'yjOezwjD04N5EUiIf';

    final uri = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      uri,
      headers: {
        'Origin': 'http://localhost:3000',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'name': name,
          'userMail': userMail,
          'subject': subject,
          'mailBody': mailBody,
        },
      }),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print('Email sent successfully from EmailService.sendEmail()');
    } else {
      print('Failed to send email. from EmailService.sendEmail()');
    }
  }
}
