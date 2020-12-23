Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64849C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:31:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B453224B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B453224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O7VxmExdFBWUG01n7WN9CdEP3Iltu8jEMPAluGCCq2k=; b=HfWPSiCKtJnJke5hvzaeXzbBF
	fDecIykEHkosZcpaH6+CjetwbNNdp4iVq/dCYgxZsmZ86N8OjwewfBUKZzmoIqYBoqerDgFrK0+vg
	04ewh8ERoBXG3bP0rnKR31bpOQP3QaDVlzSKNUWM78cMbb79/AxkZygQeqF5k07JLiPc8vQLeGSbM
	Q/FSCx9gXUnYT0Us+J4QF683kjt2bv8g/9nazkMvCZqdHqvPBLr1ipviMxY5/J3W3Z+1+BhUwMGW7
	AeDDO6nb2JNcUc5WF+AK7mzl+L6FPd1YAfzi0iSx/kri6pHgannnug7UclOssEj6gmT+B+TQhfq2D
	kkz7dBTSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDaq-0002je-Jb; Wed, 23 Dec 2020 23:30:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDae-0002fg-Dc; Wed, 23 Dec 2020 23:30:45 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r7so701168wrc.5;
 Wed, 23 Dec 2020 15:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2WQaMRGYRvLKx65rkROdWii2KWvF+WGltfYLQ57NGQ=;
 b=QSv1e9WF7GSxZt9mnrrAvF7gQn3O0JKgqiTyPv/zAOaudfr8twgASyQjxnm0ZEOlPL
 7X+j5zelIV+zAMHombxgdIx0cz+h4y3A9EeYMbtycKHaFkfQEWd99CR6IqIcE+mxB4vI
 OzZ2pI9oYClu6SH+Q8Dfnzd1i8ChTqh5LatufaWDJOtXM5D6ZKuPaUW4v8X7GpvViIvh
 qPQtSLmTwT47sVlp9UT3Q6cT6Z9CdHPfY+mxFHzlMNWtW764oS0Sy0veHZb22TsUcV3F
 NjwjFYMUJO5j1cqZvE0JEemd5nnTNcOSBpoNKy5l4/hW7ixfwUCOAojUdMvA8Au05S5f
 Rb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2WQaMRGYRvLKx65rkROdWii2KWvF+WGltfYLQ57NGQ=;
 b=jiceAJr7Xtfs/huKm6D/Zwon1RwcXpsO575ZtauVb+qMnkCL42uRfKt+pz5GRwisuz
 0KqGxRq4rtyuSwFEehNTCKDddJvePSFc+cIY7eumi7LjzYpau271EVyVnWwU/rYnRjgS
 cn6+PNAV3Zj8dFJj0wpI/2J28+//2o+bEmdJfgGmy+CThRGHn/vTZ+XBvZO/iMpJ/Rm8
 kvrRZLsS2hsxPshpqzRVXNkQNufXIJlm2IVYruMxU7aNej7b8ndm7yK6+zNHYZodWp3V
 9sxGJixUtDvioac8dVguRAr/RJ6SyzI66+Vy9C1CBEC8UoZrxd0KHfOZPPvWPttWW+H0
 2pVA==
X-Gm-Message-State: AOAM531h2yTz1s4I8SbWvnI8Cg6IX+gYwc/DGThwvlQ/duy+0z3cYfuT
 VrB9yG5A1vkcJjPLDTSNDfmthqRO8Lw=
X-Google-Smtp-Source: ABdhPJyXg+0G0zvWfJSELdbAeiB/10K8VeSYCmqu14DVPFBA1rwpwToeCJYVfALVDCMCXE16BXIQSA==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr31797641wrc.38.1608766241992; 
 Wed, 23 Dec 2020 15:30:41 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1371a0900428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l16sm37926657wrx.5.2020.12.23.15.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 15:30:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v3 4/5] net: stmmac: dwmac-meson8b: move RGMII delays into a
 separate function
Date: Thu, 24 Dec 2020 00:29:04 +0100
Message-Id: <20201223232905.2958651-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_183044_518392_E350F8BA 
X-CRM114-Status: GOOD (  15.30  )
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
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
