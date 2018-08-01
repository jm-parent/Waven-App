class HeroSpellV2 {

  final int     spellid;
  final String  spellname;
  final String  spellicon;
  final String  spelldesc;
  final String  spellgif;
  final int     godid;
  final int     shushuid;
  final int     compid;
  final int     pacost;
  final int     spellrangemin;
  final int     spellrangemax;
  final String     spelladdeffectid;
  final String     spellremoveeffectid;
  final String     spellelementgen;
  final String     spellelementid;
  final int     spellpowergen;


  HeroSpellV2(this.spellid, this.spellname, this.spellicon, this.spelldesc,
      this.spellgif, this.godid, this.shushuid, this.compid, this.pacost,
      this.spellrangemin, this.spellrangemax, this.spelladdeffectid,
      this.spellremoveeffectid, this.spellelementgen, this.spellelementid,
      this.spellpowergen);

  factory HeroSpellV2.fromJson(Map<String, dynamic> parsedJson){

    return new HeroSpellV2(
      parsedJson['spellid'],
      parsedJson['spellname'],
      parsedJson ['spellicon'],
      parsedJson['spelldesc'],
      parsedJson['spellgif'],
      parsedJson['godid'],
      parsedJson['shushuid'],
      parsedJson['compid'],
      parsedJson['pacost'],
      parsedJson['spellrangemin'],
      parsedJson ['spellrangemax'],
      parsedJson['spelladdeffectid'].toString(),
      parsedJson['spellremoveeffectid'].toString(),
      parsedJson['spellelementgen'].toString(),
      parsedJson['spellelementid'].toString(),
      parsedJson['spellpowergen'],
    );
  }

  bool get isValid => spellid != null && spellname != null;

}

class HeroSpellV2List {
  final List<HeroSpellV2> spells;

  HeroSpellV2List({
    this.spells,
  });

  factory HeroSpellV2List.fromJson(List<dynamic> parsedJson) {
    List<HeroSpellV2> spells = new List<HeroSpellV2>();
    spells = parsedJson.map((i)=>HeroSpellV2.fromJson(i)).toList();
    return new HeroSpellV2List(
      spells: spells,
    );
  }
}