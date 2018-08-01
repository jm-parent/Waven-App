class HeroClassV2 {

  final String racedesc;
  final int heroid;
  final String heroName;
  final String img;
  final String background;
  final String portrait;
  final String sortactif;
  final int godid;
  final String passifrelatifdesc;
  final String passifagressifdesc;
  final int hp;
  final int attack;
  final int pm;
  final int pa;
  final int range;
  final int armor;
  final int shield;
  final String lore;
  final int shushuid;
  final String tag;
  final int entrave;
  final int tank;
  final int protection;
  final int soins;
  final int degats;
  final int placement;
  final int invocation;
  final int amelioration;
  final int maitrise;


  HeroClassV2(this.racedesc, this.heroid, this.heroName, this.img,
      this.background, this.portrait, this.sortactif, this.godid,
      this.passifrelatifdesc, this.passifagressifdesc, this.hp, this.attack,
      this.pm, this.pa, this.range, this.armor, this.shield, this.lore,
      this.shushuid, this.tag, this.entrave, this.tank, this.protection,
      this.soins, this.degats, this.placement, this.invocation,
      this.amelioration, this.maitrise);

  factory HeroClassV2.fromJson(Map<String, dynamic> parsedJson){

    return new HeroClassV2(
        parsedJson['racedesc'],
        parsedJson['heroid'],
        parsedJson['heroname'],
        parsedJson['img'],
        parsedJson['background'],
        parsedJson['portrait'],
        parsedJson['sortactif'],
        parsedJson['godid'],
        parsedJson['passifrelatifdesc'],
        parsedJson['passifagressifdesc'],
        parsedJson['hp'],
        parsedJson['attack'],
        parsedJson['pm'],
        parsedJson['pa'],
        parsedJson['range'],
        parsedJson['armor'],
        parsedJson['shield'],
        parsedJson['lore'],
        parsedJson['shushuid'],
        parsedJson['tag'],
        parsedJson['entrave'],
        parsedJson['tank'],
        parsedJson['protection'],
        parsedJson['soins'],
        parsedJson['degats'],
        parsedJson['placement'],
        parsedJson['invocation'],
        parsedJson['amelioration'],
        parsedJson['maitrise']);
  }

  @override
  String toString() {
    return 'HeroClassV2{racedesc: $racedesc, heroid: $heroid, heroName: $heroName, img: $img, background: $background, portrait: $portrait, godid: $godid, passifrelatifdesc: $passifrelatifdesc, passifagressifdesc: $passifagressifdesc, hp: $hp, attack: $attack, pm: $pm, pa: $pa, range: $range, armor: $armor, shield: $shield, lore: $lore, shushuid: $shushuid, tag: $tag, entrave: $entrave, tank: $tank, protection: $protection, soins: $soins, degats: $degats, placement: $placement, invocation: $invocation, amelioration: $amelioration, maitrise: $maitrise}';
  }


}

class HeroListV2 {
  final List<HeroClassV2> heroes;

  HeroListV2({
    this.heroes,
  });

  factory HeroListV2.fromJson(List<dynamic> parsedJson) {
    List<HeroClassV2> heroes = new List<HeroClassV2>();
    heroes = parsedJson.map((i) => HeroClassV2.fromJson(i)).toList();
    return new HeroListV2(
      heroes: heroes,
    );
  }
}

