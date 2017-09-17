#!/usr/bin/perl

use strict;

my $PULSE = 400;
my $SHORT = 475;
my $LONG = 1366;
my $MARGIN = 0.20;
my $INTRO = 3500;
my $INTRO2 = 1750;
my $SEP = 9900;

    my @data;

    while (<>) {
        chomp;
        my @chars = split / +/;
        foreach my $i (@chars) {
            if ($i =~ /\d+/) {
                push @data, $i;
            }
        }
    }

    shift @data;
    my $cnum = 0;

    while (1) {
        my $a = shift @data;
        my $b = shift @data;
        last if (!defined $a || !defined $b);
        my $char = decode($a, $b);
        print $char;
        if ($char eq '0' || $char eq '1') {
            $cnum++;
        }
        else {
            print "\n";
            $cnum = 0;
        }
        if ($cnum >= 8) {
            print "\n";
            $cnum = 0;
        }
    }
    print "\n";

sub decode($$)
{
    my ($a, $b) = @_;
    return "0" if (abs($a - $PULSE) < $PULSE*$MARGIN && abs($b - $SHORT) < $SHORT*$MARGIN);
    return "1" if (abs($a - $PULSE) < $PULSE*$MARGIN && abs($b - $LONG) < $LONG*$MARGIN);
    return "-" if (abs($a - $PULSE) < $PULSE*$MARGIN && abs($b - $SEP) < $SEP*$MARGIN);
    return "!" if (abs($a - $INTRO) < ($INTRO*$MARGIN) && abs($b - $INTRO2) < ($INTRO2*$MARGIN));
    return "?";
}
