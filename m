Return-Path: <SRS0=11Ec=AH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFF0C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 10:01:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AD5207E8
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 10:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mn7pWMGd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NyEtXQud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AD5207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6IaXd3R4kEOjMbBI2zYW8FDKpBnHcWmRQT+NXFOvfY=; b=Mn7pWMGdrFoIoy3WGN+AhhtUV+
	asEWI+epyX6/AYXYJrD55OzhfcINRC5fnCeLPqlHduFwyzB/OYuO1BUvKLsLdNHGFhHfov6wySxUo
	PsEDF8CNdbNoDykWF3ZjZ5f/uaehO7DGhzvN01yN2CpO5hwvrIJCTI85rxjADQniYQ+t3CMEMMakM
	f18jjRgt+bcXo0yPOBMs6CE93cQMZDPpbWR3u/eJi1K0/x60xgBT6EncCwWrHjy0h8gqNqHmw5QOu
	p/o+7dPLqGt8OIeRsDrjoWW2n4cTur7gFxcKQgXyPwLeK3L8YNNeD+z3+s/RGN+46xF6YIN/RuQnE
	B00Qy66w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolAQ-0007pT-9w; Fri, 26 Jun 2020 10:01:06 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolA9-0007j0-MB; Fri, 26 Jun 2020 10:01:04 +0000
Received: by mail-lf1-x142.google.com with SMTP id d7so4807231lfi.12;
 Fri, 26 Jun 2020 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jwFq5S23vPzbNJSmrZrgIsKoZN4GTlh6PdOkISx7aY=;
 b=NyEtXQudR4pLxM9yltdxoOlvEPVNBsKan1eHHSiMxVaFZHIkU2d10gR6YakV88025l
 97ELYaLl7xj5OM8POW24GS6S7Q71A7qq/LydfsYJBPoljFJVjDGiu79rsfgl44maHeTv
 CYByd+paQbGFcLSZvt02AdCUMdpogSIKd0UECEDt2uL6WPEYIr8wyZWRyQE0oeYU5XLu
 D7IaQ7pzM53UrmKUedw8BY11vIw9CYn2xJ3zu8DSpD0K+BAoJzovG2YwumZesXjKMvHX
 nDQmvmZ1XzUuSQrPBpKk2+cXMxu2cr/Y6poqKQeNGsCeH78IV5CXvxVb6X+/dQuyZ3xZ
 lFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jwFq5S23vPzbNJSmrZrgIsKoZN4GTlh6PdOkISx7aY=;
 b=LKA6Fp90syKxVl2UNyzNaICJq+0sZsl4RcsoJDHCyeQlkG07vmFKoHOvQvs2LC5tKA
 LIOk57z/NLccJAyO5KI3vMUgTcc2jTvUjfrFEYuArZyZmmZ7D4ttmVnYX3wvoC5gAzM0
 ksA9GTwIepVQrRT6b36G5ex3t/JaBeA28ehVHsUdB6stPUg/KwF2HnDfsn6baztcRiIG
 yJw4CQ6A5a4pj5mFZvX+jZy4CTDq7v+hZq1/xn/XRUDsZXpv/1WUYzxw3OtALLRHeUwC
 l8Vz0fhc3MPzmYAoUhcHQoyMvLtgCEcybIzV5FJ6z4JNlFbrXeSFyTTWfUDmhZ52b3l/
 cLfQ==
X-Gm-Message-State: AOAM533Y/liYK4uvvjyuR3ztA4NAk1Z0BtXqteAEg9k+a7CN1N9KeW3W
 imMQhJ6P/tqbeRdzaR6RWv2T6obe
X-Google-Smtp-Source: ABdhPJxoWeHHa9uUOMDwo1O0nU3whkjZr5zI4DDFkqvZSjaKRhH1psS3keHtfjdJ2XPmlyFHlX+UxA==
X-Received: by 2002:a5d:6809:: with SMTP id w9mr40364931wru.182.1593109313476; 
 Thu, 25 Jun 2020 11:21:53 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370fee00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:370f:ee00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id y6sm14312233wmy.0.2020.06.25.11.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 11:21:52 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] net: stmmac: dwmac-meson8b: use clk_parent_data for clock
 registration
Date: Thu, 25 Jun 2020 20:21:42 +0200
Message-Id: <20200625182142.1673053-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Simplify meson8b_init_rgmii_tx_clk() by using struct clk_parent_data to
initialize the clock parents. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 49 +++++++------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 544bc621146c..5afcf05bbf9c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -69,8 +69,6 @@
  */
 #define PRG_ETH0_ADJ_SKEW		GENMASK(24, 20)
 
-#define MUX_CLK_NUM_PARENTS		2
-
 struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
@@ -110,12 +108,12 @@ static void meson8b_dwmac_mask_bits(struct meson8b_dwmac *dwmac, u32 reg,
 
 static struct clk *meson8b_dwmac_register_clk(struct meson8b_dwmac *dwmac,
 					      const char *name_suffix,
-					      const char **parent_names,
+					      const struct clk_parent_data *parents,
 					      int num_parents,
 					      const struct clk_ops *ops,
 					      struct clk_hw *hw)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = { };
 	char clk_name[32];
 
 	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(dwmac->dev),
@@ -124,7 +122,7 @@ static struct clk *meson8b_dwmac_register_clk(struct meson8b_dwmac *dwmac,
 	init.name = clk_name;
 	init.ops = ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = parent_names;
+	init.parent_data = parents;
 	init.num_parents = num_parents;
 
 	hw->init = &init;
@@ -134,11 +132,12 @@ static struct clk *meson8b_dwmac_register_clk(struct meson8b_dwmac *dwmac,
 
 static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 {
-	int i, ret;
 	struct clk *clk;
 	struct device *dev = dwmac->dev;
-	const char *parent_name, *mux_parent_names[MUX_CLK_NUM_PARENTS];
-	struct meson8b_dwmac_clk_configs *clk_configs;
+	static const struct clk_parent_data mux_parents[] = {
+		{ .fw_name = "clkin0", },
+		{ .fw_name = "clkin1", },
+	};
 	static const struct clk_div_table div_table[] = {
 		{ .div = 2, .val = 2, },
 		{ .div = 3, .val = 3, },
@@ -148,62 +147,48 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 		{ .div = 7, .val = 7, },
 		{ /* end of array */ }
 	};
+	struct meson8b_dwmac_clk_configs *clk_configs;
+	struct clk_parent_data parent_data = { };
 
 	clk_configs = devm_kzalloc(dev, sizeof(*clk_configs), GFP_KERNEL);
 	if (!clk_configs)
 		return -ENOMEM;
 
-	/* get the mux parents from DT */
-	for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
-		char name[16];
-
-		snprintf(name, sizeof(name), "clkin%d", i);
-		clk = devm_clk_get(dev, name);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Missing clock %s\n", name);
-			return ret;
-		}
-
-		mux_parent_names[i] = __clk_get_name(clk);
-	}
-
 	clk_configs->m250_mux.reg = dwmac->regs + PRG_ETH0;
 	clk_configs->m250_mux.shift = PRG_ETH0_CLK_M250_SEL_SHIFT;
 	clk_configs->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK;
-	clk = meson8b_dwmac_register_clk(dwmac, "m250_sel", mux_parent_names,
-					 MUX_CLK_NUM_PARENTS, &clk_mux_ops,
+	clk = meson8b_dwmac_register_clk(dwmac, "m250_sel", mux_parents,
+					 ARRAY_SIZE(mux_parents), &clk_mux_ops,
 					 &clk_configs->m250_mux.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
-	parent_name = __clk_get_name(clk);
+	parent_data.hw = &clk_configs->m250_mux.hw;
 	clk_configs->m250_div.reg = dwmac->regs + PRG_ETH0;
 	clk_configs->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
 	clk_configs->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
 	clk_configs->m250_div.table = div_table;
 	clk_configs->m250_div.flags = CLK_DIVIDER_ALLOW_ZERO |
 				      CLK_DIVIDER_ROUND_CLOSEST;
-	clk = meson8b_dwmac_register_clk(dwmac, "m250_div", &parent_name, 1,
+	clk = meson8b_dwmac_register_clk(dwmac, "m250_div", &parent_data, 1,
 					 &clk_divider_ops,
 					 &clk_configs->m250_div.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
-	parent_name = __clk_get_name(clk);
+	parent_data.hw = &clk_configs->m250_div.hw;
 	clk_configs->fixed_div2.mult = 1;
 	clk_configs->fixed_div2.div = 2;
-	clk = meson8b_dwmac_register_clk(dwmac, "fixed_div2", &parent_name, 1,
+	clk = meson8b_dwmac_register_clk(dwmac, "fixed_div2", &parent_data, 1,
 					 &clk_fixed_factor_ops,
 					 &clk_configs->fixed_div2.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
-	parent_name = __clk_get_name(clk);
+	parent_data.hw = &clk_configs->fixed_div2.hw;
 	clk_configs->rgmii_tx_en.reg = dwmac->regs + PRG_ETH0;
 	clk_configs->rgmii_tx_en.bit_idx = PRG_ETH0_RGMII_TX_CLK_EN;
-	clk = meson8b_dwmac_register_clk(dwmac, "rgmii_tx_en", &parent_name, 1,
+	clk = meson8b_dwmac_register_clk(dwmac, "rgmii_tx_en", &parent_data, 1,
 					 &clk_gate_ops,
 					 &clk_configs->rgmii_tx_en.hw);
 	if (WARN_ON(IS_ERR(clk)))
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
