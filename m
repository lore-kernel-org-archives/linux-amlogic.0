Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDC0C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:18:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967022082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ACtIkcj7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OZKi475h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967022082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7AvfaCS9fraF1+BOOVdoqWb7QKyX12hd0iNHupb31M=; b=ACtIkcj7HKiln1
	ocd5EPMBSyf2i8kZBX3sPaXkQOLFAaimJQtUGeUTC4Y7GD9DNvJxA7vsmYpXanDqSejl4wklc1lEk
	bkoyyUjdLuosvfqK7iSfk/s0NixAK7yrLlbsRNmZtaRojlLdi7DSjIvAf2y+x6hFpn7QAZBRJvy4k
	cejH8+KktAo5PAkkqBos3J3REz/WoPC/cb79knP8Avkra/gjMBokAgV+9NSOnpebHqyFXx4pT562g
	Nzhxx6XCFjO4cGhM0JC3bVZvN5doZJARNh3Z3zGhdXGtbiD25V1NxgY8v1xLaq4iESKqL5iqsmAN9
	mPnTrwdO4xYcmDT4a47w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTtAH-0008EG-QT; Wed, 29 Apr 2020 20:18:41 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt8x-0006xx-0x; Wed, 29 Apr 2020 20:17:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id x17so4110688wrt.5;
 Wed, 29 Apr 2020 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1BsZHOKV23AL354M93nmEs0vyNnhe/u13UcIzUzcp0=;
 b=OZKi475hcnUACJSmFsmYlgbAF4kGxaIWFbXq4bXdnUMWgxqXrCCMO8VHh4fjWGT7ya
 wM8HUL3n4GtqtUDeKu4tu6Ufrzga6+fSjbp3wkQPiU1W07zrTVEbnaDaChkws8GiVGI7
 XTFRPP0MS7u8E5RK6b+pa8kFbNRshT6Gig162/kYaBPHZqBc3cBDBNaV00pJnT88Fhsr
 hIY237tXOk56Y9kc3bYCfsdW2vu1yeuqYe3ia9DfvqcPBX96k/+wtVpsxvM9V2WLcKmX
 GvbADmNIeqPhXa1AwbE21ogk9EOsGTwS1JgrSiwNj0x6N2mF8W4u0tm16V5Izzn4igfF
 pFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1BsZHOKV23AL354M93nmEs0vyNnhe/u13UcIzUzcp0=;
 b=Kz2OfWbkJobxFiaZQCs8uAuPMzXtZYZSFBnSU2uAgcky28bmrvxKGstlozleT8xOA2
 3MqTA5G6KWJll+oBSdSPudtb0HdYeosOGGgvX7LL16SC6o2nFFZhtjqd7Hs7nXL4iHVf
 w1jpX3t+1NKD+65P0Ke6eIfqwuesyl0vOahDRYraDW5ed5AI7nlmHzdU8+4JbXzV0pHd
 QJGLqai0qFgL+cGxttIs2R+zdY0B2VyOSuqYG1gFMSTbqVdCH2s7fmcuG+fSINl+DAT5
 XRLHl+qH30qdwW7n7g0ZaIwdWTibPKSVIXvA7UR70bMsN8alI/dwYHS+euSSytngEZe5
 Gu5A==
X-Gm-Message-State: AGi0PuZco3Bz9Uph4GaKZEan1/Le23gxMidmOisioWByRf30+rmAZWkJ
 13ph/C8+DhxKRDksmPYaaqQ=
X-Google-Smtp-Source: APiQypIThLRu5RnVmx97RtJ9EtKrENrzlVIOefrkcoCLnfZRVkGPPMuiLNkwIg2h6iEwqtnhdU3xgw==
X-Received: by 2002:a5d:404a:: with SMTP id w10mr40207406wrp.397.1588191437227; 
 Wed, 29 Apr 2020 13:17:17 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC v2 04/11] net: stmmac: dwmac-meson8b: Move the
 documentation for the TX delay
Date: Wed, 29 Apr 2020 22:16:37 +0200
Message-Id: <20200429201644.1144546-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131719_136734_E7108B90 
X-CRM114-Status: GOOD (  11.23  )
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

Move the documentation for the TX delay above the PRG_ETH0_TXDLY_MASK
definition. Future commits will add more registers also with
documentation above their register bit definitions. Move the existing
comment so it will be consistent with the upcoming changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index c9ec0cb68082..1d7526ee09dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -33,6 +33,10 @@
 #define PRG_ETH0_CLK_M250_SEL_SHIFT	4
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
 
+/* TX clock delay in ns = "8ns / 4 * tx_dly_val" (where 8ns are exactly one
+ * cycle of the 125MHz RGMII TX clock):
+ * 0ns = 0x0, 2ns = 0x1, 4ns = 0x2, 6ns = 0x3
+ */
 #define PRG_ETH0_TXDLY_MASK		GENMASK(6, 5)
 
 /* divider for the result of m250_sel */
@@ -248,10 +252,6 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 	switch (dwmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		/* TX clock delay in ns = "8ns / 4 * tx_dly_val" (where
-		 * 8ns are exactly one cycle of the 125MHz RGMII TX clock):
-		 * 0ns = 0x0, 2ns = 0x1, 4ns = 0x2, 6ns = 0x3
-		 */
 		tx_dly_val = dwmac->tx_delay_ns >> 1;
 		/* fall through */
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
