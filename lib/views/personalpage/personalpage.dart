import 'package:aoa/service/provider/db/personalmodel.dart';
import 'package:aoa/views/personalpage/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonaPage extends StatefulWidget {
  const PersonaPage({Key? key}) : super(key: key);

  @override
  State<PersonaPage> createState() => _PersonaPageState();
}

class _PersonaPageState extends State<PersonaPage> {
  
  @override
  void initState() {
    Provider.of<PersonalModel>(context, listen: false).read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa"),),
      body: const Body(),
    );
  }
}
