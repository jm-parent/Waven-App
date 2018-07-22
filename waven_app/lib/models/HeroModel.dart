class HeroClass{

  final String heroId;
  final String heroName;
  final String heroImgUrl;
  final String background;
  final String portrait;
  final int godId;
  final int attack;
  final int pa;
  final int hp;
  final int pm;
  final int range;
  final int armor;
  final int shield;
  final String lores;
  final List<int> spells;
  final int shushuId;
  final String tag;

  HeroClass({
    this.heroId, this.heroName, this.heroImgUrl, this.background, this.portrait, this.godId, this.attack, this.pa, this.hp, this.pm, this.range, this.armor, this.shield, this.lores, this.spells, this.shushuId,this.tag,
  });

  factory HeroClass.fromJson(Map<String, dynamic> parsedJson){
    var spellsFromJson  = parsedJson['spellIds'];
    List<int> spellsList = new List<int>.from(spellsFromJson);

    return new HeroClass(
      heroId: parsedJson['id'].toString(),
      heroName : parsedJson['name'],
      heroImgUrl : parsedJson ['img'],
      background: parsedJson['background'],
      portrait: parsedJson['portrait'],
      godId: parsedJson['godId'],
      attack: parsedJson['attack'],
      pa: parsedJson['pa'],
      hp: parsedJson['hp'],
      pm: parsedJson['pm'],
      range: parsedJson['range'],
      armor: parsedJson['armor'],
      shield: parsedJson['shield'],
      lores: parsedJson['lore'],
      spells: spellsList,
      shushuId: parsedJson['shushuId'],
      tag : parsedJson ['tag'],

    );
  }
  bool get isValid => heroId != null && heroName != null && heroImgUrl != null;
}

class HeroList {
  final List<HeroClass> heroes;

  HeroList({
    this.heroes,
  });

  factory HeroList.fromJson(List<dynamic> parsedJson) {
    List<HeroClass> heroes = new List<HeroClass>();
    heroes = parsedJson.map((i)=>HeroClass.fromJson(i)).toList();
    return new HeroList(
      heroes: heroes,
    );
  }
}

