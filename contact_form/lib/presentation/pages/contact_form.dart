
import 'package:contact_form/domain/entities/contact_form_handler.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const ContactPage(title: 'Flutter Contact Form Page'),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key, required this.title});
  final String title;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
        child: ListView(
          children: <Widget>[
            Text("Contact Us",
                style: TextStyle(
                  color: Color(Colors.blueGrey.value),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 1,
                  height: 2,
                )),
            Container(
              height: 3,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 10),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(220, 158, 158, 158),
                          fontSize: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Email',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(220, 158, 158, 158),
                          fontSize: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(220, 158, 158, 158),
                          fontSize: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Subject cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'Type your message here...',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(220, 158, 158, 158),
                          fontSize: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    ),
                    maxLines: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () {
                      _sendMail();
                    },
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMail() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final contactFormHandler = ContactFormHandler(
        name: _nameController.text,
        userMail: _emailController.text,
        subject: _subjectController.text,
        mailBody: _messageController.text,
      );
      try {
        contactFormHandler.submitForm();
        print('Email sent successfully from contact_form.dart');
      } catch (e) {
        print('Failed to send email. from contact_form.dart');
      }
    } else {
      print('Form validation failed. Cannot send mail.');
    }
  }
}
