abstract class EmailServices {
  Future<void> sendEmail({
    required String name,
    required String userMail,
    required String subject,
    required String mailBody,
  });
}