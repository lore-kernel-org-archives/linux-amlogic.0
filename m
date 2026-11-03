Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85B16082BD4
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wkVjSLkC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CFqK9gLP3K55waQ0HnR3WSq+SdOlnhUcr5KnBkfdhuI=; b=wkVjSLkC3o9GvomRAMn+EKGlQy
	3CwDEO1Y/737NKHfzug6IuPRaIgR3PdfnKk6ZwJTdpuH/QQI4jsPTVLa5jGRykB3vDwAfVGRaBSJN
	5Ctc9shG6qd2Mpgf8Bbhm69wHiUd344T3AbLX8lm6RhAT/NGpKLUPi7WKerHIyFZYyxoqc8DwJsub
	SiZZjo1ovqAFHS8UJ1ZMcacWmtfZmJcec4EikvJeq9ygKN1FvGz1gUgZHPssVl/x84CigtT0q/d/l
	7uRS240znDSS8AlIVi+54+pfRuDAVL3q1cyfq2H9eRNLkobI76kGanusWqG2Pj/LDrWl1QBgdi+W3
	Bq4vCNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVl-000000039Yz-2KUx;
	Tue, 03 Nov 2026 16:37:25 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVi-000000039T2-0YxF
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:23 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so4092700f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723840; x=1794328640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=YvLU53pwr9GeQoGTyt8jVn4pOVF+4h3H/v9wKISfFeOuL+hkmxZq7RgEOVoj3GtJIL
         FN6K7sH5Lu5G/GMfdNCqA25HQ+FZwnYjE/6FEVKPVESXebY52MChLl1HgKDIME+1rEPU
         mQb7Pq3MSkj8wWPCAf+3HcRC6DyOABHmjl5uA3IPLNFYIXqa5KvjjX9ZZKPxt6n+GmDI
         eu3qWf7+B8TCyf85RzxuzY1JhHLOE3MHgECrudVIHckMVchX9pmxcuMVJMTtjVR9L09p
         Tt1GukeyBDHjTexnboQDtSTylR159TR23a1X7i2ArVX+L9omMGgxkXYgYLhRthQhCCU1
         rqbA==
X-Forwarded-Encrypted: i=1; AKwUvByxuh0Zu/QfSku1Yv62B67qbhU6MwRuGrKtUgojLrrNJmtxPlUhYswCKl7u1ajiqECQojxS2wHOzgfLD14+@lists.infradead.org
X-Gm-Message-State: APuU4Z/+XMmpuN34tZJHKCQLYqYwZKvH/u9tyVLnMOpnO54tkrF78CyA
	Q1rveUT6rPdi1Mxi72WUPof7W0wROg4CYRBC/DIX5upbGevW1fF8ioSo
X-Gm-Gg: AYBFou0yLm9by/ohSkSL6SPOHpd4H6LN5MzqIPQksx2k/Fjq86+eS6qAyAHO2t3vgG2
	yWYsRr8JByXnfRai5YlBxjyfiNSNVHlXS6vsElthQattm6imMb0HByEgRz3yvOYphCEy4k4hzA+
	eZ9SZNO32bQ9V/W5KblI4PnKV+KA/nPrHRb7roGZMq2rdr+V2iWBOSnRBgJflxRAY//wk9XwBQz
	adCvovEghHfAL32FvecC2Q9Gq+1ts7XWKug/VJG6a2s6MgoThKN6NA7iv8/ezxP/CK6FTcDlbD8
	e7hwXmL8Uu0hZLkfb5zqgahCV64/KQk3CcSFcvW+Cf7Mqks2aZQx8Z7hU8B9ueDSTwPggQU/p9s
	0eNIU5KyJmwIDq3cohMLLBfrDRSQtcXInLY6ceMjr/jL2c09FAY0dtb2rEkYNGq0fblY7pLuvm8
	ihPhJ6rr8g5zQ1nc5DNyXYDmNdQ3ZMsqYVqhVLP30orRxiWsSKwwRKscenJJpCeymXvi/s5xCFY
	EWZiCbVxadAWZorKyF02ysWHD+9gDTRcmkt20+1fVV7NYZHm/JtDbanNJtmnB54VPPd6kNfAjMc
	qc8jUP5YZADXdvTCKaz6YIdYL7tSSI4iwWltQDAa6Rx6W1Z+wH5+wHMAg5Cwc9nFR2XlFrj8KWG
	T9SoU1imGmZNlwJJxP5wsBy2GoA==
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr30563697f8f.45.1793723840170;
        Tue, 03 Nov 2026 08:37:20 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:11 +0000
Message-ID: <20261103163715.385394-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083722_325589_7DB5790B 
X-CRM114-Status: GOOD (  14.73  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
