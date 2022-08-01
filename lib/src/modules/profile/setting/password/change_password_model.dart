import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangepasswordModel extends ViewModel{
  TextEditingController inputPassword = TextEditingController();
  TextEditingController inputPasswordnew = TextEditingController();
  TextEditingController inputPasswordconfirm = TextEditingController();

  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

}