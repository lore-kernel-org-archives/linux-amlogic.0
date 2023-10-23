Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C3CDB474
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Oct 2023 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dSMoXqAlbj65dXf0e/Zm3FziFjOP4pABpWFSm/nONRk=; b=QQgqkrllK5eAC8
	rbu6zkwGgHFcyjhwLq63TV22/1BmPf42NUOrFhVaHPnPVuFlkKegAjNaQe35R+xLj84IgxavEZLwz
	ZlTtFraHLodAyIyW2oZJcoIQZqIpcfs4q2fHyM6Ihr1vnYnJdCnoUI0HBUIyuC/QqNxpDJzQYp/mz
	iiXZmZYRmM9Y4Aho7Ty+adX8SuzVYbEIt9U7oOglKx3DPUzlUsspF2NQT5JVipYzWGJ+RDYe8SRHM
	fWhl/iMW4L3AABVfmB5pU2RBLxXK9rjNd9KH1qG9zJdDAqvGIkikOdGW0wqdlvsDfCBxrrkmDt36E
	QVUSMMHUULg7ZQX6vXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusAX-0071lE-2u;
	Mon, 23 Oct 2023 10:28:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusAU-0071kg-2n;
	Mon, 23 Oct 2023 10:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D270461D1A;
	Mon, 23 Oct 2023 10:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCABDC433C7;
	Mon, 23 Oct 2023 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698056896;
	bh=6EIj0UlrOsSd3FcPrJWS3RVeP62yd7ggwxrvtzIHU48=;
	h=From:To:Cc:Subject:Date:From;
	b=uE3S4qhspmjtcgzEY+ko2fxQqWXVXR5QwvaDMyFyqnm1wI4xWMS18QqrNhFxcaQOC
	 Ja67VnzSku3Vmw0t9Q1bd4tbejJYpkfDX88Vli3ioW2OJOEjVpOM8aDFKUkmJD7ORa
	 Jv/fKhxJ0CYNtuRBqGuFyPN93sRDP8rU6quM1IOm4CcB31oVsIKWJ+lFY0xffMX6Y5
	 0f3eB4y2zr3ADL9M0PsqiEOnRMUR1B+LirdfWIWRnMGZsJrYO4uCyjFf7QC74dYcgG
	 ZTHOjU6oVg69yBa8vLzyHWeki+GP/yH7wjjEpoGfasYl9oWypSAjWcBxOn4tAQblHX
	 F70YPqagESIFg==
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
Subject: [PATCH] [v2] clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Date: Mon, 23 Oct 2023 12:28:02 +0200
Message-Id: <20231023102810.4001943-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_032818_967378_71F197BB 
X-CRM114-Status: UNSURE (   8.66  )
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

Without this, the newly added drivers fail to link:

aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'
aarch64-linux-ld: drivers/clk/meson/s4-peripherals.o: in function `meson_s4_periphs_probe':
s4-peripherals.c:(.text+0xb0): undefined reference to `meson_clk_hw_get'

Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: fix up both drivers, the first version only addressed the s4-pll one.
---
 drivers/clk/meson/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index c5303e4c16043..29ffd14d267b6 100644
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
@@ -161,6 +162,7 @@ config COMMON_CLK_S4_PERIPHERALS
 	tristate "S4 SoC peripherals clock controllers support"
 	depends on ARM64
 	default y
+	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
