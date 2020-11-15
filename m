Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47143C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0142A2225B
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TmvdwUNA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="uUb32eLX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0142A2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t1HxV5Qt6yCkYBMU/OoGsTO7pNvFFtEnJ7/JjLSvgPM=; b=TmvdwUNAG2OqSVuhqmsts8qEg
	sEZfWzkU7moxvbbEp/tQZGbrc7d6HEB4l5zlqyLwQ1vWGqWAzcEbuioziWNgyNFLGhnT5Z/UdbnDz
	O0aRGyA6HuakSKPNvTk91N+lyg+vj4Z8Vo16K3kb+zJ35MEPrnSPEJmtLOKpiFhIAtGmj0ZxrcG8d
	G6tN9TmaPv/omm4fLtshafjiMjtWC6OC7Lx/EwJzd5bOHBH6m0tuQ+wvK15IVr+sF0qitDZPT/qrh
	QrTuTGcBBcVf7i28vkjr0aJSnF4WACFuKABzN34wpB9+2ZcQhA9qd3dOLuIEIKWiDhshEgANyE12I
	aBb2ttHcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keN9A-00048G-ID; Sun, 15 Nov 2020 18:53:08 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keN8o-000413-4B; Sun, 15 Nov 2020 18:52:47 +0000
Received: by mail-ej1-x644.google.com with SMTP id y17so15658590ejh.11;
 Sun, 15 Nov 2020 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rc+TCBVBSzblNUplMn3xZa+XP9vRttWGmvwn+KB8j44=;
 b=uUb32eLXE6XnanpT4p5IX7r1Lb05tCLcen5yRrNhqscFezUpVnTWFrLiCHyvdZmUHt
 6bGRxFPscfGWqVPvM3OAzXKdkDHDs3yddu/n5F0dWOnKxhDIrRrEE/bg0GiwbQ8q3Gdl
 6HzvNy52D6UnuAqetO0hsmtE/cGxKKRk32SNt+pRF8RjpkM4e5Qv42YTlHvgUC44xopL
 GRwG2iUI90uzzV/AAGVQO/5flPh3HeE4dbjNbtKrUuL+z1bpmW87m7fYtNtTeTb5GSAr
 0aTw1BNGSX3tbZ4DhCPwTbRMdUv0WFUNzFPHcjKoK0KAP062iDAYmnv8HgiyZn/Nmq/X
 2o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rc+TCBVBSzblNUplMn3xZa+XP9vRttWGmvwn+KB8j44=;
 b=twxFmKp9dbyPvRTAv48B3bmyiv9ekU7MzjIg75eI5y5XhcB0Iu8VnZsd1nY1Liq87x
 Oka+oY2N23Q84+l4ux4aeWFocNaYUIqU7TYPtjeNUmLv6s3UBeY9yR/hxydPg+c2rugF
 xDnDmKI+0YG/6d7FP5eIzLyBrBKBnbazTZbYcLQN70f4qess21NASPU9LqhX9cLzvVpS
 k1i9CqkeuEXX0vi45RStQYfHFOCSOmtoIp3sMJpDnKuf1rhNUaBzxoWZr8+CKauWaLYZ
 BCznWdFYr/DUcHo4uh8qlfqiYyoKaJg6Uay1318M03iSrGvwU8X1Vv5VJvwLMiihbPHa
 TRsA==
X-Gm-Message-State: AOAM533sJwUsjGXwJJ/r+NolRZac3pULJ8hGhfD++tbyLi+ocf4XvmeV
 r4szOOmWcei+7VGIh5u3Kuw=
X-Google-Smtp-Source: ABdhPJzhqcc2lVkj8r/6+Dk8UZP7s9/hkAO2i/qZzvAvWn9FF0C+0jVOEu82IgdDAPCXeV3zwsn2ig==
X-Received: by 2002:a17:906:b292:: with SMTP id
 q18mr11146559ejz.93.1605466365268; 
 Sun, 15 Nov 2020 10:52:45 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119])
 by smtp.googlemail.com with ESMTPSA id i13sm9233520ejv.84.2020.11.15.10.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:52:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC v2 3/5] net: stmmac: dwmac-meson8b: use picoseconds for
 the RGMII RX delay
Date: Sun, 15 Nov 2020 19:52:08 +0100
Message-Id: <20201115185210.573739-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_135246_227836_83ED0CDE 
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
delay register which allows picoseconds precision. Parse the new
"amlogic,rgmii-rx-delay-ps" property or fall back to the old
"amlogic,rx-delay-ns".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e27e2e7a53fd..03fce678b9f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -83,7 +83,7 @@ struct meson8b_dwmac {
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
-	u32				rx_delay_ns;
+	u32				rx_delay_ps;
 	struct clk			*timing_adj_clk;
 };
 
@@ -276,7 +276,7 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK,
 				   dwmac->tx_delay_ns >> 1);
 
-	if (dwmac->rx_delay_ns == 2)
+	if (dwmac->rx_delay_ps == 2000)
 		rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
 	else
 		rx_dly_config = 0;
@@ -406,14 +406,20 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 				 &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
-	/* use 0ns as fallback since this is what most boards actually use */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,rx-delay-ns",
-				 &dwmac->rx_delay_ns))
-		dwmac->rx_delay_ns = 0;
+	/* RX delay defaults to 0ps since this is what many boards use */
+	if (of_property_read_u32(pdev->dev.of_node,
+				 "amlogic,rgmii-rx-delay-ps",
+				  &dwmac->rx_delay_ps)) {
+		if (!of_property_read_u32(pdev->dev.of_node,
+					  "amlogic,rx-delay-ns",
+					  &dwmac->rx_delay_ps))
+			/* convert ns to ps */
+			dwmac->rx_delay_ps *= 1000;
+	}
 
-	if (dwmac->rx_delay_ns != 0 && dwmac->rx_delay_ns != 2) {
+	if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
 		dev_err(&pdev->dev,
-			"The only allowed RX delays values are: 0ns, 2ns");
+			"The only allowed RX delays values are: 0ps, 2000ps");
 		ret = -EINVAL;
 		goto err_remove_config_dt;
 	}
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
