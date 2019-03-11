  enum ElementEnum { Feu, Eau, Terre, Air }

  final elementValues = new EnumValues({
  "5be042b63fb2fa187ff753c0": ElementEnum.Air,
  "5be042943fb2fa187ff753bf": ElementEnum.Feu,
  "5be042c43fb2fa187ff753c1": ElementEnum.Terre,
  "5be042cf3fb2fa187ff753c2": ElementEnum.Eau
  });


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
