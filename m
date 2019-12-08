Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5B4C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 20:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8260206D5
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 20:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bwIfV0K3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KM/zNa/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8260206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRPVBlK9Ezw+LuZTaT2pdOZeL1xWRtcyBDArzVggur4=; b=bwIfV0K3uEq8mM
	4208owVXSgI/VzWCRz4BiIskJL9S2Lr8d4ArHLu79qAlkrfvFTcIyiL9PVOIoBJqqhWXPkK4Et7c8
	IvPsuicP+im94QBWxiM3zYm4RcrEUOQQNFVcwhJ+lkxesGznU5A+bbEfS8atNVqHjinHzkgJa3jck
	EhNxkTDvDfyL4swE4X6nvZ/T7ns/7cb9O71FUeYzstpg7WXMkxsWcxpCvIpf1zPBV16i/1jEEUI2O
	4QCu/S/IcpWW/4F8d6eAcasWDIZHnwwCZMEa8IeHnrMJ4U24mKF8HK8eLGNfOb2Td3p3WWMV3xe0t
	zd40zgN9EH2/9b9qeqhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie3b0-0006tv-84; Sun, 08 Dec 2019 20:56:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie3az-0006tS-9Y; Sun, 08 Dec 2019 20:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hKGw58ILqckxLS6Lqao62LAcoLIpMmoX9aFw/dvBCE=; b=KM/zNa/clE8J0Y3OeUGpK/I6bj
 PdwCKbvlLRzNjmcnMLqJmyg5P2kphUmpWeyJ8RXFsSxzJZPD8sjhm6cpXDBnBjGlPr7fIa5B8GmmC
 SVWgTOMoZ/+pg+BDSbKGrX7lKaPMo9K01m8V6GfBbtkyjJReEndwzeb7I6eelHJ9TCssizEO/eFZX
 E1fD8nC4dYTWgIQP0zy8aqXOyTLKRf5DpUPigVdIWPc3ozXY7GdgvaNCEJ8F3+E1BRnf+/xdMnas2
 PgAPkX3samKAGxSjSSfPjCUFW+ZlNv6QVqD8xGyeYToezLcgNz+2l4ZfX+oLMFQ3YUliqC7X5wE5G
 2yBSDDFA==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie3bO-0005CV-O3; Sun, 08 Dec 2019 20:56:28 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 56DA720005;
 Sun,  8 Dec 2019 20:55:18 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Yue Wang <yue.wang@Amlogic.com>
Subject: [PATCH 1/2] clk: meson: axg: add pcie pll cml gating
Date: Sun,  8 Dec 2019 22:03:19 +0100
Message-Id: <20191208210320.15539-2-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208210320.15539-1-repk@triplefau.lt>
References: <20191208210320.15539-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_205626_843031_32AF72E6 
X-CRM114-Status: GOOD (  11.43  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Remi Pommarel <repk@triplefau.lt>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PCIE_PLL_CML_ENABLE is used to enable or disable pcie clock PAD
output reliably on AXG platforms.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/clk/meson/axg.c              | 3 +++
 drivers/clk/meson/axg.h              | 2 +-
 include/dt-bindings/clock/axg-clkc.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 13fc0006f63d..ac9ab7f75ee8 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1142,6 +1142,7 @@ static MESON_GATE(axg_vpu_intr, HHI_GCLK_MPEG2, 25);
 static MESON_GATE(axg_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
 static MESON_GATE(axg_gic, HHI_GCLK_MPEG2, 30);
 static MESON_GATE(axg_mipi_enable, HHI_MIPI_CNTL0, 29);
+static MESON_GATE(axg_pcie_pll_cml_enable, HHI_MIPI_CNTL0, 26);
 
 /* Always On (AO) domain gates */
 
@@ -1246,6 +1247,7 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
 		[CLKID_HIFI_PLL_DCO]		= &axg_hifi_pll_dco.hw,
 		[CLKID_PCIE_PLL_DCO]		= &axg_pcie_pll_dco.hw,
 		[CLKID_PCIE_PLL_OD]		= &axg_pcie_pll_od.hw,
+		[CLKID_PCIE_PLL_CML_ENABLE]	= &axg_pcie_pll_cml_enable.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -1341,6 +1343,7 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&axg_hifi_pll_dco,
 	&axg_pcie_pll_dco,
 	&axg_pcie_pll_od,
+	&axg_pcie_pll_cml_enable,
 };
 
 static const struct meson_eeclkc_data axg_clkc_data = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index 0431dabac629..d65670d6c607 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -140,7 +140,7 @@
 #define CLKID_PCIE_PLL_DCO			89
 #define CLKID_PCIE_PLL_OD			90
 
-#define NR_CLKS					91
+#define NR_CLKS					92
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/axg-clkc.h>
diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index fd1f938c38d1..218a05ff508d 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -72,5 +72,6 @@
 #define CLKID_PCIE_CML_EN1			80
 #define CLKID_MIPI_ENABLE			81
 #define CLKID_GEN_CLK				84
+#define CLKID_PCIE_PLL_CML_ENABLE		91
 
 #endif /* __AXG_CLKC_H */
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
