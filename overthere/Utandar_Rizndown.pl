# items: 19315, 19322, 19318, 19319, 19329, 19320, 19324, 19317
sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say(" It is good to see our numbers growing on this land. Welcome! May your travels be as prosperous as mine have. There are many [new powers] to be gained from this land.");
    return;
  }
  if($text=~/new powers/i){
    quest::say(" The new powers are scrolls that give us access to new and powerful spells. My collection is almost complete. I am simply [lacking] four more and then I will return back to the homeland.");
    return;
  }
  if($text=~/lacking/i){
    quest::say(" I am missing the scroll Atol's Spectral Shackles, Tears of Druzzil, Inferno of Al'kabor, and Pillar of Frost. Should you run into one, bring it to me and I'll perform an exchange for another scroll.");
    return;
  }
}

sub EVENT_ITEM {
  while (quest::handin({ 19315 => 1 }) || # Atol's spectral shackles
      quest::handin({ 19322 => 1 }) || # Inferno of Al Kabor
      quest::handin({ 19318 => 1 }) || # Pillar of frost
      quest::handin({ 19319 => 1 })) { # Tears of druzzil
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19329,19320,19324,19317)); # Item(s): Spell: Tears of Solusek (19329), Spell: Abscond (19320), Spell: Thunderbolt (19324), Spell: Tishan`s Discord (19317)
    quest::exp(1000);
  }
}

#END of FILE Zone:overthere  ID:84166 -- Utandar Rizndown