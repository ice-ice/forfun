part of mud;

class Bear extends Encounter with RandomDamage {
  Bear() : super._() {
    this.damage_value = damage_value;
  }
  whenEncounter() {
    return "grr grow, you encountered a Bear!";
  }
}
