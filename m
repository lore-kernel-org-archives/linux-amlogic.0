Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96ACCDB474
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Oct 2023 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oKo3NJ+cJiZnYV/ElbS1Bw3yf/wnYtnMnIj+Xqdw5SQ=; b=qnaj5AkQiu3xsO
	VlXpNLoy+/chRdBvvcQbLJGst8RCP7hVy3z8q6xfnSe+NiQtNXsaoM8OvXtQjtMFzumTmFLaa6E7u
	B3eYJi4uQq9+isiU/B7ElJALxNkmpgKoA5kaz1d9aoGnccmSVRT2My3FoyXjQChV9SOLWNe92I90t
	mGZ3vHD2GyP3jyJb4bp6BZL4K0WBuBdAbOGYfyOE1FF9pgxRtNiOgYpX2ZWoMLO24+8xJYA5R7gfF
	hR1m+VyqM983nqu9RUwKYBxb7hPr5Q1tcrvDG0q1bGb84Rk0xhLoa5+OwhwxvF92htHHh47MEXtcB
	6DyoQqQd/cfjLvMvvJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpQm-002MLl-0b;
	Fri, 20 Oct 2023 13:20:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpQj-002ML5-1h;
	Fri, 20 Oct 2023 13:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF70E62087;
	Fri, 20 Oct 2023 13:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB88C433C7;
	Fri, 20 Oct 2023 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697808044;
	bh=EG30UqUQC1/T0Ivz2ZS6ZstgK+eGwKAGIHTJTjqU8qU=;
	h=From:To:Cc:Subject:Date:From;
	b=UmwC7uHF40gz5hlzklO6rUFd+3sDe8gCyRUMuGZS50hja/jeCs0YHc0lLxSETNpnL
	 bRJ0mcJGK7Kcd0wm7jtkSQUCfsg2bnN97+E17F82YPxpp0Te5BuRG2cKW1H+yiDUI/
	 aa7ECC0cadj0RQplp2CGN9/tRzraZJ3GmDZq6llOAMajyug4DQl1OiR1rwzh8l95Q9
	 DDmXY0VyEdnzwoS3KhYMazjhOf0VWwhLhb4hjfCBNQi/Y4rtmeYU+cv/dIl4cemVhJ
	 yIh1Fhkr3OdyA/7Osf+UhKfxsFMUcNyniW5MIi2LZTP+fdRj3zEAYRvOgI1JwU8wd1
	 hntVrzkmM26Bw==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Yu Tu <yu.tu@amlogic.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Jian Hu <jian.hu@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Date: Fri, 20 Oct 2023 15:19:58 +0200
Message-Id: <20231020132036.1181762-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_062045_609977_01463324 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Without this, the newly added driver fails to link:

aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'

Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index c5303e4c16043..3c28560b0faba 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -149,6 +149,7 @@ config COMMON_CLK_S4_PLL
 	tristate "S4 SoC PLL clock controllers support"
 	depends on ARM64
 	default y
+	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_REGMAP
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
