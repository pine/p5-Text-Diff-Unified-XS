package Text::Diff::Unified::XS;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.03";

use Exporter 'import';
our @EXPORT = qw/diff/;

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

sub diff {
    if (ref $_[0] eq 'SCALAR' && ref $_[1] eq 'SCALAR') {
        return _diff_by_strings(@_);
    }

    my $diff = _diff_by_files(@_);
    return _make_diff_header(@_) . $diff if length $diff > 0;
    return $diff;
}

sub _make_diff_header {
    my @mtimes = map { [stat($_)]->[9] } @_;
    return join('',
        '--- ', $_[0], "\t" . localtime($mtimes[0]), "\n",
        '+++ ', $_[1], "\t" . localtime($mtimes[1]), "\n",
    );
}

1;
__END__

=encoding utf-8

=head1 NAME

Text::Diff::Unified::XS - The fast Text::Diff module

=head1 SYNOPSIS

    use Text::Diff::Unified::XS;

    my $diff = diff 'file1.txt', 'file2.txt';
    my $diff = diff \$string1, \$string2;

=head1 DESCRIPTION

Text::Diff::Unified::XS is the fast L<Text::Diff> module implemented by XS.

=head1 BENCHMARK

	Benchmark: running PP, XS for at least 10 CPU seconds...
			PP: 10 wallclock secs (10.73 usr +  0.05 sys = 10.78 CPU) @ 63.73/s (n=687)
			XS: 10 wallclock secs ( 8.90 usr +  1.11 sys = 10.01 CPU) @ 409.29/s (n=4097)
		 Rate   PP   XS
	PP 63.7/s   -- -84%
	XS  409/s 542%   --

=head1 LICENSE

(The MIT license)

Copyright (c) 2016-2017 Pine Mizune

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=head1 AUTHOR

Pine Mizune E<lt>pinemz@gmail.comE<gt>

=cut

