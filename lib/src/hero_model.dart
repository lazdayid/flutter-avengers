
class HeroModel {

  int id;
  String title;
  String image;

  HeroModel(this.id, this.title, this.image);

  HeroModel.fromJson(Map<String, dynamic> result)
      : id = result['id'],
        title = result['title'],
        image = result['image'];

}