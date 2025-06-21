# items: 19351, 19347, 19354, 19358, 19368, 19346, 19355, 19357
sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Why is it that you have come to this place? If you are coming here to search for [magical scrolls], just get back on that so-called ship you came here on and forget everything you thought you heard.");
    return;
  }
  if($text=~/magical scrolls/i){
    quest::say("Is your hearing failing you!? Unless you [" . quest::saylink("I have something you need", false, "have something I need") . "]. be gone!");
    return;
  }
  if($text=~/have something you need/i){
    quest::say("I must have the scrolls of Gift of Xev, Bristlebane's Bundle, Quiver of Marr, and the Scars of Sigil. If you don't have one of these. leave my sight!  If you do. I think we can work up a fair trade.");
    return;
  }
}

sub EVENT_ITEM {
  while (quest::handin({ 19351 => 1}) || # Bristlebane's bundle
      quest::handin({ 19354 => 1 }) || # Quiver of marr
      quest::handin({ 19358 => 1 }) || # Scars of Sigil
      quest::handin({ 19347 => 1 })) { # Gift of Xev
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19368,19346,19355,19357)); # Item(s): Spell: Boon of Immolation (19368), Spell: Scintillation (19346), Spell: Vocarate: Fire (19355), Spell: Vocarate: Air (19357)
    quest::exp(1000);
  }
}

#END of FILE Zone:overthere  ID:93099 -- Slicia_J`Singe 