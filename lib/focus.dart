import 'package:flutter/material.dart';

class FocusForm extends StatefulWidget {
  const FocusForm({super.key});

  @override
  State<StatefulWidget> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField()),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  focusNode: focusNode,
                )),
              ],
            ),
            Focus(
              descendantsAreTraversable: false,
              canRequestFocus: false,
              onFocusChange: (value) {
                print('$value');
              },
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        focusNode.requestFocus();
                      },
                      child: const Text('Фокус на второе поле')),
                ),
              ],
            ),
            FocusTraversalGroup(
                policy: OrderedTraversalPolicy(),
                child: Column(
                  children: [
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(2),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                        ],
                      ),
                    ),
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(1),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                        ],
                      ),
                    ),
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(3),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
