Return-Path: <SRS0=HsQz=GJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C758DC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A6A62311A
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A6A62311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cHpHpBVOy5vSrnW4jBiiUhny57xf9KsJo2lcDQKO9sQ=; b=o1fllIuAcI4iK7tckLOOyBmBe
	o6zJ3orKA+yoqeHUNG3toFrOchZjI0wDKgJkmXFM3rGD5bAs5/GDUCrW4ob7ohSusKGPwBKncIDii
	wYrgbg7nyBwoCqt9BGfpMaTyv1hSr0EXpFzJA13ZD10OtqBIxbT4c0LnN/tBg542cnXpi0Es93zHT
	Kv2YAoH7d7hrckd1vfW6CG9RLBszvBV6JXH/O/xFDfg9KYCD2eQXLEc1pc9Fmg+x5bOh9cOuEP96f
	wRzIDbYE+lIWaW2Gy2eGPkrlcD01ei5aWUDVTS2fhZg81d6eJOU8gWBdo+GgLUReV+gZB/vKNt4NZ
	p51GdB7bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx96z-0008Hf-P4; Wed, 06 Jan 2021 13:44:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx96l-0008Bi-Nx; Wed, 06 Jan 2021 13:44:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id d26so2447899wrb.12;
 Wed, 06 Jan 2021 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H67hk0w4ys0VqaA1k6VYHauyrs1Tid6EBAgBVNleLKw=;
 b=pL3TiFkqml/XvwxwhXS10/0I2GPoOWjmakHKQDoQ11VYdzVlW2RSnefsaM2lVLzuUw
 T5ZbW4lX1hkvcHoDhJnKgr4dlhWl9bxrUFgmS7/QFJ5/rTfNJpULQDaotzzCML08yRWw
 VRIdXHnI8zSoB+AIaD62P/4ZasflPjZDvs5LtKKmJP6yZR3dcoxSxraJ/Ol3X5ioKg9g
 rIgzSEifS7RVUWM7FJsMPzODaoi9GMOM8/caKz+DyQpWV0+nmqKkWKU6+qbLh2fR4Ben
 XvWv7+11tU3mwSouItNworqtpJmBp50hCALWm286Po/eTeLvJjwpKNCZ2ghjfAmxHr/M
 eoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H67hk0w4ys0VqaA1k6VYHauyrs1Tid6EBAgBVNleLKw=;
 b=biopH2i/f9qn4rCCgpnzOrwJJY2Xf0lhzt7aE6RWMUyvOipuI9uHeXJxrM0yg54QO4
 rdjy/Uo18/kb2gOug6kB3wBxsvz63OUk1N9Q4jibcQFoGYswjUK+OmPPTRMI/kaAyDT0
 pgtV4HnSNyTEjABWbbzikdYkWyH5RiqBHHqb+dsYWOt5j03qbnVCmq2DhTUpAF2/2pFG
 sABDLcnS2XULVfd9NmtFAiBTiD9lMFQLS9LDy6TGkAiR4SGpkLg+3nxKehRNKw2/oPdF
 4KnG8h263oO9+xH2YiqfdJcG0dLl3Odktll0j5ufhQl0skTrxkOswlYUa8G7hJBoTxAB
 Kn5A==
X-Gm-Message-State: AOAM5306eq6LABA8L/n8+xppGSn7NLnqY3ipRHaZNoHRydP4LNPGQQBp
 qXeEbHYWRsNj8PGAm1xnAdLREkCxJYo=
X-Google-Smtp-Source: ABdhPJwuMOd5HX3ytI8B8k6S2VFPE75+6o+a1kYBKmClhtuUmJs5R876PF3xfiLiaTWcToydhbi9LA==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr4436321wre.344.1609940654115; 
 Wed, 06 Jan 2021 05:44:14 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f14sm3085351wme.14.2021.01.06.05.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:44:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v4 4/5] net: stmmac: dwmac-meson8b: move RGMII delays into a
 separate function
Date: Wed,  6 Jan 2021 14:42:50 +0100
Message-Id: <20210106134251.45264-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
References: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_084415_816041_05FA22FF 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Newer SoCs starting with the Amlogic Meson G12A have more a precise
RGMII RX delay configuration register. This means more complexity in the
code. Extract the existing RGMII delay configuration code into a
separate function to make it easier to read/understand even when adding
more logic in the future.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d2be3a7bd8fd..4937432ac70d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -268,7 +268,7 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 	return 0;
 }
 
-static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
+static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
 	u32 tx_dly_config, rx_dly_config, delay_config;
 	int ret;
@@ -323,6 +323,13 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
 				delay_config);
 
+	return 0;
+}
+
+static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
+{
+	int ret;
+
 	if (phy_interface_mode_is_rgmii(dwmac->phy_mode)) {
 		/* only relevant for RMII mode -> disable in RGMII mode */
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
@@ -430,6 +437,10 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		goto err_remove_config_dt;
 	}
 
+	ret = meson8b_init_rgmii_delays(dwmac);
+	if (ret)
+		goto err_remove_config_dt;
+
 	ret = meson8b_init_rgmii_tx_clk(dwmac);
 	if (ret)
 		goto err_remove_config_dt;
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
