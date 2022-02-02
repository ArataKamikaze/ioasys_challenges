import 'package:rive/rive.dart';

class TasksPageController {
  void playOneShotAnimation(RiveAnimationController controller) {
    if (controller.isActive == false) {
      controller.isActive = true;
    }
  }
}
