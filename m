Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0FCCA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7Os6reWxeVYUD+soOn3bVtBmYHjj++yNLbdkk+xiDo=; b=prTae5tJyllKIE
	70vg7UW+7D8a+3STDJQ/e/j4wabG6eBfnZOsm3IMxk3MepxUTOmcuT5gvQSL3OEX/7T0KfIHv3bEM
	hmiFFn3nhF1rb8RQKgpZLNeFrhnzsnLMBGDaxlrCfZa3EJmp6NWDi51Ne76qLXOE0Vnfl3z99hlkE
	v97dLHTcQlQFFu36OJaztuWFVl0Z4xmgCOQJgjWkx8TL+BxauRLKJA4nSGm3FWFsInDl8nT5aY8BR
	AcRTw3NBsbHDb1j5Fa26i2n6Ur2ajUy/k4jJ5+yYkT+sS7ZlgrVvDteT1ygLUWDT5/HB+tizn4ywn
	x2+LcotmSsXXX/i1MkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyz-00000001wTT-08v2;
	Wed, 07 Oct 2026 08:26:37 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyw-00000001wQB-0Qwo
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:35 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so1069146f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361592; x=1791966392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMznkgAU7RcKCyo2f/X40iNVhoTQVjtCnARNVdFftYk=;
        b=RXl6AkmY2QAqhIzpCwGwOq1eH7gF8BoI0DGryyerJfw+eFmYyMeJuNE8a9qNg0Y6Qo
         I0dzvW4pcZQEEpxTbc1Ocuao3uLzVaT+t0/Akj5hve1jYjhT07/rwxZhNA+XGZka/Ei7
         XtlyElTKnBbstUWJ84M8ES4vfha+1OZPnxr24ttAPzoGgctCxxLQdXXWNSrOFKUj/feI
         C9jiHROoY2ZRjaMuJHH7BLxkQjxqiBgSZrei4sjgraGMWD/MeV40aeoydhe9gie85GyZ
         zNEloQA7foYfwur9AMbg1EiQ+e7+oaCdOQHkxNNPizPdD4Y6iEXme+bsgXQi+5iqgxME
         +MzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM7pRKbqXoZ0v/JwgQX3FUN4i+eZK8cAGXNRakCB6Gf/2m9f7+ZlxpWfVeIUph9r9ZQyyeq9N0E3WfVqMI@lists.infradead.org
X-Gm-Message-State: AFq9FYK6pLS/zsVYspY57/C3oxuyNXiJDWel3P3IdLhIFTD1H8WyZNKW
	8FdxGDHhpJa7Sws2xYFylRBZW0B01YVXesHkDgEnIA+bKu7wtFQZmHX+
X-Gm-Gg: AYBFou3ZBc07PBa8mNwEp1Lip+4cazOv8xtFF6b1jdNyaam2hW4d2rFGSTUlCihi+qQ
	I1qlpRNzPfJIvbhZl82Hof26LuGa8SKZE5YAuvMcpiZfIR5njlXu2cTXc4XE2EaLHz177kwbopP
	23OVqaUU9s2bGwPTiwFIh16yNsYAWlUbdlIv0/A5rKZOSsKpC/tkobkaVAybq/Qw+jVNFfyzT3i
	yZMGr8drmEmKNS4Ppl3Y3YqqkaC84Z7xnJQfUxaoWHZrVmRH0HuV83e9TOQWYlLIPjPGXYO5Gwo
	0GXhp7Mp+qObILpoNXmfsiSk/eOObO6PmJkimtoYfeejAnX5P7SBrkxeFdF5Hm3T7Cb6XfOHQ/o
	SJZ1X39ZXorztj9kmEtCshw1yM50ksSiyOJYunosuJNoxC/QG5SocJW3xPl95DQpcebXDYPR0Pk
	FvfOciftVim6x1zQ0bf1k1IVC6VAHzqlSlgq4mu1/usC9I9LWo68Ja+jT831/3ZAi7Btd9GqQKB
	X/pwUceN5MJ0eVQTr3oWpksUJLMkL88LNo=
X-Received: by 2002:a05:6000:4819:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48c726f19d8mr2561452f8f.5.1791361592372;
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:24 +0100
Message-ID: <20261007082627.63807-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012634_188951_DA973CAE 
X-CRM114-Status: GOOD (  15.70  )
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

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d73dfd0ac167..dd10d719ab84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -402,6 +403,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	u32 tx_delay_ps;
 	int ret;
 
@@ -485,6 +487,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
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
@@ -521,6 +530,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
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
@@ -542,6 +557,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
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
