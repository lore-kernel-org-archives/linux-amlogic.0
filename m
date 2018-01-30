From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 30 Jan 2018 20:12:06 +0100
Subject: [PATCH] clk: meson: axg: fix the od shift of the sys_pll
In-Reply-To: <20180119020926.246887-1-yixun.lan@amlogic.com>
References: <20180119020926.246887-1-yixun.lan@amlogic.com>
Message-ID: <1517339526.3153.10.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-01-19 at 10:09 +0800, Yixun Lan wrote:
> According to datasheet, the od shift of sys_pll is 16,
> fix the typo which introduced at previous commit.
> 
> Fixes: 78b4af312f91 ('clk: meson-axg: add clock controller drivers')
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to clk-meson next/drivers after fixing the commit message a bit
Thx

Jerome
