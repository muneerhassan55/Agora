import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinWithCode extends StatefulWidget {
  const JoinWithCode({super.key});

  @override
  State<JoinWithCode> createState() => _JoinWithCodeState();
}

class _JoinWithCodeState extends State<JoinWithCode> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new_sharp)),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/a1.png'),
                    Text(
                      'Enter  meeting code below',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Example: abc-efg-dhi'),
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Join'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
