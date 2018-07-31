From: mturquette@baylibre.com (Michael Turquette)
Date: Tue, 31 Jul 2018 15:16:40 -0700
Subject: [asoc:for-4.19 199/204]
 sound/soc//meson/axg-tdm-interface.c:225:8:
 error: implicit declaration of function 'clk_set_duty_cycle';
 did you mean 'clk_set_rate'?
In-Reply-To: <20180731140222.GE5719@sirena.org.uk>
References: <201807210204.l9GJCtSI%fengguang.wu@intel.com>
 <1532112058.26720.62.camel@baylibre.com>
 <1c2a42498ea90428fb6504414154fe3663258ed6.camel@baylibre.com>
 <20180731140222.GE5719@sirena.org.uk>
Message-ID: <CAEG3pNDwK2kdp5L=uqGP6v+dLsxqwreyYefV83M=bFad493xuA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Mark, J?r?me,

On Tue, Jul 31, 2018 at 7:02 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jul 31, 2018 at 10:39:03AM +0200, Jerome Brunet wrote:
>
> > The commit adding the duty-cycle feature in CCF is directly based on v4.18-rc1
> > Do you plan on pulling this in your branch ? or wait for dependency to be sorted
> > out during the merge window maybe ?
>
> I'd like to but I'd rather have an explicit ack from the clock
> maintainers that that's OK and ideally a signed tag.  Though it's taken
> so long that at this point it's not going to be much worse than just
> hoping it gets sorted out in mainline given the lack of branches, it's
> not affecting common platforms.

Consider this my explicit Ack. Signed tag:

git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
clk-core-duty-cycle-for-mark

Let me know if you need anything else.

Best regards,
Mike
