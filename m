Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25254C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:19:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B382082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dDi/pIEz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RhijCmsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B382082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKK7asTB18qVKOQFipeJLK615KVEwLgDevVcOninoxo=; b=dDi/pIEziescn+
	ZTMyXDC/COvUKFSuCoRpw9afT59+RGm0dc841eg89TnzgICBFlkKphYabA61NMDewUF9aGfNKA4/0
	tM5/q8xqGVQGdcU/VSrUw53nPRx1KlrPpQMsVENTo4hD59adWRi3mEBDWMTTl3rSX127cOAAwaNoq
	amk2R8fePFsVWKN9FUEi6mbexq5q/s5o4H+WgJ3CzIxs+sDRfuNZ4c4hBXvZ9g7M9aL86nWx2/CpM
	QzYjpdJUvaNdtSIb/1QCbLqdTb4HWbhq2zfOat2soaZ3OcM6z6F8zLQqTIkVvWiJbHsS/JjmEPuWX
	Ad37eiqhNmpXtkBjDAaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTtBM-0000pK-Uq; Wed, 29 Apr 2020 20:19:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt91-00073M-9t; Wed, 29 Apr 2020 20:17:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id d17so4077549wrg.11;
 Wed, 29 Apr 2020 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5E0z8+RH9QdjVjupYJsFCJKf6+6jAHD7ZKMzQZsttM=;
 b=RhijCmsTq80bADpuTyOQl20JpLBT/78NnD3MQ7DpsaMPWt49HHCeU8RBMmIuPPR5zy
 Hw3fdZKnjzibR+NRL4NITQYUiiAMHcNq5Pn6ffl1476/OEbevJ8vBnePxSLscT26c7Jj
 fYsHf+Wh/RIriLkqg1f1Qbgxa7D7GU5SHAfFyj898dnXTau/MPe38UlF29Kf9ZLOZE7o
 AEe8t4ybvQDwGbGZFxZ8cZrFlr8YXdFva7ppd3AnA9PWnFAEzKKsmt7aTb2//Qrcigwu
 e4yZ6xEDPMmcF0LGm8cAZJqR0EVxgFknleEPPH8hXtLMnOQRTlOUEQEkHJCwnrUH9aVx
 kJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5E0z8+RH9QdjVjupYJsFCJKf6+6jAHD7ZKMzQZsttM=;
 b=rLNAk6EN04wEWox5dybGEBrZMblvg+6sI3ptGuoRrsMXz1z7xVbb4E9m9Lj/1PV1xs
 7LRlyZdFhzRbvFSpf2M4gfWTOuUGte7okh31PqCfm4Psm7deFZvExRox+p0b5vx8VjXE
 CVr7v52FT3R+Ifwr5ITcMtRCDKg3mOj/xzvr0Ad4MUo/QVi7S92wHCUO6Aza3h4IeR5P
 M9y04ZQa1GaijMnhZ9bq9uZ5jLUrM7sgDy6OfhDIp4h2HyHvdHVaGsRYlxvMBp6fiAvc
 lbIFeCvtCKSjiW/2Onhs+HzWnj7TfER1l+NpiRRI+NLrh9sTElwmDB+CZrdka48qyH96
 HPUg==
X-Gm-Message-State: AGi0Pua/FzBM4m3baXLdZECcGHLAo6HsFpb9wctbCDms8j33vfntQ4TP
 w/vg+TXFZRgPcDTn6zk93v4=
X-Google-Smtp-Source: APiQypL6/HjmO2Y5BOTOvHuARmRoeixXyPJyoP3pLs3IZxUHoveUQQ3YxMsDKRuvm8meMzKYkXEN0g==
X-Received: by 2002:adf:e486:: with SMTP id i6mr39356107wrm.377.1588191441584; 
 Wed, 29 Apr 2020 13:17:21 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC v2 08/11] net: stmmac: dwmac-meson8b: add support for the
 RX delay configuration
Date: Wed, 29 Apr 2020 22:16:41 +0200
Message-Id: <20200429201644.1144546-9-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131723_473196_B0B5A390 
X-CRM114-Status: GOOD (  20.18  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Configure the PRG_ETH0_ADJ_* bits to enable or disable the RX delay
based on the various RGMII PHY modes. For now the only supported RX
delay settings are:
- disabled, use for example for phy-mode "rgmii-id"
- 0ns - this is treated identical to "disabled", used for example on
  boards where the PHY provides 2ns TX delay and the PCB trace length
  already adds 2ns RX delay
- 2ns - for whenever the PHY cannot add the RX delay and the traces on
  the PCB don't add any RX delay

Disabling the RX delay (in case u-boot enables it, which is the case
for example on Meson8b Odroid-C1) simply means that PRG_ETH0_ADJ_ENABLE,
PRG_ETH0_ADJ_SETUP, PRG_ETH0_ADJ_DELAY and PRG_ETH0_ADJ_SKEW should be
disabled (just disabling PRG_ETH0_ADJ_ENABLE may be enough, since that
disables the whole re-timing logic - but I find it makes more sense to
clear the other bits as well since they depend on that setting).

u-boot on Odroid-C1 uses the following steps to enable a 2ns RX delay:
- enabling enabling the timing adjustment clock
- enabling the timing adjustment logic by setting PRG_ETH0_ADJ_ENABLE
- setting the PRG_ETH0_ADJ_SETUP bit

The documentation for the PRG_ETH0_ADJ_DELAY and PRG_ETH0_ADJ_SKEW
registers indicates that we can even set different RX delays. However,
I could not find out how this works exactly, so for now we only support
a 2ns RX delay using the exact same way that Odroid-C1's u-boot does.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 79 +++++++++++++------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d31f79c455de..73c84108d65b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -85,6 +85,7 @@ struct meson8b_dwmac {
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
+	u32				rx_delay_ns;
 	struct clk			*timing_adj_clk;
 };
 
@@ -284,25 +285,58 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
+	u32 tx_dly_config, rx_dly_config, delay_config;
 	int ret;
-	u8 tx_dly_val = 0;
+
+	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK,
+				   dwmac->tx_delay_ns >> 1);
+
+	if (dwmac->rx_delay_ns == 2)
+		rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
+	else
+		rx_dly_config = 0;
 
 	switch (dwmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
+		delay_config = tx_dly_config | rx_dly_config;
+		break;
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		tx_dly_val = dwmac->tx_delay_ns >> 1;
-		/* fall through */
-
-	case PHY_INTERFACE_MODE_RGMII_ID:
+		delay_config = tx_dly_config;
+		break;
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		delay_config = rx_dly_config;
+		break;
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RMII:
+		delay_config = 0;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
+			phy_modes(dwmac->phy_mode));
+		return -EINVAL;
+	};
+
+	if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
+		/* The timing adjustment logic is driven by a separate clock */
+		ret = meson8b_devm_clk_prepare_enable(dwmac,
+						      dwmac->timing_adj_clk);
+		if (ret) {
+			dev_err(dwmac->dev,
+				"Failed to enable the timing-adjustment clock\n");
+			return ret;
+		}
+	}
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
+				delay_config);
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode)) {
 		/* only relevant for RMII mode -> disable in RGMII mode */
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
 					PRG_ETH0_INVERTED_RMII_CLK, 0);
 
-		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK,
-					FIELD_PREP(PRG_ETH0_TXDLY_MASK,
-						   tx_dly_val));
-
 		/* Configure the 125MHz RGMII TX clock, the IP block changes
 		 * the output automatically (= without us having to configure
 		 * a register) based on the line-speed (125MHz for Gbit speeds,
@@ -322,24 +356,11 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 				"failed to enable the RGMII TX clock\n");
 			return ret;
 		}
-		break;
-
-	case PHY_INTERFACE_MODE_RMII:
+	} else {
 		/* invert internal clk_rmii_i to generate 25/2.5 tx_rx_clk */
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
 					PRG_ETH0_INVERTED_RMII_CLK,
 					PRG_ETH0_INVERTED_RMII_CLK);
-
-		/* TX clock delay cannot be configured in RMII mode */
-		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK,
-					0);
-
-		break;
-
-	default:
-		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
-			phy_modes(dwmac->phy_mode));
-		return -EINVAL;
 	}
 
 	/* enable TX_CLK and PHY_REF_CLK generator */
@@ -394,6 +415,18 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 				 &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
+	/* use 0ns as fallback since this is what most boards actually use */
+	if (of_property_read_u32(pdev->dev.of_node, "amlogic,rx-delay-ns",
+				 &dwmac->rx_delay_ns))
+		dwmac->rx_delay_ns = 0;
+
+	if (dwmac->rx_delay_ns != 0 && dwmac->rx_delay_ns != 2) {
+		dev_err(&pdev->dev,
+			"The only allowed RX delays values are: 0ns, 2ns");
+		ret = -EINVAL;
+		goto err_remove_config_dt;
+	}
+
 	dwmac->timing_adj_clk = devm_clk_get_optional(dwmac->dev,
 						      "timing-adjustment");
 	if (IS_ERR(dwmac->timing_adj_clk)) {
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
