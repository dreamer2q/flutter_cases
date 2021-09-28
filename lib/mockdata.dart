var mockdata = [
  PersonalSeri("assets/1.jpg", "MikuOki", "这里是一个简介"),
  PersonalSeri("assets/2.jpg", "Ahlo", "简单的介绍"),
  PersonalSeri("assets/3.jpg", "Mki", "我是奇怪的？"),
  PersonalSeri("assets/1.jpg", "Oki", "怎么能这样说呢？"),
];

class PersonalSeri {
  final String picture;
  final String name;
  final String description;

  PersonalSeri(this.picture, this.name, this.description);
}
