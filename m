Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B3EC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uxul+TVcBKEM3ZJPgQdgOJm2N8Z3j5JdPrEivKvZGxM=; b=0uQkhrc7oybHc2
	BsafuP0HfAp53uw0ffl0B2O8Ev733UF5m2IhHgM+ywMEK61YuQqa5cKIswZgJXmkTv2LLz/kLjCgJ
	FACzULt8rMwFIkYOLBrPqY5eXn5VMY/LiOjiRjrY1s2kRSLaYLNnOBqFlH5UEHcA4xZHoThKtcdvQ
	FIEZ1lLLFRQUKLPCIY/iNP1udjVgoPnC+tt8riQD1lRQDzlDpFqBvMR1AZXZ7JXeg6ClCD73co2G5
	lYo6XQm/FRgflJ217C0RwUUbwQ1soMlLj1RKyaP+kNNvfdYl6gGDm5HHE13VL9KhT82IHirNQ/4k7
	K06ay8C6GuqbV8fyEUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGKR-0034UN-4l; Tue, 24 Jan 2023 10:14:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGJ9-0033e6-9T
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:13:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id d14so9665222wrr.9
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8taYkiDRhxwSj2khSrYXtScgLWDxF1GD5X3Ip5sSGs=;
        b=LLp84wiadrhwgCkt5Iy//WkgeSBuROH6t0YeHNNNAtMvdohLlAiDAEDkQPNjfHsmOa
         SnQ0Hqj7fFh3RIR5ryXAvuJ0MXz2o3AGYojvwuFBQduvyX/fuU/CEGjXqQfOeXvm+B2N
         38hUhIMVdjhF5Nde8peUn0fcZMHn89MyndOYvmVILwVapZkIIxp9Y/31L8hlcaXu1c3D
         FVnhP2FqR8jz8PfwwArxgb2uEFfXPo+3gwiHeIxg6C4RfRd9K8uhnGtl99WC50CBqpI2
         fUKxyd6/aSmt4uHQl5nWmHv218zWtiUOPfENRl1AQNL9E5m3KmwTPCG21C6QBzfoRdtL
         t/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8taYkiDRhxwSj2khSrYXtScgLWDxF1GD5X3Ip5sSGs=;
        b=B5+NgZdHlonVudC9MrBBjFB+aCtj18BBrZf7+EHZm7CZCgTp7UOwfI90beKGA4ueym
         4V3T/LiAJYTO5jSwOC9DqPxuHtrj3lFkoRtEor9y+vE0OX+h8V1VwxeGUfG43B0Y98gS
         1CnK/6pFs0JX+NHgHK7FUe/4q+uziwSBSnVSIxv0y2lLAjCkkPF01f/Kkqtri8XuDAG5
         90YdtsobFdGlx7WHd9G6pr/u22UvHZUhZfCIt5wEGR7Dua5vc4poa5f7p4LMbCxwt0RJ
         L7GVjr8qjFZz/o/wYzzCfrILog8dAInJU5+TjoDmZSOSwtSVYc5yHBtgrRjnAOnsefit
         tGqw==
X-Gm-Message-State: AO0yUKXSYHWhlN97m2cqGO71Z7xy9sG9XPIgdZhnuqJtjhORtOx8h0JK
	ECKQm5pB/R0ku/tDxMdlq5IFAg==
X-Google-Smtp-Source: AK7set+aTxPF4ny5RRAONgayCfTl2kwcaYwdQh9zSQY+aRfErh7XOu1AKwZIhC13TWp5Gcty+g3RPQ==
X-Received: by 2002:adf:fa09:0:b0:2bf:ac2c:4489 with SMTP id m9-20020adffa09000000b002bfac2c4489mr2351847wrr.54.1674555214568;
        Tue, 24 Jan 2023 02:13:34 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r1-20020a0560001b8100b002bfae16ee2fsm1452595wru.111.2023.01.24.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:13:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Qi Duan <qi.duan@amlogic.com>
Subject: [PATCH v2 net] net: mdio-mux-meson-g12a: force internal PHY off on mux switch
Date: Tue, 24 Jan 2023 11:11:57 +0100
Message-Id: <20230124101157.232234-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_021339_360890_655B76C0 
X-CRM114-Status: GOOD (  15.30  )
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

Changes since v1:
 - Fix variable position for reverse Xmas tree requirement.

The initial discussion about this change can be found here:
https://lore.kernel.org/all/1j4jslwen5.fsf@starbuckisacylon.baylibre.com/

 drivers/net/mdio/mdio-mux-meson-g12a.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
index 4a2e94faf57e..c4542ecf5623 100644
--- a/drivers/net/mdio/mdio-mux-meson-g12a.c
+++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -150,6 +151,7 @@ static const struct clk_ops g12a_ephy_pll_ops = {
 
 static int g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
 {
+	u32 value;
 	int ret;
 
 	/* Enable the phy clock */
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
