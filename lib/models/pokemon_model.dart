import 'dart:convert';

Pokemon pokemonFromMap(String str) => Pokemon.fromMap(json.decode(str));

String pokemonToMap(Pokemon data) => json.encode(data.toMap());

class Pokemon {
  Pokemon({
    required this.base,
    required this.cname,
    required this.ename,
    required this.id,
    required this.jname,
    required this.skills,
    required this.type,
    required this.picture,
    required this.name,
  });

  final Base base;
  final String cname;
  final String ename;
  final int id;
  final String jname;
  final Skills skills;
  final List<String> type;
  final String picture;
  final String name;

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        base: Base.fromMap(json["base"]),
        cname: json["cname"],
        ename: json["ename"],
        id: json["id"],
        jname: json["jname"],
        skills: Skills.fromMap(json["skills"]),
        type: List<String>.from(json["type"].map((x) => x)),
        picture: json["picture"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "base": base.toMap(),
        "cname": cname,
        "ename": ename,
        "id": id,
        "jname": jname,
        "skills": skills.toMap(),
        "type": List<dynamic>.from(type.map((x) => x)),
        "picture": picture,
        "name": name,
      };
}

class Base {
  Base({
    required this.attack,
    required this.defense,
    required this.hp,
    required this.spAtk,
    required this.spDef,
    required this.speed,
  });

  final int attack;
  final int defense;
  final int hp;
  final int spAtk;
  final int spDef;
  final int speed;

  factory Base.fromMap(Map<String, dynamic> json) => Base(
        attack: json["Attack"],
        defense: json["Defense"],
        hp: json["HP"],
        spAtk: json["Sp.Atk"],
        spDef: json["Sp.Def"],
        speed: json["Speed"],
      );

  Map<String, dynamic> toMap() => {
        "Attack": attack,
        "Defense": defense,
        "HP": hp,
        "Sp.Atk": spAtk,
        "Sp.Def": spDef,
        "Speed": speed,
      };
}

class Skills {
  Skills({
    required this.egg,
    required this.levelUp,
    required this.tm,
    required this.transfer,
    required this.tutor,
  });

  final List<int> egg;
  final List<int> levelUp;
  final List<int> tm;
  final List<int> transfer;
  final List<int> tutor;

  factory Skills.fromMap(Map<String, dynamic> json) => Skills(
        egg: List<int>.from(json["egg"].map((x) => x)),
        levelUp: List<int>.from(json["level_up"].map((x) => x)),
        tm: List<int>.from(json["tm"].map((x) => x)),
        transfer: List<int>.from(json["transfer"].map((x) => x)),
        tutor: List<int>.from(json["tutor"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "egg": List<dynamic>.from(egg.map((x) => x)),
        "level_up": List<dynamic>.from(levelUp.map((x) => x)),
        "tm": List<dynamic>.from(tm.map((x) => x)),
        "transfer": List<dynamic>.from(transfer.map((x) => x)),
        "tutor": List<dynamic>.from(tutor.map((x) => x)),
      };
}
