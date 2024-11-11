Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4982AD2E9D3
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2024 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zBbeUbfwGMmcnako0PLRF+SWR9Z9uacvH84FzigodM0=; b=I3qDkORDdlXFJR
	2yU5sVd63TL1M4bJEATRPNotRkIx/Nz+pI6spak++WMt8nySSm3prWJIjaJFnyvn3EdOS0e9FWegj
	lSWMHweSM7aZ6XHLSeTlD/Yc6FrYMwlqXsF3BBh1A5Xb1TlEE5SpXBN8CjR7OFpr+tHATGnJuT8lt
	/jIfqoyb7IG4Kp2QB+RJQgAJv/cWUzQ04DiIINcWNV0C4wLPV50ZjjHja0YESC31Kop+FdBwt1lje
	pb8i4t6E5s7vGQ8Uk7OCrXXNHlQGo7VrSXpt98Ywx4YQ4H24KyMR/D02cRORmoA9ZCJdbnCoSl53T
	sYc8Zt7aD0bc7L5DHjFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARfy-0000000HHCq-39p4;
	Mon, 11 Nov 2024 10:29:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARfw-0000000HHB0-1C3v;
	Mon, 11 Nov 2024 10:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D5CEA413A5;
	Mon, 11 Nov 2024 10:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47B6C4CECF;
	Mon, 11 Nov 2024 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731320978;
	bh=uIZqmnuRJS8ekHv7lZsq7+XDiS0vhUubfUCwr80FMvs=;
	h=From:To:Cc:Subject:Date:From;
	b=Cr+3CDdQv65miQSVhu73OzxU7prbdWiB+XY946y6RQnMjnOJ1OLbUHIaruK/paf3+
	 q98U5nppe0SlsmjqxQkSki0TzfPSMh2UNKl3wl4uBNY27XyeqIPsS7t0yzMxPcPIMp
	 ikWcV5f06UsXxinaJRfgyFmKjpwJt2TZ5mQ4msOR/EUfkQUoLisXvXfgcFEnHXdTdn
	 GPF9Oc3K/Ao+FYHBCXIbN4ptWMaW4+qXS1diuhVKM9HeNh2h5h1qjqMGMJj4iFb7Ky
	 Z+aS3MQKDbCIAgfDi+zjsi+rToZ4OGJf/TzTmO9RllH4mmkGCMg8lnQynn++RFsSMk
	 9yzOG8HxwMUdw==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX
Date: Mon, 11 Nov 2024 11:29:21 +0100
Message-Id: <20241111102932.3209861-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_022940_408707_BE232CD4 
X-CRM114-Status: GOOD (  11.35  )
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

As in most cases, using 'imply' is wrong here and does not prevent
build failures since that code may not be visible to a built-in
clk driver:

axg-audio.c:(.text+0x15c): undefined reference to `devm_meson_rst_aux_register'

Replace the incorrt 'imply' with the necessary 'depends on'.

Fixes: 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 7cb21fc223b0..febb5d7348ff 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	imply RESET_MESON_AUX
+	depends on RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
