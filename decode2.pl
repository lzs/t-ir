#!/usr/bin/perl

use strict;

my $SHORT = 600;
my $LONG = 1900;
my $MARGIN = 150;
my $INTRO = 10900;
my $INTRO2 = 5000;
my $SEP = 9880;

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
    return "0" if (abs($a - $SHORT) < $MARGIN && abs($b - $SHORT) < $MARGIN);
    return "1" if (abs($a - $SHORT) < $MARGIN && abs($b - $LONG) < $MARGIN);
    return "-" if (abs($a - $SHORT) < $MARGIN && abs($b - $SEP) < $MARGIN);
    return "!" if (abs($a - $INTRO) < $MARGIN && abs($b - $INTRO2) < $MARGIN);
    return "?";
}
