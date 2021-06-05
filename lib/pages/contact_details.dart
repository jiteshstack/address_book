import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  final dynamic name;

  const ContactDetails({Key key, this.name}) : super(key: key);
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Container(
        child: Text(''),
      ),
    );
  }
}
