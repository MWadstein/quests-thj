#Primalist Saosith.pl
#Beastlord PoP Spells
# items: 29112, 28544, 28545, 21629, 28547, 28548, 29131, 28549, 28550, 21630, 28551, 28552, 29132, 28553, 28554, 59652

my $maxturnedin = 20;

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome, traveler, to New Tanaan. All citizens of New Tanaan have come together in welcoming Norrath's curious travelers who crave knowledge and a path to better themselves individually. What little help I alone can offer is extended to the Beastlords of Norrath, for as I was once one of them in a time long since past. If you are a Beastlord, then perhaps what spells that I have penned, though neither unique nor rare to your world, would be of use. If through your endeavors upon the planes you happen to come across fledgling manuscripts -- similar to those upon which a spell or song is scribed -- then you may return them to me if you wish. I am quite versed in the ways of planar magics relating to the Beastlord's focus.");
    return;
  }
}

sub EVENT_ITEM {
  my $turnedin = 0;

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29112 => 1 })) { # Item(s): Ethereal Parchment
      quest::summonitem(quest::ChooseRandom(28544, 28545, 21629, 28547, 28548)); #Level 61 or 62 Beastlord spell, PoP (Spirit of Arag, Infusion of Spirit, Healing of Sorsha, Scorpion Venom, Spiritual Vigor)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29131 => 1 })) { # Item(s): Spectral Parchment
      quest::summonitem(quest::ChooseRandom(28549, 28550, 21630, 28551, 28552, 59652)); #Level 63 or 64 Beastlord spell, PoP (Arag's Celerity, Spirit of Rellic, Frost Spear, Spiritual Dominion, Spirit of Sorsha)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if ($turnedin < $maxturnedin) {
    while(quest::handin({ 29132 => 1 })) { # Item(s): Glyphed Rune Word
      quest::summonitem(quest::ChooseRandom(28553, 28554)); #Level 65 Beastlord spell, PoP (Sha's Revenge, Ferocity)
      $turnedin++;

      if ($turnedin >= $maxturnedin) {
        last;
      }
    }
  }

  if($turnedin => 1) {
    quest::say("The magic you have given me is quite potent, it should be a simple task to use primal forces to focus its magic into a spell.");
    quest::emote("closes her eyes and the object glows slightly in her hands.");
    quest::say("Here, I hope this will prove of some use to you.");
  }
}