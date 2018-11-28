From: sboyd@kernel.org (Stephen Boyd)
Date: Tue, 27 Nov 2018 18:05:54 -0800
Subject: [GIT PULL] clk: meson: updates for v4.21
In-Reply-To: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
References: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Message-ID: <154337075410.88331.3258607435538015529@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Neil Armstrong (2018-11-23 07:23:33)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks.
> 
> It covers essentially Meson GX Video clocks, Meson8b CPU clocks
> and 2 bindings changes.
> 
> Thanks,
> Neil
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-1
> 
> for you to fetch changes up to a7d19b05ce817d60ae672c4c112e77892978dc3c:
> 
>   clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 15:11:58 +0100)
> 
> ----------------------------------------------------------------
> Update for meson clocks targeted at v4.21
> - Add GX video clocks
> - Switch to HHI syscon for meson8b

This never seemed to be resolved on the mailing list. I'm still waiting
to see what happens with the syscon and binding. I guess I need to look
at these PRs a little closer to make sure nothing else it outstanding on
the list.

> - Fix meson8b cpu clock
> - Add support for meson8b CPU scaling
> - Add Meson8b CPU post-dividers clocks

These other ones look OK.
