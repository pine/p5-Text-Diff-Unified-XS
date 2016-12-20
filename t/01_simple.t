use strict;
use warnings FATAL => 'all';
use utf8;

use File::Spec;
use File::Basename qw/dirname/;
use File::Slurp;
use Test::More;

use Text::Diff::Unified::XS;

subtest basic => sub {
    my $data_dir = File::Spec->catfile(dirname(__FILE__), 'data');
    my $file_a   = File::Spec->catfile($data_dir, 'a.txt');
    my $file_b   = File::Spec->catfile($data_dir, 'b.txt');
	my $diff_str = read_file(File::Spec->catfile($data_dir, 'diff.txt'));

    is diff($file_a, $file_b), $diff_str;
};

done_testing;

