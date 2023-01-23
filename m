Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B94BC38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lem3PQVB+zjCh4gKRox8D1NDJdqVIkkNr6vKk46o/yM=; b=3ev+L7pL4i1x8t
	q2W5MhLDvZoz2P3uWKUdnHIymp2mkCYX/00dowSl85QueXrBRbrZ/uw84gEXfAEW718b6iByToiAj
	o9ImNFGBi+2tGff3DaF84xa6GxTIP6SNfgnxwCQbUwR7L4Jnl7ez2BQDW3X2o+nPF0yXSw7lJL8lG
	NMp95ymOrljsPW3sCRWXVgxj2zxSOYUCZfObFGjHY6rvIzK6/wtOvw5LSTgpByUN6KDVj7whQ/t+V
	HP5e6ZLpsnhJpL6UurmOxhQlT/SZPrPKzNhM44dtdLXeIRc7Bgjz5Ely3UCwEAATYbidCXDckuecY
	vEDDuhDV/MEjVQ9OaQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxEU-00HRee-Ld; Mon, 23 Jan 2023 13:51:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxEP-00HRa6-MC
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 13:51:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id r9so10877229wrw.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/aPgVYxytvHxJllto1N4mW/e7BZnp3Uj+u6VxCc02s=;
        b=pnUkWpGE8BU1Q/ZnWNSy8A1mAVzk+vB6belwCcQ6B3j2xskVbgg7rpB5MpSX2SvCod
         hjJZoCIBz6pNKwMd/S23aQh0SZm7CmwLVYWvz4VvtrflwdI1VXMsl+ipBvlXgIkfxvdw
         FqtyjR6NeU8usGBc7JIuBatSjTiyxuZ4xt85B7jdU+Bp16JDPY1WTnoMoj1qOxP0LcXd
         AD8f6IYPWsO4/HPjUdV+u4djT89UWS+8+B6w8aIot0x8uJfN8unsaLVpqT0Ry+Cml5Lb
         Wm/uO+BAOF7QLUrrRBRPT1lrV4zgIBErh6WT/dvdtHActXqkSXNFOIwa0U/2KOjfoMfH
         bH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/aPgVYxytvHxJllto1N4mW/e7BZnp3Uj+u6VxCc02s=;
        b=jfKN3Y3GU6FR7WhWNtVrnNVLp7BOERSkgOPPfhsjRCb4fgZK7JYghtNiN3VWP7gAsk
         yvtbuviFVwii1lSMXf40/7pCzdH5FiMKgy/eQXesQnPK1JXFMRLqc5SHp9ihEgT86OoC
         1zVcewZCT/3QkYVb9Bxu14KFFTknBmUmMXeuy9rJTw3Gzv2e6K0iifvka+id0JfQGfa0
         4mQbSuDlULlQI9ZChw6vQaoSQ3HlSIZPXMjjR9ko0xWiisNDq8a76pqEI5B+d26rdCEU
         tDELOlefSjgxaog5mfT9O+NNaxEVg03bqHxJuoNACQiRblOadQdkUXnsx6rQH1ONEDqd
         PM1Q==
X-Gm-Message-State: AFqh2krrUE7TuFjqaA07Ql0U2UMr5Pl2nahk5B6fvYE4mBLvlM10zcAL
	aMlwCB6gt046vHpuaVHaYA8PdA==
X-Google-Smtp-Source: AMrXdXu8LYL65Syg8VeA91+RRN/vtoihzlCknkCIPZF3kK+2V4F+Fo/u29x7IHbFhomd/NYSoXD74w==
X-Received: by 2002:adf:fc4c:0:b0:2bd:dbbb:e7e2 with SMTP id e12-20020adffc4c000000b002bddbbbe7e2mr20364277wrs.60.1674481885872;
        Mon, 23 Jan 2023 05:51:25 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z12-20020adfd0cc000000b002bdff778d87sm19412230wrh.34.2023.01.23.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 05:51:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Qi Duan <qi.duan@amlogic.com>
Subject: [PATCH net] net: mdio-mux-meson-g12a: force internal PHY off on mux switch
Date: Mon, 23 Jan 2023 14:50:37 +0100
Message-Id: <20230123135037.195157-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_055130_016241_32EFBD65 
X-CRM114-Status: GOOD (  14.80  )
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

Force the internal PHY off then on when switching to the internal path.
This fixes problems where the PHY ID is not properly set.

Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
Suggested-by: Qi Duan <qi.duan@amlogic.com>
Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

The initial discussion about this change can be found here:
https://lore.kernel.org/all/1j4jslwen5.fsf@starbuckisacylon.baylibre.com/

 drivers/net/mdio/mdio-mux-meson-g12a.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
index 4a2e94faf57e..da61f00a6666 100644
--- a/drivers/net/mdio/mdio-mux-meson-g12a.c
+++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -151,6 +152,7 @@ static const struct clk_ops g12a_ephy_pll_ops = {
 static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
 {
 	int ret;
+	u32 value;
 
 	/* Enable the phy clock */
 	if (!priv->pll_is_enabled) {
@@ -163,18 +165,25 @@ static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
 
 	/* Initialize ephy control */
 	writel(EPHY_G12A_ID, priv->regs + ETH_PHY_CNTL0);
-	writel(FIELD_PREP(PHY_CNTL1_ST_MODE, 3) |
-	       FIELD_PREP(PHY_CNTL1_ST_PHYADD, EPHY_DFLT_ADD) |
-	       FIELD_PREP(PHY_CNTL1_MII_MODE, EPHY_MODE_RMII) |
-	       PHY_CNTL1_CLK_EN |
-	       PHY_CNTL1_CLKFREQ |
-	       PHY_CNTL1_PHY_ENB,
-	       priv->regs + ETH_PHY_CNTL1);
+
+	/* Make sure we get a 0 -> 1 transition on the enable bit */
+	value = FIELD_PREP(PHY_CNTL1_ST_MODE, 3) |
+		FIELD_PREP(PHY_CNTL1_ST_PHYADD, EPHY_DFLT_ADD) |
+		FIELD_PREP(PHY_CNTL1_MII_MODE, EPHY_MODE_RMII) |
+		PHY_CNTL1_CLK_EN |
+		PHY_CNTL1_CLKFREQ;
+	writel(value, priv->regs + ETH_PHY_CNTL1);
 	writel(PHY_CNTL2_USE_INTERNAL |
 	       PHY_CNTL2_SMI_SRC_MAC |
 	       PHY_CNTL2_RX_CLK_EPHY,
 	       priv->regs + ETH_PHY_CNTL2);
 
+	value |= PHY_CNTL1_PHY_ENB;
+	writel(value, priv->regs + ETH_PHY_CNTL1);
+
+	/* The phy needs a bit of time to power up */
+	mdelay(10);
+
 	return 0;
 }
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
