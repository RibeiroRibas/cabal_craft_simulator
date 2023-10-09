enum Character {
  all("ALL", "Todos"),
  wizard("WI", "Mago"),
  warrior("WA", "Guerreiro"),
  blade("BA", "Duelista"),
  forceBlade("FB", "Espadachim"),
  forceArcher("FA", "Arqueiro"),
  gladiator("GL", "Gladiador"),
  forceShield("FS", "Guardião"),
  forceGunner("FG", "Atirador"),
  darkWizard("DW", "Mago Nego");

  const Character(this.acronym, this.character);

  static Character fromString(String character){
    if(character == all.character){
      return Character.all;
    }

    if(character == wizard.character){
      return Character.wizard;
    }

    if(character == warrior.character){
      return Character.warrior;
    }

    if(character == blade.character){
      return Character.blade;
    }

    if(character == forceBlade.character){
      return Character.forceBlade;
    }

    if(character == forceArcher.character){
      return Character.forceArcher;
    }

    if(character == gladiator.character){
      return Character.gladiator;
    }

    if(character == forceGunner.character){
      return Character.forceGunner;
    }

    if(character == forceShield.character){
      return Character.forceShield;
    }
    return Character.darkWizard;
  }

  final String acronym;
  final String character;

  static List<String> getAll() {
    return [
      all.character,
      wizard.character,
      warrior.character,
      blade.character,
      forceBlade.character,
      forceArcher.character,
      gladiator.character,
      forceShield.character,
      forceGunner.character,
      darkWizard.character
    ];
  }
}
