# items: 19203, 19205, 19209, 19212, 19210, 19224, 19420, 19206

# List of valid item IDs
my @valid_turnin_items = (19203, 19205, 19209, 19212, 19233);

sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Hello, $name. It's nice to see more able bodies around this part of the outland. We came here in search of the magical powers that are supposed to exist in the ruins and dungeons of this area. We need you to bring back evidence of this power in the form of scrolls. I can't offer much coin in payment, but I do have some rare scrolls I already brought back that may interest you, if you wish to [help in the search].");
    return;
  }
  if($text=~/help in the search/i){
    quest::say("Excellent! Here is what we are still seeking. The scrolls of Death Pact, Upheaval, Yaulp IV, and Reckoning. If you return one of these to me. I'll release one of my rare scrolls to you.");
    return;
  }
}

sub EVENT_ITEM {
  # store our item handin variables
  my @turnin_charges = ($item1_charges, $item2_charges, $item3_charges, $item4_charges);
  my @turnin_slots = ($item1, $item2, $item3, $item4);

  # Create a hash for quick lookup of valid items
  my %valid_lookup = map { $_ => 1 } @valid_turnin_items;

  my %handin = ();
  my $total_turned_in = 0;
  foreach my $i (0 .. $#turnin_slots) {  # Loop through handed-in items
    if ($turnin_slots[$i]) { # skip over empty slots
      if ($valid_lookup{$turnin_slots[$i]}) { # If item is valid, add to our handin
          $handin{$turnin_slots[$i]} += $turnin_charges[$i];
          $total_turned_in += $turnin_charges[$i];
      }
    }
  }

  if(quest::handin({ %handin })) { # our total items to handin
    my %items_to_summon = ();

    # What do we want to say to the player once their handin is completed
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
    
    # determine which items to summon based on the total # of items turned in
    for (1 .. $total_turned_in) {
      $items_to_summon{quest::ChooseRandom(19210, 19224, 19420, 19206)} += 1; # Item(s): Spell: Unswerving Hammer (19210), Spell: Heroic Bond (19224), Spell: Sunskin (19420), Spell: Word of Vigor (19206)
    }

    # summon our item(s)
    foreach my $t (keys %items_to_summon) {
      quest::summonitem($t, $items_to_summon{$t});
    }

    # give our player experience multiplied by the number of items turned in
    quest::exp(1000 * $total_turned_in);  
  }
}

#END of FILE Zone:overthere  ID:93103 -- Brinaa_Darkpact 