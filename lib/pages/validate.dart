import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import 'home.dart';

class Validate extends StatefulWidget {
  const Validate({Key? key}) : super(key: key);

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  TextEditingController textEditingController = TextEditingController();
  bool isEmailCorrect = false;
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  dynamic snackBar = SnackBar(
    duration: const Duration(milliseconds: 1500),
    content: const Text("Your Registration Complete"),
    action: SnackBarAction(
      label: 'Got it',
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isEmailCorrect ? Colors.green : Colors.red,
          centerTitle: true,
          elevation: 2,
          title: const Text("Email Validator"),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your email',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: true,
                  controller: textEditingController,
                  showCursor: true,
                  onChanged: ((value) {
                    setState(() {
                      isEmailCorrect = isEmail(value);
                    });
                  }),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      label: const Text('Email'),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      hintText: 'Duyvothanh@gmail.com',
                      hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                      suffixIcon: isEmailCorrect
                          ? const Icon(Icons.done, color: Colors.green)
                          : const Icon(Icons.close_sharp, color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isEmailCorrect ? Colors.green : Colors.red,
                            width: 1),
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: isEmailCorrect == false
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Future.delayed(const Duration(milliseconds: 1500))
                            .then((value) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const HomePage()));
                        });

                        textEditingController.clear();
                        isEmailCorrect = false;
                        setState(() {});
                      },
                style: ButtonStyle(
                  backgroundColor: isEmailCorrect == false
                      ? MaterialStateProperty.all(
                          const Color.fromARGB(255, 41, 41, 41))
                      : MaterialStateProperty.all(Colors.green),
                ),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Login")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
