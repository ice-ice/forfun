part of mud;

class Environment {
  String _name;
  Encounter encounter = new Encounter({});
  Environment(name) {
    this.name = name;
  }

  String stumbleUpon() {
    this.encounter = new Encounter({});
    var done_damage = damage;
    var interaction = "${this._name} you stumbled upon ... ${this.encounter?.whenEncounter()}";
    if (done_damage > 0) {
      interaction = "${interaction} <br /> You have ${done_damage} damage!";
    }
    return interaction;
  }

  get damage => this.encounter.damage_value;

  set name(name) {
    this._name = "${name} - ";
  }
}
