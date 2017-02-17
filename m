From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 17 Feb 2017 11:44:52 -0800
Subject: [PATCH 1/2] mmc: meson-gx: prevent cfg_div_clk from being
 disabled on init
In-Reply-To: <20170216145222.1577-2-webczat@webczatnet.pl> (=?utf-8?Q?=22M?=
 =?utf-8?Q?icha=C5=82?= Zegan"'s
 message of "Thu, 16 Feb 2017 15:52:21 +0100")
References: <20170216145222.1577-1-webczat@webczatnet.pl>
 <20170216145222.1577-2-webczat@webczatnet.pl>
Message-ID: <m2k28o61qj.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Micha? Zegan <webczat@webczatnet.pl> writes:

> At the end of function meson_mmc_clk_init, the cfg_div clock was
> prepared, enabled and configured, but then immediately disabled due to bogus if statements.
> That made later calls to clk_disable_unprepare executed during module removal to fail with a kernel warning.
> Fix that by changing the code to disable clock only when it failed to be configured.
>
> Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>

I believe this one is not needed any more after Heiner's cleanups?

Kevin
