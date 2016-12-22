#ifndef __TEXT_DIFF_IO_HELPER_HPP__
#define __TEXT_DIFF_IO_HELPER_HPP__

void split_lines(
        const char *s,
        std::vector<std::string> &lines
        );

void read_lines(
    const char *fname,
    std::vector<std::string> &lines
    );

#endif
