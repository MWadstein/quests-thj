sub get_valid_stacked_handins {
  my $turnin_items_ref = shift;
  my $turnin_stack_size_ref = shift;
  my $lookup_ref = shift;
  my %l_handin = ();
  my $l_total_turned_in = 0;

  foreach my $i (0 .. @{$turnin_items_ref}-1) {  # Loop through handed-in items
    if (@{$turnin_items_ref}[$i]) { # Is this an empty slot?
      if (%{$lookup_ref}{@{$turnin_items_ref}[$i]}) { # does this slot have one of our valid items in it?
        $l_handin{@{$turnin_items_ref}[$i]} += @{$turnin_stack_size_ref}[$i];
        $l_total_turned_in += @{$turnin_stack_size_ref}[$i];
      }
    }
  }

  return \%l_handin, $l_total_turned_in;
}

sub do_stack_handin_quest {
    #Items handed in to the NPC
    my $turnin_items = @_[0];
    my $turnin_stack_size = @_[1];
    #List of valid item IDs that we can accept for turn ins go here
    my $valid_turnin_items = @_[2];
    #List of valid item IDs that we can reward the player
    my $valid_rewards = @_[3];
    #Exp for each turned in item
    my $handin_exp = @_[4];
    #What to say to the player on success for handin
    my $handin_success = @_[5];

    # Create a hash for quick lookup of valid items
    my %valid_lookup = map { $_ => 1 } @$valid_turnin_items;

    # pass the items we turned in along with the ones we want to match to our function and return back any matches
    my ($handin, $total_turned_in) = plugin::get_valid_stacked_handins(\@$turnin_items, \@$turnin_stack_size, \%valid_lookup);

    if ($total_turned_in <= 0) { return; } # if we didnt actually get any returned valid turn ins, exit early

    if(quest::handin({ %{$handin} })) { # did we get any valid handins?
        my %items_to_summon = ();

        # What do we want to say to the player once their handin is completed
        quest::say($handin_success);

        # determine which items to summon based on the total # of items turned in
        for (1 .. $total_turned_in) {
            $items_to_summon{quest::ChooseRandom(@$valid_rewards)} += 1; # Item(s): Spell: Unswerving Hammer (19210), Spell: Heroic Bond (19224), Spell: Sunskin (19420), Spell: Word of Vigor (19206)
        }

        # summon our item(s)
        foreach my $t (keys %items_to_summon) {
            quest::summonitem($t, $items_to_summon{$t}); 
        }

        # give our player experience multiplied by the number of items turned in
        quest::exp($handin_exp * $total_turned_in);  
    }
}