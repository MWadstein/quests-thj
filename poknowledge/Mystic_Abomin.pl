#Mystic_Abomin.pl
#Shaman PoP Spells
#The level 64 spell scroll Talisman of Celerity isn't in my copy of the db, so it's not in this quest. Added by renoofturks spell talisman of alacrity
# items: 59615, 29112, 28487, 28488, 28489, 28490, 26945, 26946, 21660, 21661, 28491, 28492, 28493, 28494, 28523, 29131, 28495, 28496, 28497, 28498, 28499, 28531, 26910, 26912, 26913, 26914, 26911, 29132, 26915, 26916, 26917, 26918, 26919

my $maxturnedin = 20;

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("The mystics of New Tanaan embrace your presence among us most kindly - regard us as a friend and mentor, should you need our guidance we have offered our services to the shamans of Norrath that venture in our city. Though our guidance is that of spells native to your world, the mystic scribes in this city may hold some convenience for we do not hold the prejudice of the material world's citizens. Beyond these familiar scrolls, I may be able to aid you further should you bring me a fledgling arcane item from the planes. You will know of that which I speak if and when you stumble upon such a rare and seemingly mundane item. Do not be fooled by its plain appearance - the primordial essence of pure magic resides in these arcane relics and I can be the key to unlock them to the shamanistic powers.");
    return;
  }
}

sub EVENT_ITEM {
  my $turnedin = 0;

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29112 => 1 })) { # Item(s): Ethereal Parchment
      quest::summonitem(quest::ChooseRandom(28487, 28488, 28489, 28490, 26945, 26946,21660, 21661, 28491, 28492, 28493, 28494, 28523)); #Level 61 or 62 Shaman spell, PoP (True Spirit, Agility of the Wrulan, Spear of Torment, Cloud of Grummus, Greater Immobilize, Tnarg's Mending, Focus of Soul, Ancestral Guard, Endurance of the Boar, Talisman of the Wrulan, Talisman of the Tribunal, Replenishment,Petrifying Earth)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29131 => 1 })) { # Item(s): Spectral Parchment
      quest::summonitem(quest::ChooseRandom(59615, 28495, 28496, 28497, 28498, 28499, 28531, 26910, 26912, 26913, 26914, 26911)); #Level 63 or 64 Shaman spell, PoP (Tears of Saryrn, Malicious Decay, Malosinia, Strength of the Diaku, Talisman of the Boar, Blessing of Replenishment, Velium Strike, Talisman of the Diaku, Tiny Terror, Breath of Ultor, Talisman of Alacrity)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if ($turnedin < $maxturnedin) { 
    while(quest::handin({ 29132 => 1 })) { # Item(s): Glyphed Rune Word
      quest::summonitem(quest::ChooseRandom(26915, 26916, 26917, 26918, 26919)); #Level 65 Shaman spell, PoP (Malos, Blood of Saryrn, Focus of the Seventh, Quiescence, Ferine Avatar)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if($turnedin >= 1) {
    quest::emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The shaman then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the shaman calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the shaman. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf.");
    quest::say("Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
  }
}