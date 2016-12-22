#include <vector>
#include <sstream>

#include <EXTERN.h>
#include <perl.h>
#include <perlio.h>
#include <XSUB.h>

void split_lines(
        const char *s,
        std::vector<std::string> &lines
        )
{
    std::istringstream in(s);

    std::string line;
    while (std::getline(in, line)) {
        lines.push_back(line);
    }
}

void read_lines(
    const char *fname,
    std::vector<std::string> &lines
    )
{
    PerlIO *fp = PerlIO_open(fname, "r");

    if (fp != NULL) {
        SV *tmp = newSVpvs_flags("", SVs_TEMP);
        while (sv_gets(tmp, fp, 0) != NULL) {
            std::string s = SvPV_nolen(tmp);
            s.erase(s.find_last_not_of("\n\r") + 1);
            lines.push_back(s);
        }
        PerlIO_close(fp);
    }
}
