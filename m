Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD988C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7A660F0F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B7A660F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PjnG8t0AiVict++v3X0CdSr2PsYa1irQQ92poZi34Y=; b=ASQrryrrA2JtW3
	YZV9/D5q3aCPlHM5ZplGLRD4kybOmumtasiiHZTLmW3qYwne9HiJe44MC8qDImuqlTzKlIdd9kAhJ
	J8suEjEpp6+eh5GNiKKySuDkuapKIy8s1VqwK+y8aSjYpchI+0rsqLT7X/VZA7pXlDu01RQ+tvf7P
	tKI/8mdf48ZdvxZtcqlhPan522D360EKOlFCTdJSbRT7v5+FpInC3cDkwUYU5+JW8wuBxOaU3+yf5
	cvyo9+hO0b3P0qkKFwg6OKMzFfGoa2p9DVrQeHb8gWzoLunVakRKEonZ0EzwClUNt91oufq2LsP/y
	hvcw1qB5pgpah8EXHfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9COG-005o3G-2A; Thu, 29 Jul 2021 20:12:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9CNo-005nrW-I1; Thu, 29 Jul 2021 20:11:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id e21so8301334pla.5;
 Thu, 29 Jul 2021 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uFCBpDGM4hFIxc9yi8Eu0cialujSpGXKpLF4MnHX0N4=;
 b=o4j5NmYtOd2b6pXYrmg7YUJhk/ntJ1U45lCUKITehyjndOnUXczd6eaYzoajkza/Dq
 6JmJHdTr3dahediTrHJt7WkawEEXnmo7o0mHt1OMLJ7Icx1CsA9ssknXBPvw/KtA9KKs
 UZHUviyVuD4nVGIu72SAfEwiYGfF6qDKUUD4WXfIArHFFCbdE1p/bDYZlnZFF5mLYS+5
 P/Z6+xx2Rdx+bT/x7S4oGHAs6+FWAz5F79dFDwOY8J+CoqJL//mHSTFz8Xg/YZfxb6Qi
 5Ref+r7ObgYFgExWA9S24uP5m/MhSwEALIPKaDywkjZQtU5jtUmgIoKKMRtGdmQhLA8A
 kovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uFCBpDGM4hFIxc9yi8Eu0cialujSpGXKpLF4MnHX0N4=;
 b=YUsEw2LwQuwKEPuZV7BVOVJHogjODNhigQpvnwjYQLRBuxUDFPm/VR19M3RWNjWtzh
 CcwMkuvmWAm3ZIQ1JsQiTarux6Vf8EmwDayVw1N6CFMYfhHpG6fXJjhPoMYcMyFtrGWR
 dpaQqGm35MXk8jLnCnHOD7vXUPXFpBhDgScHreVqc56AJ1iCSVE4J27nuBseooDpB4Oy
 EstGz4yl5EYDTIIaAv3C83tk++N4yeB/JxCwiVUyX9Zo0xmmYftXRAix7Ue+fobQMGkq
 CVD3PARXw4mP0daWJlmxD+Fz0GfpVRWgOtMAtOdY26jdwClPNkBcGKOXzRzVJgREpPHI
 gYlg==
X-Gm-Message-State: AOAM531KmjYu/1SMmNHC4fr7Ozdovco006T9qP2+ohIUWZTK9Kvkc1OQ
 Z8o80c8KxmQtFgUDm1Gr7Y0=
X-Google-Smtp-Source: ABdhPJwEDY6ObvS9IMV5cadka+41K/yJUlnwQzWz9TVouPF536akBdpkO0DPS1yrDa4svM2C/vlRWQ==
X-Received: by 2002:a17:90b:34e:: with SMTP id
 fh14mr6956614pjb.100.1627589515588; 
 Thu, 29 Jul 2021 13:11:55 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: [PATCHv1 3/3] net: stmmac: dwmac-meson8b: Add reset controller for
 ethernet phy
Date: Fri, 30 Jul 2021 01:40:52 +0530
Message-Id: <20210729201100.3994-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_131156_655243_51B0C970 
X-CRM114-Status: GOOD (  16.27  )
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

Add reset controller for Ethernet phy reset on every boot for
Amlogic SoC.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index c7a6588d9398..8b3b5e8c2a8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -17,6 +17,7 @@
 #include <linux/of_net.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
@@ -95,6 +96,7 @@ struct meson8b_dwmac {
 	u32				tx_delay_ns;
 	u32				rx_delay_ps;
 	struct clk			*timing_adj_clk;
+	struct reset_control		*eth_reset;
 };
 
 struct meson8b_dwmac_clk_configs {
@@ -384,6 +386,17 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TX_AND_PHY_REF_CLK,
 				PRG_ETH0_TX_AND_PHY_REF_CLK);
 
+	/* Make sure the Ethernet PHY is properly reseted, as U-Boot may leave
+	 * it at deasserted state, and thus it may fail to reset EMAC.
+	 *
+	 * This assumes the driver has exclusive access to the EPHY reset.
+	 */
+	ret = reset_control_reset(dwmac->eth_reset);
+	if (ret) {
+		dev_err(dwmac->dev, "Cannot reset internal PHY\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -465,6 +478,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		goto err_remove_config_dt;
 	}
 
+	dwmac->eth_reset = devm_reset_control_get_exclusive(dwmac->dev, "ethreset");
+	if (IS_ERR_OR_NULL(dwmac->eth_reset)) {
+		dev_err(dwmac->dev, "Failed to get Ethernet reset\n");
+		ret = PTR_ERR(dwmac->eth_reset);
+		goto err_remove_config_dt;
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		goto err_remove_config_dt;
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
