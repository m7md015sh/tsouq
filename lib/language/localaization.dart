import 'package:get/get.dart';
import 'package:tsouq/language/ar.dart';
import 'package:tsouq/language/en.dart';
import 'package:tsouq/utils/app_constants.dart';


class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
   AppConstants.ara: ar,
    AppConstants.en:en,
};

}