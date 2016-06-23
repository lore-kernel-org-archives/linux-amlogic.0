From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 23 Jun 2016 16:05:49 -0700
Subject: [PATCH v2 0/3] arm64: amlogic: support gxbb clock controller
In-Reply-To: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
 (Michael Turquette's message of "Wed, 22 Jun 2016 19:12:20 -0700")
References: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
Message-ID: <m27fdfwlo2.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Michael Turquette <mturquette@baylibre.com> writes:

> This series breaks out some clean-up patches and the changes to dts from
> v1 of the meson8b[0] and gxbb[1] clk driver series. This was done to
> make it easy for the AmLogic maintainers to take only these patches if
> they want. Additionally there is a shared, immutable branch with the
> gxbb clk driver if the amlogic maintainers wish to merge that into their
> tree:

Thanks for splitting these out.  I've applied the first to to the 'soc'
branch and the 3rd to the 'dt64' branch of the amlogic tree.

> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-s905

I assume you plan to merge this merged for v4.8?

Kevin

> The only functional change was to nest the clock-controller node inside
> of the hiubus node, as suggested by Kevin.

> [0] Link: lkml.kernel.org/g/1465518467-23939-1-git-send-email-mturquette at baylibre.com
> [1] Link: lkml.kernel.org/g/1465518774-26924-1-git-send-email-mturquette at baylibre.com
>
> Michael Turquette (3):
>   arm: meson: explicitly select clk drivers
>   arm64: amlogic: select gxbb clk driver
>   arm64: dts: gxbb clock controller
>
>  arch/arm/mach-meson/Kconfig                 | 3 +++
>  arch/arm64/Kconfig.platforms                | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
>  3 files changed, 11 insertions(+)
