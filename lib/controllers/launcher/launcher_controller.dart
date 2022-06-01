// create class LauncherController
import 'package:ecommerce/controllers/launcher/launcher_Interactor.dart';

class LauncherController {
  LauncherController();

  bool isLoggedIn = false;

  final interactor = LauncherInteractor();
  void hasValidAccssToken(Function(bool isValid) callback) {
    Future(() {
      interactor.hasValidAccssToken((isValid) {
        if (!isValid) {
          // renewAccessToken((isRenewed) {
          //   this.isLoggedIn = isRenewed;
          //   callback(isRenewed);
          // });
          callback(false);
          this.isLoggedIn = false;
        } else {
          this.isLoggedIn = true;
          callback(isValid);
        }
      });
    });
  }

  void renewAccessToken(Function(bool isRenewed) callback) {
    Future(() => interactor.renewAccessToken(callback));
  }
}
