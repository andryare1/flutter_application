import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    final TextSelection newSelection = newValue.selection;

    if (newValue.text.contains(',')) {
      truncated = newValue.text.replaceFirst(',', '.');
    }
    return TextEditingValue(text: truncated, selection: newSelection);
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  String? selectedValue;
  bool? checkBoxValue;
  String radioValue = 'Radio 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form App"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          autofocus: true,
                          inputFormatters: [
                            CommaTextInputFormatter()
                            //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            //LengthLimitingTextInputFormatter(4)
                          ],
                          controller: loginTextFieldController,
                          decoration: const InputDecoration(
                            hintText: 'Login',
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Введите логин';
                            }
                            return null;
                          },
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: DropdownButtonFormField(
                          value: selectedValue,
                          items: const [
                            DropdownMenuItem(value: "USA", child: Text("USA")),
                            DropdownMenuItem(
                                value: "Canada", child: Text("Canada")),
                            DropdownMenuItem(
                                value: "Brazil", child: Text("Brazil")),
                            DropdownMenuItem(
                                value: "England", child: Text("England")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: passwordTextFieldController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Введите пароль';
                            }
                            return null;
                          },
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                            tristate: true,
                            value: checkBoxValue,
                            onChanged: (value) {
                              setState(() {
                                checkBoxValue = value ?? false;
                              });
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Radio(
                            value: 'Radio 1',
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = value ?? '';
                              });
                            }),
                        Radio(
                            value: 'Radio 2',
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = value ?? '';
                              });
                            }),
                        Radio(
                            value: 'Radio 3',
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = value ?? '';
                              });
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: submitForm, child: const Text('Войти'))
                      ],
                    ),
                  )
                ],
              ))),
    );
  }

  void submitForm() async {
    if (formKey.currentState?.validate() ?? false) {
      await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Данные формы'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Логин: ${loginTextFieldController.text}'),
                    Text('Логин: ${passwordTextFieldController.text}'),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Ok')),
                ],
              ));

      // final snackBar = SnackBar(
      //   content: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('Логин: ${loginTextFieldController.text}'),
      //       Text('Логин: ${passwordTextFieldController.text}'),
      //     ],
      //   ),
      //   action: SnackBarAction(label: 'Ok', onPressed: () {}),
      // );

      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
