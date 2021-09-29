var mockdata = [
  PersonalSeri(
    "https://cdn-ali-img-staticbz.shanhutech.cn/a/201906/18/5d08d5b77d88e.jpg",
    "Halo",
    "",
  ),
  PersonalSeri(
    "https://cdn-ali-img-staticbz.shanhutech.cn/a/201906/24/5d10b19bbdafe.jpg",
    "Hola",
    "",
  ),
  PersonalSeri(
    "https://cdn-ali-img-staticbz.shanhutech.cn/a/201906/24/5d10b8c21cf98.jpg",
    "Halio",
    "",
  ),
  PersonalSeri(
    "https://cdn-ali-img-staticbz.shanhutech.cn/a/201906/25/5d1201167ab03.jpg",
    "Hiloa",
    "",
  ),
];

class PersonalSeri {
  final String picture;
  final String name;
  final String description;

  PersonalSeri(this.picture, this.name, this.description);

  factory PersonalSeri.fromJson(map) {
    return PersonalSeri(map[0], map[1], map[2]);
  }
}
