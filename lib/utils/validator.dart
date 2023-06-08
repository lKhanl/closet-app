import 'package:MyCombinationsApp/utils/snackbar_utils.dart';

void validate(Map<String, String> mapOfArguments) {
  String errorMessage = '';
  mapOfArguments.forEach((key, value) {
    if (value.isEmpty) {
      errorMessage += '\u2022 $key cannot be empty\n';
    }
  });
  if (errorMessage.isNotEmpty) {
    SnackbarUtils.showError(errorMessage);
  }
}
