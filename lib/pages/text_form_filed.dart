import 'package:flutter/material.dart';

class TextFormFiled extends StatefulWidget {
   TextFormFiled({super.key});

  @override
  State<TextFormFiled> createState() => _TextFormFiledState();
}

class _TextFormFiledState extends State<TextFormFiled> {
  //mmeberikan akses global key untuk formulir
  final _formkey = GlobalKey<FormState>();
  //membaeri wadah variabel (wadah) untuk textfield
  final TextEditingController _nameController = TextEditingController();
  String _outputName = '';

  @override 
  void dispose() {
    //setelah di submit nilai dari textfield akan terhapus
    _nameController.dispose();
    super.dispose();
  }
  void _submitForm() {
    // in a real app, you'd add validation here (covered in next lesson)
    print('Nama Lengkap: ${_nameController.text}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nama Lengkap ${_nameController.text}')),
      );
      setState(() {
        _outputName = _nameController.text;
      });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Form App')),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            children:  [
              Padding(
                padding: EdgeInsets.all(16.0),
                child:  TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter yout name',
                    border: OutlineInputBorder(),
                  ),
                ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print('Name: ${_nameController.text}');
                  },
                  child: const Text('Get Name'),
                  ),
                   SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: const Text('Submit'),
                  ),
                  Text(
                    'Nama: ${_outputName.isEmpty ? "-" : _outputName}',
                    style: const TextStyle(fontSize: 16),
                  )
            ],
          ),
        ),
      ),
    
    );
  }
}