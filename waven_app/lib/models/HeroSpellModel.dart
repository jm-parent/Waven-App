class HeroSpell {

  final int id;
  final String name;
  final String img;
  final String desc;
  final int pa;
  final int rangeMin;
  final int rangeMax;
  final int godId;


  HeroSpell(
      {this.id, this.name, this.img, this.desc, this.pa, this.rangeMin, this.rangeMax, this.godId,
      });

  factory HeroSpell.fromJson(Map<String, dynamic> parsedJson){

    return new HeroSpell(
      id: parsedJson['id'],
      name : parsedJson['name'],
      img : parsedJson ['img'],
      desc: parsedJson['desc'],
      pa: parsedJson['pa'],
      rangeMin: parsedJson['rangeMin'],
      rangeMax: parsedJson['rangeMax'],
      godId: parsedJson['godId'],
    );
  }
  bool get isValid => id != null && name != null && img != null;

}



class HeroSpellList {
  final List<HeroSpell> spells;

  HeroSpellList({
    this.spells,
  });

  factory HeroSpellList.fromJson(List<dynamic> parsedJson) {
    List<HeroSpell> spells = new List<HeroSpell>();
    spells = parsedJson.map((i)=>HeroSpell.fromJson(i)).toList();
    return new HeroSpellList(
      spells: spells,
    );
  }
}