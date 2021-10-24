class PersonalSeri {
  final String picture;
  final String name;
  final String description;

  PersonalSeri(this.picture, this.name, this.description);

  factory PersonalSeri.fromJson(map) {
    return PersonalSeri(map[0], map[1], map[2]);
  }

  @override
  bool operator ==(Object other) {
    if (other is PersonalSeri) {
      return picture == other.picture;
    }
    return super == other;
  }

  @override
  int get hashCode => picture.hashCode;
}
