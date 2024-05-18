import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  var name = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.laptop_windows),
        title: const Text("Riverpod Tutorial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                  hintText: "Enter Your Name ",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 98, 0, 116),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: .75, color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = myController.text;
                });
                if (name == "") {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("Invalid Input"),
                        content: const Text("Please Enter Your Name."),
                        actions: [
                          CupertinoButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"),
                          )
                        ],
                        /* shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: SizedBox(
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(flex: 3),
                              const Text("Please Enter Your Name"),
                              const Spacer(flex: 2),
                              CupertinoButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"),
                              ),
                              const Spacer(
                                flex: 1,
                              )
                            ],
                          ),
                        ), */
                      );
                    },
                  );
                }
              },
              style: const ButtonStyle(
                enableFeedback: true,
                fixedSize: WidgetStatePropertyAll(
                  Size(200, 30),
                ),
              ),
              child: const Text("Submit"),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(name == "" ? "" : "Hello $name"),
          ],
        ),
      ),
    );
  }
}
