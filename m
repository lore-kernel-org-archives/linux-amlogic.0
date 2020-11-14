Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97F5C61DD8
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280362231B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UlgsVEfu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="T3RFYqK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 280362231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5AjwPsl4FVVUVANnytXqOE/z0JLuGw81WNYVSqyqriE=; b=UlgsVEfuSAYRaCOSu+AFdibzK
	FMgXiHOUKYPf7nEdPhlq9mQT606skY4x4DvC2vGuJmMt1eIGNgYjDh4o2ozC03/QpBFowhEOimi/d
	M5iEqNptrIUzgZz6YAU6NOYHoIhC6eZUD0di11skbFEedzHW4wu3qgTaPrGqBUDlDn13IuoOvnrrn
	PBZ9m+PfdLMAKfPhqTtrgsEcMqk7DM8dagYejiRX9u6i0tmwbB83VII1BkLow/AuBRUAkqCq3ylho
	Xmg9LP2LJqNb/pixYNfGeOF+VJFETX/db2/+ij5KdpecVdH+abaMmeH5IwnAhmZb0kOwkJDTQ1QQU
	6K8XpvL+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke1kN-0004Bf-4x; Sat, 14 Nov 2020 20:02:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke1k7-00047y-W6; Sat, 14 Nov 2020 20:01:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id o15so14098945wru.6;
 Sat, 14 Nov 2020 12:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVMUgeyZKuWrvaXuwrPFfDV9ehe24R8AloJfk4H/7KE=;
 b=T3RFYqK91Z9IiHxLhucv8O/w7eZKfuCJNvkpEmhrzlWUroBUdgQJ07Vo8dg2yDtTuB
 mn1T8IE3KzgsfaH5p3LAjPNLMFPccmbj7uOtlj6w6pXq7ktcXjiKmiRO+e9V9s4z8Y+p
 o4Scu4nPdkYdsN+gSOpcrZn7tc3B9JV+Ntr9cThyukXkbGM0cRhycBtYB0Z64VhY8QZT
 igf/9QTpIWQBjEiwJksxbt8CpEcU3A09nczW2MsePb33jtaDDrWbYgMF26M87Zj7T7Ah
 e76GaI2iMUqbXxDxqT2dVoCKBz1MfPDDyy8zZR6Wzc4CuRAv2irRB1JZ4fzVwJtgfxnS
 vwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVMUgeyZKuWrvaXuwrPFfDV9ehe24R8AloJfk4H/7KE=;
 b=UfKqcneGLcgjdoW6PD8YQHuyCIavXLPbaE5GojnNJsJ+oZ29gqj2jXKrySPM0f+IJi
 MYiWXRxTN4A10j5aM0kDLlU/XcU1hbce+Nxo5qYZQYNdCpt5N7o/5LwPh/Viz7tpK+WK
 xpV1tsTp7HIg5SWS6WkV40KG3yXD8tQWF1A6zmu2pi6Q9AewlRRvBJLTdrJ652u8bRT1
 6YYHmvbMkLYe0wBZNQWbOc042pgydvzpvjtJoc04GdnY5D8Wzz2g3JSilmacD7Fsh3xW
 PY88aZd9esAln1a7ULQLZkrmzP1flSk4T4kwDX+JbIlRM/1LNWTBJiWP17bbM4tWSvZM
 8qdQ==
X-Gm-Message-State: AOAM531hIaNCsZ3KwAF9OhkXBPNOe3/jCX03LKg0b8oYZprdK0e+MBn8
 BfkPfePogCabFbl+xD9ChUs=
X-Google-Smtp-Source: ABdhPJyMtw9Jp1TkxZvWYEt21lqHXG31OvFS/02u+jppFkJOIZYIc26e4dd0MCeg/UYqHovxE/dlVw==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr10454761wrq.33.1605384111112; 
 Sat, 14 Nov 2020 12:01:51 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119]) by smtp.googlemail.com with ESMTPSA id
 g138sm14342953wme.39.2020.11.14.12.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 12:01:50 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH RFC v1 3/4] net: stmmac: dwmac-meson8b: move RGMII delays into
 a separate function
Date: Sat, 14 Nov 2020 21:01:03 +0100
Message-Id: <20201114200104.4148283-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
References: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_150152_099026_807E0691 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: andrew@lunn.ch, jianxin.pan@amlogic.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 465eaf000da1..a6e2077ed871 100644
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
@@ -431,6 +438,10 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
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
