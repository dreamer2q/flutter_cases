class PersonSeri {
  final String img;
  final String name;
  final String desc;

  PersonSeri(this.img, this.name, this.desc);

  factory PersonSeri.fromJson(map) {
    return PersonSeri(map[0], map[1], map[2]);
  }

  @override
  bool operator ==(Object other) {
    if (other is PersonSeri) {
      return img == other.img;
    }
    return super == other;
  }

  @override
  int get hashCode => img.hashCode;
}
