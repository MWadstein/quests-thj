#Frist_Furtun, Firiona Vie
# items: 19203, 19205, 19209, 19212, 19233, 19210, 19224, 19420, 19206

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail to thee, adventurer! I have been sent to this new land by the Clerics of Tunare in search of the new arcane magiks said to exist beyond this outpost. I myself once searched the nearby Outlands, but to go any further would lead to my certain death. Lately, the dangers have proven to be too much for adventurers and ones like myself. Have you also ventured to this land in search of these [new magiks]?");
    return;
  }
  if($text=~/new magiks/i) {
    quest::say("Ahh, wonderful! The more souls who search for these scrolls, the sooner I'll be able to return home and share this knowledge. The magiks are in the form of scrolls held by the strongest creatures of the Outlands. You will probably have the best luck searching in the darkest depths of the dungeons beyond this outpost. You might want to talk to the residents of this outpost for locations of these dreadful places. If you should happen to have any [duplicate scrolls], please come speak to me. I might be interested in working out a trade for a scroll you do not yet have.");
    return;
  }
  if($text=~/duplicate scrolls/i) {
    quest::say("Great! The scrolls I am interested in are those of Death Pact, Upheaval, Yaulp IV, and Reckoning. If you bring me any one of these scrolls, I'll let you reach into my bag and pull out one of the four very rare scrolls that have come into my possession.");
    return;
  }
}

sub EVENT_ITEM {
  while(quest::handin({ 19203 => 1 }) || # Death Pact
    quest::handin({ 19205 => 1 }) || # Upheaval
    quest::handin({ 19209 => 1 }) || # Yaulp IV
    quest::handin({ 19212 => 1 }) || # Reckoning
    quest::handin({ 19233 => 1 })) { # Upheaval
        quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
        quest::summonitem(quest::ChooseRandom(19210,19224,19420,19206)); # Item(s): Spell: Unswerving Hammer (19210), Spell: Heroic Bond (19224), Spell: Sunskin (19420), Spell: Word of Vigor (19206)
        quest::exp(1000);
  }
}

#END of FILE Zone:firiona  ID:84177 -- Frist Furtun