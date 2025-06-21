# items: 19374, 19378, 19269, 19384, 19386, 19379, 19381, 19215
sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Hello, $name. This place is quite a formidable outpost, but it lacks the comforts of home. Once I have finished collecting some of my [missing scrolls], I'll be able to leave this place and all its hidden dangers.");
    return;
  }
  if($text=~/missing scrolls/i){
    quest::say("Travelers have been bringing back numerous scrolls from the depths of darkness in the Outlands. They contain arcane knowledge specific to our classes. Only four are left that I seek. Keep a wary out for Theft of Thought, Color Slant, Cripple, and Dementia. Return any one of these to me and your reward shall be a scroll that can be found nowhere else.");
    return;
  }
}

sub EVENT_ITEM(){
  while(quest::handin({ 19378 => 1 }) || # Spell: Color Slant
      quest::handin({ 19269 => 1 }) || # Spell: Cripple
      quest::handin({ 19384 => 1 }) || # Spell: Dementia
      quest::handin({ 19374 => 1 })) { # Spell: Theft of Thought
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19386,19379,19381,19215)); # Item(s): Spell: Boon of the Clear Mind (19386), Spell: Clarity II (19379), Spell: Recant Magic (19381), Spell: Wake of Tranquility (19215)
    quest::exp(1000);
  }
}

#END of FILE Zone:overthere  ID:93098 -- Siladdarae_N`Riese 