#Cavalier_Waut.pl
#Paladin PoP Spells
# items: 59584, 29112, 26945, 21631, 26941, 21652, 26933, 26937, 29131, 26934, 26939, 21654, 26935, 21649, 29132, 21653, 26936, 26938

my $maxturnedin = 20;

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Good day t'ye, traveler. The adepts of New Tanaan 'ave worked very laboriously t'properly welcome ye t'the Plane of Knowledge. Many of us 'ave delved into the past lives of our ventures upon Norrath an' 'ave brought forth from the recesses of our memories the spells that we once wielded as might t'our cause. Now, we no longer be needin' them, but we understand that ye may very well find them t'be of use yet. Oh, and if ye find an item of arcane nature though it seems t'be mundane or useless t'ye, dinnae disregard it! The planes 'old many items that are not what they seem, friend. Return such incorporeal runes and scrolls t'me and I shall make them spells worhty of any crusading paladin!");
    return;
  }
}

sub EVENT_ITEM {
  my $turnedin = 0;

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29112 => 1 })) { # Item(s): Ethereal Parchment
      quest::summonitem(quest::ChooseRandom(26945, 21631, 26941, 21652, 26933, 26937)); #Level 61 or 62 Paladin spell, PoP (Greater Immobilize, Touch of Nife, Crusader's Touch, Force of Akilae, Ward of Nife, Deny Undead)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29131 => 1 })) { # Item(s): Spectral Parchment
      quest::summonitem(quest::ChooseRandom(26934, 26939, 21654, 26935, 21649)); #Level 63 or 64 Paladin spell, PoP (Pious Might, Light of Nife, Aura of the Crusader, Quellious' Word of Serenity, Supernal Cleansing)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if ($turnedin < $maxturnedin) { 
    while(quest::handin({ 29132 => 1 })) { # Item(s): Glyphed Rune Word
      quest::summonitem(quest::ChooseRandom(59584, 21653, 26936, 26938)); #Level 65 Paladin spell, PoP (Shackles of Tunare, Wave of Marr, Brell's Stalwart Shield)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if($turnedin >= 1) {
    quest::emote("accepts the item carefully, studying it with great caution as she handles it in her small hands. The paladin then nods softly to herself as if in recognition or preparation and then closes her eyes. The dwarf's voice begins to spill softly across the area in a divine chant of reverence and prayer. As the dwarf speaks her indeciferable words, the item in her hand seems to grow corporeal and real. Runes form upon it in silvery script that seem to shimmer in the torch-cast light of Myrist. Eventually, she opens her eyes and inspects the item for a final time. Nodding to herself once more in satisfaction, she hands the scroll to you with a warm smile.");
    quest::say("This should de ye good, m'friend, I guarantee! Be careful, though, for this be a powerful spell not t'be underestimated or used without caution or respect.");
  }
}