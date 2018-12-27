class EnumIndex<E> {
  /// Creates an index of [enumValues].
  EnumIndex(List<E> enumValues)
      : _nameToValue = Map<String, E>.fromIterable(
  enumValues,
  key: _getSimpleName
  ),
  _valueToName = Map<E, String>.fromIterable(
  enumValues,
  value: _getSimpleName
  );

  final Map<String, E> _nameToValue;
  final Map<E, String> _valueToName;

  /// Given a [simpleName] finds the corresponding enum value.
  E lookupBySimpleName(String simpleName) => _nameToValue[simpleName];

  /// Returns the simple name for [enumValue].
  String toSimpleName(E enumValue) => _valueToName[enumValue];
}

String _getSimpleName(dynamic enumValue) {
  return enumValue.toString().split('.').last;
}