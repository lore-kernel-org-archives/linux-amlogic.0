Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E6BC43603
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 20:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D82206DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 20:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ViLB16X5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D82206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z17vztosZTyXorOCsabmNPlGeSavQY5yUeb9fypeSPg=; b=ViLB16X5C3MV9o
	EFood76779mnb72SbQKorj0EhQ2R6czzLrHfZN3GQLfR6GlKKz4wyIH5XB1GvAB2uVF2n7Nw9NSz9
	lOX1KjTupH9asvJXvN4dnw3TIad5Xu4X6yt41tX1EKq9SHlPIg+hiqqhNwIXmTX1ds5MD9oauSA2O
	xgrToQpHlYx0I7KMBU3LCdk2U4688q1YNrxONf+K0BCSHCruTqUKqCJyRWn0jx/D+1c2sYEPQFM1D
	e7kHOz/ZuaahqWllhmQ/6q9xwgIK8nvcTa7hYL8vfJLIAq6VoaEYQGU5D1gul4+DsuRPWKUQtrWfE
	5+2OMKjvTwPYM0w96oEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie3ab-0006Vp-Cd; Sun, 08 Dec 2019 20:55:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie3aT-0006M4-B3; Sun, 08 Dec 2019 20:55:30 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DE367C0003;
 Sun,  8 Dec 2019 20:55:22 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Yue Wang <yue.wang@Amlogic.com>
Subject: [PATCH 2/2] PCI: amlogic: Use PCIe pll gate when available
Date: Sun,  8 Dec 2019 22:03:20 +0100
Message-Id: <20191208210320.15539-3-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208210320.15539-1-repk@triplefau.lt>
References: <20191208210320.15539-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_125529_531425_DD21C602 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

In order to get PCIe working reliably on some AXG platforms, PCIe pll
cml needs to be enabled. This is done by using the PCIE_PLL_CML_ENABLE
clock gate.

This clock gate is optional, so do not fail if it is missing in the
devicetree.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/pci/controller/dwc/pci-meson.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 3772b02a5c55..32b70ea9a426 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -89,6 +89,7 @@ struct meson_pcie_clk_res {
 	struct clk *mipi_gate;
 	struct clk *port_clk;
 	struct clk *general_clk;
+	struct clk *pll_cml_gate;
 };
 
 struct meson_pcie_rc_reset {
@@ -300,6 +301,10 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 	if (IS_ERR(res->clk))
 		return PTR_ERR(res->clk);
 
+	res->pll_cml_gate = meson_pcie_probe_clock(dev, "pll_cml_en", 0);
+	if (IS_ERR(res->pll_cml_gate))
+		res->pll_cml_gate = NULL;
+
 	return 0;
 }
 
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
