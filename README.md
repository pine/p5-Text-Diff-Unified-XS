# NAME

Text::Diff::Unified::XS - It's new $module

# SYNOPSIS

    use Text::Diff::Unified::XS;

# DESCRIPTION

Text::Diff::Unified::XS is the fast [Text::Diff](https://metacpan.org/pod/Text::Diff) module implemented by XS.

# BENCHMARK

        Benchmark: running PP, XS for at least 10 CPU seconds...
                        PP: 10 wallclock secs (10.73 usr +  0.05 sys = 10.78 CPU) @ 63.73/s (n=687)
                        XS: 10 wallclock secs ( 8.90 usr +  1.11 sys = 10.01 CPU) @ 409.29/s (n=4097)
                 Rate   PP   XS
        PP 63.7/s   -- -84%
        XS  409/s 542%   --

# LICENSE

(The MIT license)

Copyright (c) 2016 Pine Mizune

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

# AUTHOR

Pine Mizune <pinemz@gmail.com>
