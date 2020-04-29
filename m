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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA5AC83004
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028342082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4t6isAp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rto3GJWZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028342082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/hwsLkR7OTZ5tGfM2zRp9+Jw2Coh10XyPLmmhJ8IBg=; b=M4t6isApxEOSNz
	Bs0pOc+C8WZvt4+fn3Q4z1QC8xYk0aPGSDjj44e2aIyN8YOYwPDJ016eOeLdix7R0ZtOPOronTJXc
	lT3ov/3YODk1fV8qgDn5C/z1kpRZxWPTem/CEjaomtl6SEkxJEwnERgTbI53NBjz2b+gcmY6QGJ14
	C6pRJRROjpL/h1GFfAJ4NxVN2YuLVPXR+rB/lb+DJcWoATmkO1v7D98AvopILr9tPfhWZS+gLTn0B
	fYBm9Yycifxh0PIp92lS6+OXmrBIfwJee6BZW1IVKugdT5uOdgLklJ3SO/Aj5Ne5NbYEpl2/QLiXN
	xWHZOjyn2m7RugiFipjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTtAM-0008Iz-GF; Wed, 29 Apr 2020 20:18:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt8y-00070W-Te; Wed, 29 Apr 2020 20:17:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id j2so4106076wrs.9;
 Wed, 29 Apr 2020 13:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3h1YUm9/diU16ZWjl6NvChhRtfF7E8PRZGhUvORG+lo=;
 b=rto3GJWZQoNgPlHueUkKcCqK3IdDgA7X1HGKQOWYfa+vuMVPy1RKmcr4eaUq+riF3a
 xlFniqSrHXGZF9y/33tP5hVCuVhcRS/vywrYUzdIzykRlTQdvDorM1o4YQ+61X9Y9Jpp
 bakGkz05rty4xhNrYmS3PG+e6LfFh1d/3G/9FWce2aBswflbZ27TJ2Sx6LQNV0InR5MA
 bAjqGdBDhpuyYosz+y02fxiGxrtOZO6GEnJXjUNl3holtvU1Eqs3i0wMTyKmKmjQfEGU
 ij+AV4RQcrTVzzsyS0fQwp3D+Hky94Wq6BSgmaTX3oG7YGcNzQhAjxFix9dgPkyaXE2V
 tE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3h1YUm9/diU16ZWjl6NvChhRtfF7E8PRZGhUvORG+lo=;
 b=JtDOMD/j+KBPJzJUVgcP59GtODlesl730vVufNMeM4TQEe81gMpVu1regsd/Zvg27U
 D5HWUcWyO3kgkrFJDtKAqa1CCYD36qbv1T8fUdbTqbQdNsHCKuJi4lfky0i3GBG6ruH6
 yw6dBkUNB7kv4stjqOLdLrSOk/vD0gnZLeEIOEY7STPzw16472oH7zZm7a9KwmZ4TZpB
 PVij+waNDYQbtH4SXuAYCrMs3afflioojlcB7JNt+pkw1Nt2CbcCsYSqLxZZ/qzz9zvr
 YnGDkkmk7TgGnqRv4C6jmwbrUFCaHZRPn7NHM2LoIA+Z1EvQJAvyD6J7AL7U7xbH3nbE
 lazQ==
X-Gm-Message-State: AGi0PuariDJEMfaiY+EMBLlzOICX678WW7VKmFiv2jeTpc9QP/EidtVM
 qIjyuJPBr6N0kfb5+Eu1Qc4=
X-Google-Smtp-Source: APiQypI/ni8XFwYIHa0cewHD1MVfQDj2saKDUC5JGqEgPQrYhLr4ehS8ZLS8+x8E0cnvoqOaFTt7Fw==
X-Received: by 2002:a5d:42c7:: with SMTP id t7mr40611834wrr.336.1588191439216; 
 Wed, 29 Apr 2020 13:17:19 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC v2 06/11] net: stmmac: dwmac-meson8b: Fetch the
 "timing-adjustment" clock
Date: Wed, 29 Apr 2020 22:16:39 +0200
Message-Id: <20200429201644.1144546-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131720_980639_2E5907E0 
X-CRM114-Status: GOOD (  10.73  )
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

The PRG_ETHERNET registers have a built-in timing adjustment circuit
which can provide the RX delay in RGMII mode. This is driven by an
external (to this IP, but internal to the SoC) clock input. Fetch this
clock as optional (even though it's there on all supported SoCs) since
we just learned about it and existing .dtbs don't specify it.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 70075628c58e..41f3ef6bea66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -85,6 +85,7 @@ struct meson8b_dwmac {
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
+	struct clk			*timing_adj_clk;
 };
 
 struct meson8b_dwmac_clk_configs {
@@ -380,6 +381,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 				 &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
+	dwmac->timing_adj_clk = devm_clk_get_optional(dwmac->dev,
+						      "timing-adjustment");
+	if (IS_ERR(dwmac->timing_adj_clk)) {
+		ret = PTR_ERR(dwmac->timing_adj_clk);
+		goto err_remove_config_dt;
+	}
+
 	ret = meson8b_init_rgmii_tx_clk(dwmac);
 	if (ret)
 		goto err_remove_config_dt;
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
