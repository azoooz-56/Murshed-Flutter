enum ThemeFlavor {
  light,
  dark,
  system;

  static const defaultValue = ThemeFlavor.system;

  factory ThemeFlavor.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return ThemeFlavor.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

enum LocalDataType {
  secured,
  simple;

  static const defaultValue = LocalDataType.simple;

  factory LocalDataType.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return LocalDataType.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

enum MessageType {
  text,
  suggestion,
  record;

  static const defaultValue = MessageType.text;

  factory MessageType.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return MessageType.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}
