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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Contact Us",
                style: TextStyle(
                  color: Color(Colors.blueGrey.value),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 1,
                  height: 2,
                  // decoration: TextDecoration.underline
                )),
            Container(
              height: 3,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Name',
                labelStyle: TextStyle(
                    color: Color.fromARGB(220, 158, 158, 158), fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Email',
                labelStyle: TextStyle(
                    color: Color.fromARGB(220, 158, 158, 158), fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Type your message here...',
                labelStyle: TextStyle(
                    color: Color.fromARGB(220, 158, 158, 158), fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
              ),
              maxLines: 10,
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
