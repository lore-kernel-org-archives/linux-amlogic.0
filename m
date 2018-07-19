From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 19 Jul 2018 10:59:05 +0200
Subject: [PATCH 3/3] clk: meson: clk-pll: drop hard-coded rates from pll
 tables
In-Reply-To: <d4e5e35a-39e0-fe27-8d27-387c5312ca32@baylibre.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
 <20180717095617.12240-4-jbrunet@baylibre.com>
 <d4e5e35a-39e0-fe27-8d27-387c5312ca32@baylibre.com>
Message-ID: <1531990745.26720.34.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, 2018-07-19 at 10:44 +0200, Neil Armstrong wrote:
> We could even add ranges instead of table when we know the PLL supports a well-known continuous dividers range.

I was thinking about this too.
I did not went for it because it would mean yet another rework of the pll
driver, which I did not had time to do now.

I suspect that the min and max value of 'm' the pll can lock on might depend on
the input rate of the DCO, so past the 'n' prediv.

So, to replace the tuple (m, n) table with ranges, I think it would be best to
take the predivider 'n' out first and try to clarify the contraints on the input
rate of the DCO with amlogic ... we can also try and see ;)

> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
