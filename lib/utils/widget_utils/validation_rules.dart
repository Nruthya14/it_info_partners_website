class ValidationRules {
  //Field Required
  static String? fieldRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  //Dropdown Field Required
  static String? fieldRequiredDropdown<T>(T? value) {
    if (value == null) {
      return 'This field is required';
    }
    return null;
  }
}
