# -=-=-=-=-=-=--=-=-=-=-=-=--=-=-=--=-=-=--=-=-=-=-=-=-=-=-=--=-=-=-=-=-=--=-=-=--=-=-=--=-=-=-
# use diagnostics;
# sub foo {
#     my $lex = $_[0];
#     sub bar {
#         print "$lex\n";
#     }
#     bar();
# }
# 
# foo(2); foo(3);
# -=-=-=-=-=-=--=-=-=-=-=-=--=-=-=--=-=-=--=-=-=-=-=-=-=-=-=--=-=-=-=-=-=--=-=-=--=-=-=--=-=-=-
use strict;
use warnings;
use diagnostics;

sub Q3 {
    my $localvariable = shift;
    my $reference = \$localvariable;
    return sub { 
            print ${$reference}, "\n";
        };
}

my @output = (Q3(2), Q3(3));
$output[0]->();
$output[1]->();
$output[0]->();
