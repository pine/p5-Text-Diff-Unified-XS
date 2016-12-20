#ifdef __cplusplus
extern "C" {
#endif

#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef __cplusplus
} /* extern "C" */
#endif

#define NEED_newSVpvn_flags
#include "ppport.h"

#include <vector>
#include <string>
#include "dtl_helper.hpp"

MODULE = Text::Diff::Unified::XS    PACKAGE = Text::Diff::Unified::XS

PROTOTYPES: DISABLE

void
diff(...)
PROTOTYPE: $$
PPCODE:
{
    SV *fname_a = ST(0);
    SV *fname_b = ST(1);
    char *fname_a_pv = SvPV_nolen(fname_a);
    char *fname_b_pv = SvPV_nolen(fname_b);

    std::vector<std::string> lines_a;
    std::vector<std::string> lines_b;

    SV *tmp = newSVpvs_flags("", SVs_TEMP);

    PerlIO *fp_a = PerlIO_open(fname_a_pv, "r");
    if (fp_a != NULL) {
        while (sv_gets(tmp, fp_a, 0) != NULL) {
            std::string s = SvPV_nolen(tmp);
            s.erase(s.find_last_not_of("\n\r") + 1);
            lines_a.push_back(std::move(s));
        }
        PerlIO_close(fp_a);
    }

    PerlIO *fp_b = PerlIO_open(fname_b_pv, "r");
    if (fp_b != NULL) {
        while (sv_gets(tmp, fp_b, 0) != NULL) {
            std::string s = SvPV_nolen(tmp);
            s.erase(s.find_last_not_of("\n\r") + 1);
            lines_b.push_back(std::move(s));
        }
        PerlIO_close(fp_b);
    }

    std::string diff_str = diff_sequence(lines_a, lines_b);
    SV *diff_sv = sv_2mortal(newSVpv(diff_str.c_str(), 0));

    XPUSHs(diff_sv);
    XSRETURN(1);
}
