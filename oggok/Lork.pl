# items: 13227, 13355, 13356, 13357, 18840, 5030, 13358
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You $name. We hear of you. We need help. You [help Crakneks] or you [help self]?");
  }
  if($text=~/help crakneks/i) {
    quest::say("Ha!! We hear of great adventurer. You?!! Me no think so. You prove self to Crakneks before you help us. Go to Innoth.. Innotu.. Innooth.. Arghh!! You go to outside Oggok. Find fat alligator bit Lork brother in two. Bring brother, Nork, body back. Then me know you strong.");
  }
  if($text=~/help self/i) {
    quest::say("You help self to leave Oggok before me bash you. We no need cowards.");
  }
  if ($text=~/uglan/i) {
   quest::say("Uglan brave warrior of Oggok. He now in Neriak. Work for dark elves. He NO LIKE dark elves!! He work because we make him. He spy for Crakneks.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13356 => 1)) { # Item: Ogre Arm
    quest::say("Ahhh!! Boohoohoo. Nork!! That you arm. Me will take care of you now. Thank you for killing gator. You must be strong. Now you help Crakneks. We hear.. ohh, poor Nork, we hear trouble begins. Find ogre warrior [Uglan]. Give him this. It broken. He know where you from. Go. Nork.. Poor Nork.");
    quest::faction(232,10); # Faction: Craknek Warriors
    quest::faction(228,10); # Faction: Clurg
    quest::faction(261,-10); # Faction: Green Blood Knights
    quest::summonitem(13357); # Item: Cracked Stein
    quest::exp(50);
    return;
  }
  elsif(plugin::check_handin(\%itemcount, 18840 => 1)) { # Item: Sealed Letter
    quest::say("What this!! So, dark elves think they can bash ogres. Replace with blue orcs. Dumb Zulort friend with dark elf ambassador in Oggok. We kill him. We kill Crushbone dark elf ambassador also. This slow down plan. We need a hero. Me guess you do. You go. Go bring Lork both Crushbone and Oggok dark elf hearts. Then you be hero.");
    quest::faction(232,10); # Faction: Craknek Warriors
    quest::faction(228,10); # Faction: Clurg
    quest::faction(261,-10); # Faction: Green Blood Knights
    quest::exp(100);
    quest::summonitem(5030); # Item: Bronze Two Handed Sword
    return;
  }
  elsif(plugin::check_handin(\%itemcount, 13358 => 1, 13227 => 1)) { #Item: Black Heart, Black Heart
    quest::say("That show dark elves who strongest. Me hope you kill many blue orcs. You Craknek Hero now. You take this. It mine. Hero reward. You great ogre now. Smash best.");
    quest::faction(232,10); # Faction: Craknek Warriors
    quest::faction(228,10); # Faction: Clurg
    quest::faction(261,-10); # Faction: Green Blood Knights
    quest::exp(100);
    quest::summonitem(quest::ChooseRandom(13359,13355,2136,2130,2135,2132,2128)); #Item: Gatorsmash Maul, Crude Stein, Large Patchwork Boots, Large Patchwork Cloak, Large Patchwork Pants, Large Patchwork Sleeves, Large Patchwork Tunic
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49040 -- Lork