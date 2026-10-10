Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F996CA9EBE
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfSFrupsHFShB3h47xrxlcnmXYZLNpvtUYTib9fiopk=; b=oAJSEB0Br8Saj4
	grtzzPAiWXcjCsJu9VEMUMWgOkhnwwaA60IfeKCGmbnV7r9XIxdNq1vwrErVZvYY3XErSUd9bi/ZO
	7q/xKP794uY4I6/LT0tWxWiXlxOK3gW8F3GT9DhsA1kGmX5/DiLp6csLAsv2x+NtwQBFuZ7aS7M+c
	a2P6t57ifkXRuZXkDdPGq1VG53e/p04iF80TU/38Bsq425GWEyIKY4OV/gk4cjXMVb+qI5di/Z2YJ
	r1s7J6nw6x/w5lrw5Pvh4H4GHY0OE6zft+JlO+9tA7YFw9Hp2tgAEmhtVAUEjln4ADXvfkysX7I6U
	Jay+MfYdlzBdsrMKzv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnK-00000007s8o-0MwV;
	Sat, 10 Oct 2026 10:59:14 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnE-00000007s0g-1ijB
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:09 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48bbb06e746so278871f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAObO9x1QF4WrfdAIN5+rU7Yr3xIr5PVFD+T0h41GXs=;
        b=KdFTgYspVvKFl4BGBe+RIuxlaj4WstXqiyKBiiB6RVAusOIPd028hiN7+HzMCQQiCZ
         5uw4bhVcLG1H7meuljpb/CZU3rtyvD9mIRhNhPWiXHYeS2VjHBfdoxjgko71zPDnkJku
         yFBR5ts+85M6vZlBQUViCoIuENGSIYUetNVRiklCPRW62iW6UbULyl1emrvghlOO1thM
         iBb11tENo994tP2J2my+7Hj5pMsVgx+l8tqy6hx9cMZl8EFZRR12oowNNk3CLM4IWo6q
         3RbF3BBkhMt79Bv981xDX8tpVId8vdYO5MNa6BM/cvMTV4jR/77H3MLpACIIo+1UiPrL
         2exg==
X-Forwarded-Encrypted: i=1; AKwUvBzuWrY6pLraAoDSiifGw8JPMdgz9o8WR86coUvdPVJMonZdPlZlI+pMUbKeTsuZqJvUzodkwij5AZBDLpNS@lists.infradead.org
X-Gm-Message-State: AFq9FYIOId8xuZqLKPKflUdDXTOOLW3pXPoAqWAthxagHaja97qJaxd9
	Qr9f8+N6lb5d5jbTO9lEUBA6cMKZSltUcPibGRk31/qr7w6UwAaZ3tRa
X-Gm-Gg: AYBFou30oeBEC7UVAE9raToigfvsp9FZVPy6wh2kvympi/XpozX/dgnfQ1UKCCT2g3N
	mg5AwDD/hY/qumFnpqkZ5mNBDB7I31Pqyer7zmfNxnrULRfKJNGdsMj35JjSmmFMkxG08/7gGqE
	y036NkYa2nlEByDFWigNNbd04/aBAknqjVi0yufGMJgQba871pAY3RL9mTC4JCuVtdy6/rZRAFJ
	BfdLDUswUbu6kQill1JxGLQEo5vfMmquKbZGQntKfpdmJyNu+o+dX10J8RE5uUITD63pWaS9vpZ
	xPdBFDoGGkQ4XJvTv5IL3hDQ61A4L6hKGRfX71PX7RxhMqsgw6PaKeGIbEDIsgRcajbtDKgnXcq
	VF5vOKR6y3qZfN57avIPeL0nH/W83nbRzL2jj6TOkWwjYaqvXMXGs1PuaUvuJLSbaLxFRGsnqJL
	QHIqs4/UOue7eFKxPeMAbGqVsyLuxmaF/+w6NgGHbvKACJ8FoueghBJY+T4d02GyoKVPAl2TTCG
	Ve+m48Z3OwQk+Zx7lBOnj5MjbD6J4ZcU3A=
X-Received: by 2002:a05:6000:491c:b0:48c:4272:86b2 with SMTP id ffacd0b85a97d-48dba9bdcfemr8482673f8f.11.1791629946574;
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
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
Subject: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:55 +0100
Message-ID: <20261010105900.247342-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035908_508218_2A188FEB 
X-CRM114-Status: GOOD (  15.31  )
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
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
