Return-Path: <SRS0=wHej=K4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87033C47080
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 01:38:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5903E613CD
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 01:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5903E613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uhFRUnc30HGLwMTL5pLrM3fHQO3FnRBBEPpCmXM0Ubs=; b=EyAUwSumq+WVSQ
	C0WJS6lj9LNXYOIikIps+e0HLOkKif+LwsrOwAbdz2mTn5zrRNVPZPQfZIePW1hKOZV7WhGtXIM6n
	W3LyvKCWKXclyOyLkx8THW3p9KgE2/mK5QkJ1qFXJRdJxC9qiA4rb4SgKXp/tPLUGgIkSwLybFzJC
	yT8p9oUXv4gcrD6dlthcUnER3hXIqFKCJMCAoHWtkKdtRpGlD/QmD8GGk885Lt7ZRkpiQWrPCbOs4
	LKDlPYBQ6X1nYgIGczTDftlPcAchtvPcfqwC1NGdvp0pfQ8tiSTM0MDNF25mFWX8GtzG9D6qDX1Oa
	NrC2i3yHBZusW9wog07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loFps-001VGZ-LR; Wed, 02 Jun 2021 01:38:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loFpp-001VFL-Fg
 for linux-amlogic@lists.infradead.org; Wed, 02 Jun 2021 01:38:19 +0000
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fvs5L517Tz67kb;
 Wed,  2 Jun 2021 09:34:30 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 dggeme760-chm.china.huawei.com (10.3.19.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:38:12 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <davem@davemloft.net>,
 <kuba@kernel.org>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <narmstrong@baylibre.com>,
 <khilman@baylibre.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>
CC: <opendmb@gmail.com>, <f.fainelli@gmail.com>, <linux@armlinux.org.uk>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>, Zheng Yongjun
 <zhengyongjun3@huawei.com>
Subject: [PATCH v2 net-next] net: mdio: Fix spelling mistakes
Date: Wed, 2 Jun 2021 09:51:51 +0800
Message-ID: <20210602015151.4135891-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme760-chm.china.huawei.com (10.3.19.106)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_183817_874873_A28A412D 
X-CRM114-Status: GOOD (  12.28  )
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

informations  ==> information
typicaly  ==> typically
derrive  ==> derive
eventhough  ==> even though
hz ==> Hz

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c     | 2 +-
 drivers/net/mdio/mdio-mux-bcm-iproc.c  | 2 +-
 drivers/net/mdio/mdio-mux-meson-g12a.c | 2 +-
 drivers/net/mdio/of_mdio.c             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 5d171e7f118d..63348716b426 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -203,7 +203,7 @@ static void unimac_mdio_clk_set(struct unimac_mdio_priv *priv)
 		return;
 	}
 
-	/* The MDIO clock is the reference clock (typicaly 250Mhz) divided by
+	/* The MDIO clock is the reference clock (typically 250MHz) divided by
 	 * 2 x (MDIO_CLK_DIV + 1)
 	 */
 	reg = unimac_mdio_readl(priv, MDIO_CFG);
diff --git a/drivers/net/mdio/mdio-mux-bcm-iproc.c b/drivers/net/mdio/mdio-mux-bcm-iproc.c
index 03261e6b9ceb..239e88c7a272 100644
--- a/drivers/net/mdio/mdio-mux-bcm-iproc.c
+++ b/drivers/net/mdio/mdio-mux-bcm-iproc.c
@@ -65,7 +65,7 @@ static void mdio_mux_iproc_config(struct iproc_mdiomux_desc *md)
 	writel(val, md->base + MDIO_SCAN_CTRL_OFFSET);
 
 	if (md->core_clk) {
-		/* use rate adjust regs to derrive the mdio's operating
+		/* use rate adjust regs to derive the mdio's operating
 		 * frequency from the specified core clock
 		 */
 		divisor = clk_get_rate(md->core_clk) / MDIO_OPERATING_FREQUENCY;
diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
index bf86c9c7a288..b8866bc3f2e8 100644
--- a/drivers/net/mdio/mdio-mux-meson-g12a.c
+++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
@@ -95,7 +95,7 @@ static int g12a_ephy_pll_enable(struct clk_hw *hw)
 
 	/* Poll on the digital lock instead of the usual analog lock
 	 * This is done because bit 31 is unreliable on some SoC. Bit
-	 * 31 may indicate that the PLL is not lock eventhough the clock
+	 * 31 may indicate that the PLL is not lock even though the clock
 	 * is actually running
 	 */
 	return readl_poll_timeout(pll->base + ETH_PLL_CTL0, val,
diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 094494a68ddf..8e97d5b825f5 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -466,7 +466,7 @@ EXPORT_SYMBOL(of_phy_get_and_connect);
  * of_phy_is_fixed_link() and of_phy_register_fixed_link() must
  * support two DT bindings:
  * - the old DT binding, where 'fixed-link' was a property with 5
- *   cells encoding various informations about the fixed PHY
+ *   cells encoding various information about the fixed PHY
  * - the new DT binding, where 'fixed-link' is a sub-node of the
  *   Ethernet device.
  */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
