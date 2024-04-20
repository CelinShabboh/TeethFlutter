import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/repository/auth_repository.dart';
import '../main_view/main_view.dart';

class Status {
  String? name;
  int? numberOfkids;
  int? numberOfTeeths;
  Status({this.name, this.numberOfTeeths, this.numberOfkids});
}

class DetermineTheStatusController extends GetxController {
  RxList<bool> isCheckedValues =
      <bool>[...List.generate(15, (index) => false)].obs;

  RxList<Status> status = <Status>[
    Status(
      name: 'تطبيق فلور أو سادات (للوقاية)أي طفل بحاجة لها',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'مداواة ترميمية محافظة(حشوات بدون سحب عصب)',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'قلع أسنان أمامية ومؤقتة للأطفال',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'تعويضات أسنان متحركة (بدلة جزئية فقد أقل شي 3 أسنان فقط)',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'لثة (تنظيف لثة تقليح)',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'معالجة أطفال حشوات بتر (سحب عصب جزئي أطفال حصرا)',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'قلع أمامية وخلفية وأطفال',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'تركيب تاج ستانلس ستيل',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: '(تركيب بدلة كاملة (فك علوي وسفلي فكين سوا فقد كل الأسنان',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'مداواة لبية (سحب عصب كامل  أي عصب ملتهب مؤلم مزعج)',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'تعويضات أسنان ثابتة (جسر خلفي فقد سن أو سنين حصرا)',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'قلع أسنان خلفية فقط أو قلع ضرس عقل',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'جراحة فموية قلع سن منطمر',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'عصب ميت ظهور خراج أو احتمال ظهور خراج',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
    Status(
      name: 'جسر أمامي ثابت فقد سن أو سنين أماميات',
      numberOfTeeths: 0,
      numberOfkids: 0,
    ),
  ].obs;
  RxList<Status> statusSend = <Status>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  sendInformation() {
    for (int i = 0; i < 15; i++) {
      if (isCheckedValues[i]) {
        statusSend.add(status[i]);
      }
    }
  }

  Widget createStatusListTile(int index) {
    return ListTile(
      title: Text(status[index].name!), // Ensure non-null name
      trailing: Checkbox(
        value: isCheckedValues[index],
        onChanged: (bool? value) => isCheckedValues[index] = value!,
      ),
    );
  }

  // Function to build a ListView of all 15 ListTiles with checkboxes
  // Widget buildStatusList() {
  //   return ListView.builder(
  //     shrinkWrap: true, // Avoid unnecessary scrolling for short lists
  //     itemCount: 15,
  //     itemBuilder: (context, index) => createStatusListTile(index),
  //   );
  // }
  //  ElevatedButton(
  //       onPressed: () => determineTheStatusController.sendInformation(),
  //       child: Text('Send Information'),
  //     ),
}
