import 'package:assignment_12/model/student_model.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  List<StudentModel> studentsList = [];
  void addStudentData(StudentModel data) {
    studentsList.add(data);
    update();
  }
}
