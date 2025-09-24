enum Vocation {
  raider(
    title: 'Terminal Raider',
    description: 'Adapt in terminal commands to trigger traps',
    weapon: 'Terminal',
    ability: 'Shellshock',
    image: 'terminal_raider.jpg',
  ),
  junkie(
    title: 'Code Junkie ',
    description: 'Uses code to infiltrate enemy defenses',
    weapon: 'React 99',
    ability: 'Higher Oder Overdrive',
    image: 'code_junkie.jpg',
  ),
  ninja(
    title: 'UX Ninja',
    description: 'Uses stealth and agility to outmaneuver opponents',
    weapon: 'Infused Katana',
    ability: 'Shadow Clone',
    image: 'ux_ninja.jpg',
  ),
  wizard(
    title: 'Algo Wizard',
    description: 'Masters algorithms to cast powerful spells',
    weapon: 'Spellbook',
    ability: 'Time Complexity',
    image: 'algo_wizard.jpg',
  );

  //CONSTRUCTOR
  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });

  // PROPERTIES
  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}
