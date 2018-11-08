From: sboyd@kernel.org (Stephen Boyd)
Date: Thu, 08 Nov 2018 10:12:43 -0800
Subject: [PATCH v2] clk: meson-gxbb: set fclk_div3 as CLK_IS_CRITICAL
In-Reply-To: <72269086b0ce0be5517c7ffb2bc979c4d17d5cc3.camel@baylibre.com>
References: <20181105230820.3562-1-jbrunet@baylibre.com>
 <154152980131.88331.14307558394241579493@swboyd.mtv.corp.google.com>
 <72269086b0ce0be5517c7ffb2bc979c4d17d5cc3.camel@baylibre.com>
Message-ID: <154170076313.88331.10224163811765573746@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting jbrunet at baylibre.com (2018-11-06 10:49:21)
> On Tue, 2018-11-06 at 10:43 -0800, Stephen Boyd wrote:
> > Quoting Jerome Brunet (2018-11-05 15:08:20)
> > > From: Christian Hewitt <christianshewitt@gmail.com>
> > > 
> > > On the Khadas VIM2 (GXM) and LePotato (GXL) board there are problems
> > > with reboot; e.g. a ~60 second delay between issuing reboot and the
> > > board power cycling (and in some OS configurations reboot will fail
> > > and require manual power cycling).
> > > 
> > > Similar to 'commit c987ac6f1f088663b6dad39281071aeb31d450a8 ("clk:
> > > meson-gxbb: set fclk_div2 as CLK_IS_CRITICAL")' the SCPI Cortex-M4
> > > Co-Processor seems to depend on FCLK_DIV3 being operational.
> > > 
> > > Until commit 05f814402d6174369b3b29832cbb5eb5ed287059 ("clk:
> > > meson: add fdiv clock gates"), this clock was modeled and left on by
> > > the bootloader.
> > > 
> > > We don't have precise documentation about the SCPI Co-Processor and
> > > its clock requirement so we are learning things the hard way.
> > > 
> > > Marking this clock as critical solves the problem but it should not
> > > be viewed as final solution. Ideally, the SCPI driver should claim
> > > these clocks. We also depends on some clock hand-off mechanism
> > > making its way to CCF, to make sure the clock stays on between its
> > > registration and the SCPI driver probe.
> > > 
> > > Fixes: 05f814402d61 ("clk: meson: add fdiv clock gates")
> > > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > 
> > I can toss this into clk-fixes?
> > 
> 
> Sure, it would be great. Thx Stephen.
> 
> 

Awesome, thanks! Applied to clk-fixes.
