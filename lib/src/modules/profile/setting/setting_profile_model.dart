import 'package:deskover_develop/src/apis/user/response/user_response.dart';
import 'package:deskover_develop/src/modules/profile/profile_model.dart';
import 'package:deskover_develop/src/usecases/user_usercase.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingProfileModel extends ViewModel{
  final UserUserCase _userUserCase;

  final Rx<XFile?> imgUpload = Rx<XFile?>(null);

  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController role_name = TextEditingController();
  final TextEditingController ranking_name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rxn<User> user = Rxn();

  SettingProfileModel(this._userUserCase);

  @override
  void initState() {
    super.initState();
    loadProfiled();

  }
  Future<void> loadProfiled()async {
    await _userUserCase.doGetProfiled().then((value) async{
          user.value = value;
          fullname.text = value.fullname!;
          phone.text = value.phone!;
          email.text = value.email!;
          id.text = 'CUSTOMER${value.id}';


    });
    
  }

}