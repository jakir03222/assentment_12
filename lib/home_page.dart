import 'package:assignment_12/controller/home_controller.dart';
import 'package:assignment_12/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  String? name, roll, subject;
  final formkey = GlobalKey<FormState>();
  HomeControllor controllor = Get.put(HomeControllor());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Getx page -2'),
            centerTitle: true,
          ),
          body: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: const InputDecoration(hintText: "Name"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty Field";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              name = value.toString();
                            }),
                        TextFormField(
                            decoration: const InputDecoration(hintText: "Roll"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty Field";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              roll = value.toString();
                            }),
                        TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Subject"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty Field";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              subject = value.toString();
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                        }
                        controllor
                            .addStudentData(StudentModel(name, roll, subject));
                      },
                      child: const Text("Add Data")),
                  Expanded(
                    flex: 10,
                    child: GetBuilder<HomeControllor>(
                      builder: (_) => ListView.builder(
                          itemCount: controllor.studentsList.length,
                          itemBuilder: (context, index) => Card(
                                elevation: 0,
                                color: Colors.purple.withOpacity(0.2),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                        ".................................................................................................."),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controllor.studentsList[index].name
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                        ),
                                        Text(
                                          controllor.studentsList[index].roll
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 176, 39, 69)),
                                        ),
                                        Text(
                                          controllor.studentsList[index].subject
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            print("edit");
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 35.0,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.delete,
                                          size: 35.0,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    const Text(
                                        "..................................................................................................."),
                                  ],
                                ),
                              )),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
