#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use IO::Handle;

STDOUT->autoflush(1);

#loading JSON file
use JSON;
open my $fh, '<', 'goblinScript.json' or die $!;
my $json_text = do { local $/; <$fh> };
close $fh;
my $data = decode_json($json_text);
#print $data->{cards}[1]{name}, "\n"; - for debugging

my $cards = $data->{cards};

#calling intro
goblin_intro();

#main loop (question OR tarot branches)
while (1) {
    print "Goblin: Do you want to ASK A QUESTION or get a TAROT READING?\n";
    print "You: ";
    #print "[DEBUG] waiting for input...\n";
    my $choice = <STDIN>;
    chomp $choice;
    #print "[DEBUG] choice is: >>>$choice<<<\n";
    last if $choice =~ /^exit$/i;

    if ($choice =~ /tarot|reading|read|draw|card/i) {
        tarot_reading();
    }
    elsif ($choice =~ /ask|question|asked|query/i) {
        chatbot_mode();
    }
    else {
        sleep(1);
        print "Goblin: Jeez, have to make it difficult for me, huh? PICK ONE!!!!\n\n";
    }
}
print "Goblin: Ugh BORRRINGGGGG. Welp, the cards are tired of you anyway.\n"; #if user decided to exit


#SUBROUTINES:
sub tarot_reading {
    print "\nGoblin: Choose your fate (type 1, 2, or 3):\n";
    print "1) One card pull\n";
    print "2) Three cards: Past + Present + Future\n";
    print "3) Three cards: Situation + Action + Outcome\n";
    print "You: ";

    my $pick = <STDIN>;
    chomp $pick;

    if ($pick eq '1') {
        print "The goblin rummages through the deck...\n";
        sleep(1);
        pull_card("Your card whispers:");
    }
    elsif ($pick eq '2') {
        pull_card("The PAST indicates:");
        pull_card("The PRESENT is shown:");
        pull_card("What lies in your FUTURE:");
    }
    elsif ($pick eq '3') {
        pull_card("Analysis of the SITUATION:");
        pull_card("ACTION you can take:");
        pull_card("The OUTCOME:");
    }
    else {
        print "Goblin: Well since you can't follow simple instructions, I'll choose for you.\n";
        pull_card("Random nonsense:");
    }

    sleep(2);
    print "\n";
}


sub chatbot_mode {
    sleep(1);
    print "\nGoblin: Ask away. I tolerate feelings.\n";

    #patterns + responses for asking questions
    my %responses = (
        qr/\b(death|died|die|dead|dying)\b/i => sub {
            return "Goblin: Chin up! Death is truly delicious, if I do say so myself...";
        },
        qr/\b(love|loved|loving)\b/i => sub {
            return "Goblin: Ugh, love? How disgusting.";
        },
        qr/\b(hated|hate|hating)\b/i => sub {
            return "Goblin: Hate? I'm familiar...";
        },
        qr/\b(parent|dad|mom|mother|father|parents|siblings|brother|sister|bro|sis|family|fam)\b/i => sub {
            return "Goblin: Family is the root of all emotional discourse, in my personal opinion. You are best to just forget about it.";
        },
        qr/i am feeling\s+(.+)/i => sub {
            my ($feeling) = $_[0] =~ /i am feeling\s+(.+)/i;
            return "Goblin: Why are you feeling $feeling? Are you trying to be dramatic or just annoying?";
        },
        qr/i feel\s+(.+)/i => sub {
            my ($feeling) = $_[0] =~ /i feel\s+(.+)/i;
            return "Goblin: Feeling $feeling, huh? Disgusting. Tell me more, I suppose.";
        },
        qr/i am\s+(.+)/i => sub {
            my ($state) = $_[0] =~ /i am\s+(.+)/i;
            return "Goblin: You are $state? Fascinating and unfortunate.";
        },
        qr/why/i => sub { return "Goblin: Because the universe is messy. Next question."; },
        qr/how/i => sub { return "Goblin: Idk, look it up?"; },
        qr/when/i => sub { return "Goblin: Check the clock and get back to me... I'm just a goblin, not a time traveller."; },
        qr/where/i => sub {return "Goblin: Ha. Up ur butt, probably."; },
        qr/who/i => sub {return "Goblin: YOUR MOM LOL"; },
        qr/what/i => sub {return "Goblin: Never gotten that question before... Best ask your therapist. Or your mom."},

        qr/\b(work|job|career|office)\b/i => sub {
        return "Goblin: Ah, the eternal grind. I hope your boss is as miserable as you are.";
        },

        qr/\b(school|class|teacher|professor|exam|test)\b/i => sub {
        return "Goblin: School woes... young one, even I had to deal with tedious humans.";
        },

        qr/\b(money|cash|broke|rich|salary|pay)\b/i => sub {
            return "Goblin: Money, money, money… will it ever be enough to impress me?";
        },

        qr/\b(friend|friends|buddy|pal)\b/i => sub {
            return "Goblin: Friends, huh? Or enemies in disguise...?";
        },
    );

    while (1) {
        print "You: ";
        my $input = <STDIN>;
        chomp $input;
        last if $input =~ /^exit$/i;
        last if $input =~ /^back$/i;

        #10% chance goblin ignores logic and pulls tarot card instead
        if (rand() < 0.1) {
            print "Goblin: Hmmmmmm. Hang on. I have to think.\n";
            sleep(1);
            print "Goblin: Yeahhhhhh, so there ain't nothing I can do about ALL that! Card time!\n";
            sleep(1);
            pull_card("The cards interrupt:");
            next;
        }

        #checking patterns
        my $matched = 0;
        for my $pattern (keys %responses) {
            if ($input =~ $pattern) {
                print $responses{$pattern}->($input), "\n";
                $matched = 1;
                last;
            }
        }

        #fallback response
        if (!$matched) {
            print "Goblin: IDK. Elaborate or type 'back'.\n";
        }
    }

    print "\nGoblin: Fine. Back to destiny.\n\n";
}


sub pull_card {
    my ($label) = @_;

    my $card = $cards->[ int(rand(@$cards)) ];
    my $orientation = rand() < 0.5 ? 'upright' : 'reversed';

    my $snark  = random_from($card->{$orientation}->{snark});
    my $meaning = random_from($card->{$orientation}->{meaning});

    print "\n$label\n";
    sleep(1);
    print "$card->{name} ($orientation)\n";
    sleep(2);
    print "Goblin: $snark\n";
    sleep(2);
    print "Goblin: $meaning\n";
    sleep(1);
}


sub random_from {
    my ($array_ref) = @_;
    return $array_ref->[ int(rand(@$array_ref)) ];
}


sub goblin_intro {
    print "\n";
    print "A goblin appears!\n";
    sleep(1);
    print "          ,      ,\n";
    sleep(1);
    print "         /(.-\"\"-.)\\\n";
    print "     |\\  \\/      \\/  /|\n";
    sleep(1);
    print "     | \\ / =.  .= \\ / |\n";
    print "     \\( \\   o\\/o   / )/\n";
    print "      \\_, '-/  \\-' ,_/\n";
    sleep(1);
    print "        /   \\__/   \\\n";
    print "        \\ \\__/\\__/ /\n";
    print "      ___\\ \\|--|/ /___\n";
    sleep(1);
    print "    /`    \\      /    `\\\n";
    print "   /       '----'       \\\n";
    sleep(1);
        
    print "He crawls out of the terminal...\n";
    sleep(2);
    
    print "Shuffling the ancient deck of cards...\n";
    sleep(2);

    print "(Something kinda stinks too but you're not gonna mention it because you are frozen in fear)\n";
    sleep(2);
    
    print "\n";
    print "Type 'exit' at any time to flee.\n";
    sleep(1);
    
    print "\n";
    print "Goblin: Let's see what the fates have in store...\n";
    sleep(2);
    print "\n";
}