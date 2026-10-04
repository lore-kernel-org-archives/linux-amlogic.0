Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1830CA5FF0
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/UGBVV1ZHVqDOxeob2FZ2R/fbpvNcOEs+mPU38vllE=; b=yCCKbvIjulSttt
	nfFlgRL2jqZLT2m0+Bti7ed/sdsBTfiXCWAXCdcbXkFbPi4VnAPRBQ2TR68FxArZG34qWTJHF/JEs
	CUsOeZfsiZkq+7UYRxgLudydtI6toVw34bO23IDyBjERiZjGhBySoK2tQo9xsbHyhlWNBDGX/K7xJ
	UkrHo+aqE3pfRTPz5iftKKDpCmOMR9BnDuqZiF4BkNI9muvKj4rNg1GXP6tiraAhNwYu8G3CmLPDM
	NQfDQShndiqe2ss9unlj2SJzc9/OwTrSrjGO7ZQDF7079pfjTd0o/VGkpViDEUiV1bF1c7VO94guS
	lnwNbp5GUc0hELK28aEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOa-0000000EvId-345g;
	Sun, 04 Oct 2026 14:40:56 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOX-0000000EvEP-21Im
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:54 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso5820905e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124851; x=1791729651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HArI0GqWQQ9wXZmElGrKtHu5g8ZbfDICvR7ZMSTUUN0=;
        b=ers8OGVLrhhq1ca2GU5ozaijPVx9FrpGb1lmoOVex78jgPnkfL3t7RRlJJdGNtvBPv
         I4ot7BLtFxURS5ZFzcB71PKkZDyQoDog8yP/9NNew8wA/gCY6Zuupre+Aj2UKROe83DX
         4Kw6xvzdtgJbOiaHkN0mdaKbYrDQJkTveyh9Vpqwb7q7jUTCpk5Xc4Jgksp2FNNx4ikM
         R1kVRDm4wMCRgR1Z595FbbdoFCVAGOGvOrJmUqvGMUS4qrYarEIhutebrCuWcwqKKbOT
         woe1q/5VWbvGhu7f87B2DK4eE4n271gCwk4ss3JsaYaRXT62uNQVLf5g0j9MzbaX2JYj
         o9Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxb7DGJM8mFR90cS/TtYIdmV3TftFcnDaYqsh3tmIHFwPhKfEjW2CRPjpFOdOfTTiiGwoacQMonW+XxLxpI@lists.infradead.org
X-Gm-Message-State: AFuF++lTFBMwhGlo6lWpZQDo6RCGegoAdd+xlmNwr90jWm2WSvw52ksw
	TjuNiEgPbpTItShagkoVwJtkKGVq1vOGba0szVLF+srxwOIO9TCVFn4N
X-Gm-Gg: AYBFou2EroiytXEZv3nXad4lfHPmitcrX74C2lNsHOSXrwVxfBrrd3D2K8jIYGeSOUP
	9Lj+/vK4rVWTDyImBwXYTilywBrGHGgL8/Gw8B3vBHqFaBqOOzWIwQj0nI7NmJSM/GdYcqK0A/0
	rbcyReS68Tl5jQBo8tUq44RKA5mgnj3dcnHBIg6vS8xV2c0+fRcvT3UEj6kDMHSdCuNHSoi88kh
	51wASQqyv4IYkFWanSkCZ6KMA47JYl5GQRl4mjuScTB93lEClpB6aa2xyX6TIPY/NaWDAymwUCA
	k/ylAivhxh3hYbhuUYgmlqEEg8D6A8Qq7ek0e8be1rVgQ7X2ZSKHnnMsFBI5FqQ9gJCAongK1MI
	ZJ8vsEjy0ww1bnMZoPGhMlXObL8gbQDxqKBgVB4X8h3htOSwBWM3UkqeilAKshd8O6rVkMMfJr5
	1Qfeib44Z5Ca7Aog0ca0rQcq57SeX+kDQnnkJGBI6J8kUfTRTX+Xpjq8w3+LZNwjHL+HMCKt0kP
	6zSqdqe0wH2euTPEP1f1F6hV12P85q2Xw==
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a02769ac74mr132090935e9.35.1791124851353;
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sun,  4 Oct 2026 15:40:43 +0100
Message-ID: <20261004144046.391444-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074053_582145_7AE93006 
X-CRM114-Status: GOOD (  15.35  )
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

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What the T7 does not share is how the controller reaches DRAM: the bus
path goes through a pipeline stage with a gate of its own, and no device
other than the controller has any use for that gate. Claim it and hold
it enabled for as long as the controller is bound, otherwise it is
switched off as unused and a transfer that has been started can never
complete.

Give the T7 match data of its own so that only it looks the clock up,
and require the clock instead of treating it as optional: the controller
cannot do DMA without it, and failing the probe with a clear message
beats booting and hitting an undiagnosable hang later.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
