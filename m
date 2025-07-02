Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8B6C83F0E
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPWckTRQDSvvNZPNiI+aWHLoq44eEMe1WJvfNFTbLYE=; b=lnQaUp0PmINUnA
	9nnO3syIPfx07RyFL3G93zneiNNEdaPN1zCUGV7u4qvEqv8i0gHfLMunAyC/985B7tRCn3pv28B+1
	ZTLDe3M/HgdxVk78ZoI7GjN0FUDEkwmiMU6+nNRh9mHbW+WzBLUBEBeT/fjUlzv7bmTjMxDlR5l1J
	BmhtnvurkP5/716Yl9hCTN8oVG/tn1Ce8nbFdN1zoglxLjrlkO/9DYphLjJgVexBmCd5St0wGUjDy
	jODApKXiqoOHpWDc5gkx7Rwwq43jUairenEg2SFcbdxhDVYPXHKyvgS9Nhc7dJk0viu24dCd0XMnd
	Vzj52avXOCue3ehEoitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VD-00000008zK3-0m6L;
	Wed, 02 Jul 2025 16:40:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMz-00000008mx2-0YCL
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4530921461aso46810065e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470052; x=1752074852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=HZzPJwuWaUaA8/yZQVHfTLr5+JiBAsZzXrpR8L4Ksxbat74gLVsY2AXkASBCUptJR4
         rNj1xH28asM1LLOXBHkGHArQBbqHLPzCvBZwSh9xSp2DNZm+lc9UG1Pw9+84Dym96RrI
         L3MLCvhVZ51tVf4KAyo4z112yzHCC5bHjvfJ7EmP9MygASbZMtD1gYxpiwihMGtOIcmG
         UXLdgRo2EPZQ2O7abJYZLWueilPk0eHgAjGFS78z/gKXEHcMiCkh0jxGnp0ub75cVPjQ
         D1+GOOF0CHpEo5I/C9LPjKIz0bWDXN8ppcaVKGsQycL2U/NmiIx642TkYpzK5dSSIfBW
         8aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470052; x=1752074852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=geROVMOqwiKWz7mAFaH0b4CkDXj0ETjTMTltM1OJuGhlAedGNrPcgnfK545a1+/FoR
         M7cGDDuJ74itTWR/IQjiYRYCBRl4P3/9jtBPZpfeOGUJ7jEx+zHxg1QLJf1uUPFjoUV1
         ZTw4QyrC6IyHcE5RTzNPnYFVZVJ6uEES0LNOTPjY04Y9LuVDN/+UORJZP0fRlO4BTzUr
         +X+McwFFC1lrNVfTqt+u4IKPfNZ6AInE/VB8RqaGBMZVIAfds2gu4nTJDC9bpS/2FpUK
         xc3becEiPmM+tOp7G05FMB0KiMPvGtHTxAJRj/OjTNELUi7fLBbmlYEM2FzugZzdRcxb
         KoJg==
X-Gm-Message-State: AOJu0Yzs9v6OySQDxXHBq9Pc856vy5QYQSGjRynisDjpW0IYNFTeodoo
	EgV4rwPxfdokvqI5IEOVjyg7cgG4bo6o911ZMZJC+HC52RV5UeJRdpFKwnb/P9SAuKfwXsAkPCR
	HZdgf
X-Gm-Gg: ASbGncsdaGby9twq0/Yjde9SLRQaY1hNCwp5V9G4cocO/eNw3w7bTmZlcBx5mhEiKvw
	ChPfjvv5Ad5/shEPJ+RP+qhounrN5B4rrmaLytFB9ZpQ0YSizpYJlptrI2UbNVwyYh4iHzYJGy5
	eIitlfVdSNvxzcUlYb3sov5jtBZFYysoNAPzvO0rbFutfSWNzjWLOo/MbiQrhGVpGpd0ZMiGVJJ
	7/aTmOzTUwIV/F1nHAcqKPnNM9cs0ki0YYDzh6CyVX9RuZ1y4DWOwrknIiXmnBh/aIlgeqLgUgE
	XHpwuvRTIjpPXdsw/ehF6J1i4TrtEh5ExECl7JlRXuVRxd4fvcYFP8qkH/RzhSJneKptYFcB3fn
	T
X-Google-Smtp-Source: AGHT+IH8hCqw18xeYgyrSLAW0jVJ9qYOZglL9NBSV9/Ltql+Tf5mL1mq95DJrcwm8e69G8PvxlB8Vw==
X-Received: by 2002:a05:6000:481c:b0:3a4:e6bb:2d32 with SMTP id ffacd0b85a97d-3b1fe8a1292mr3034063f8f.22.1751470051649;
        Wed, 02 Jul 2025 08:27:31 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:16 +0200
Subject: [PATCH 18/26] clk: amlogic: aoclk: use clkc-utils syscon probe
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-18-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ey5cZdSnxDBMQWblcJDibJDA5OZgFBnUd6WG9uhMGLo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/HhEXl1lNR+pJBqEROld+MDLL5evc868w0r
 AD46aejqJSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPxwAKCRDm/A8cN/La
 hV5TEACPFJ4/iWlXHkdmmbj0q3HTAxSfjEvUJ7n4JdO21V0AE32LTj3tfjqnYQvAU7ol9i8zvHl
 vKfTTY/569cOePeObq8lyuDNt+XOD0ZWwJ+gDJRGcVSoQHmARWeBuTByymecueefpPlJjNadq0d
 TStzOMn7+exOordbByBr1QiC6DzI+t20tZUDfIRh3ze7kUYevNqR5O9aWFi1Li/1P662KM6sKzN
 5K27uoeSMrNMVOStiFPwi5KRih8cp8cfqT1+uqIKlmjbB+7/72rgFjrCJCMFpogjVyNAbLLOIzG
 wuZ9hvGjAsrikJB3O/XFqANmJJXRqMjwBwUus+hg1oCtXAjDNienpR1TrTTutlbo9qVBwRSu3O1
 fpwFDfVIaVwJGVy3mq/ahV2CzM46aAtPiqg7aijDoGIBgXuUmPdwmTHaOL6cdqg52UHG5Pc8nPD
 /K6jFwbuJnnftmbRvn5o6bIYlkHRi60QjU0JNOzpT7Tlv4S2j2M4xTZpiGGs7fdbnhJtu1XQW0R
 PJAoMTdy6IG57tbOJ0GpmkPeiEvWRCc9IeYfC1tKamdJD6bTADWID3X8e725AwnQKPain6W4vTO
 FHhSgTYs/lY5htJmHFsAsznTs1Kw4R9e3n7SQC4vqDcqTroe2aHJCSGw8o0QzxVPuHAcxyUxfIc
 7tB0Kof9AA+8qcg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082733_177270_20ED1AC3 
X-CRM114-Status: GOOD (  14.72  )
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

The clock related part of aoclk probe function duplicates what
the clkc-utils syscon helper does. Factorize this to have a single path to
maintain.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c   | 10 ++++++----
 drivers/clk/meson/g12a-aoclk.c  | 10 ++++++----
 drivers/clk/meson/gxbb-aoclk.c  | 10 ++++++----
 drivers/clk/meson/meson-aoclk.c | 32 ++++++++++++++------------------
 drivers/clk/meson/meson-aoclk.h |  2 +-
 5 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index a0c58dc8e950a05c340c3427af4f6ff7661fa84e..efc33fd18c197df233d537e5f8244a376d4d0924 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -300,16 +300,18 @@ static const struct meson_aoclk_data axg_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(axg_ao_reset),
 	.reset		= axg_ao_reset,
-	.hw_clks	= {
-		.hws	= axg_ao_hw_clks,
-		.num	= ARRAY_SIZE(axg_ao_hw_clks),
+	.clkc_data	= {
+		.hw_clks = {
+			.hws	= axg_ao_hw_clks,
+			.num	= ARRAY_SIZE(axg_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id axg_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-axg-aoclkc",
-		.data		= &axg_ao_clkc_data,
+		.data		= &axg_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 3eaf1db16f45a0adf0acd901ed7ae1f51a9c8dc1..872a7b800bb86bdf1ead56c3eec7e47f30637dbd 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -424,16 +424,18 @@ static const struct meson_aoclk_data g12a_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(g12a_ao_reset),
 	.reset		= g12a_ao_reset,
-	.hw_clks	= {
-		.hws	= g12a_ao_hw_clks,
-		.num	= ARRAY_SIZE(g12a_ao_hw_clks),
+	.clkc_data = {
+		.hw_clks = {
+			.hws	= g12a_ao_hw_clks,
+			.num	= ARRAY_SIZE(g12a_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id g12a_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-g12a-aoclkc",
-		.data		= &g12a_ao_clkc_data,
+		.data		= &g12a_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 11b11fa7791eb1903938c0d3ee46121a23b94a46..ce8d2e9e071759ab8b8aa8619ad7400f1513c319 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -258,16 +258,18 @@ static const struct meson_aoclk_data gxbb_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(gxbb_ao_reset),
 	.reset		= gxbb_ao_reset,
-	.hw_clks	= {
-		.hws	= gxbb_ao_hw_clks,
-		.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
+	.clkc_data	= {
+		.hw_clks = {
+			.hws	= gxbb_ao_hw_clks,
+			.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id gxbb_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-gx-aoclkc",
-		.data		= &gxbb_ao_clkc_data,
+		.data		= &gxbb_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 894c02fda072ddd0733165d5f60efe1d0da2388d..8f6bdea181197cc647398bd607d8b004ac81f747 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -37,15 +37,23 @@ static const struct reset_control_ops meson_aoclk_reset_ops = {
 int meson_aoclkc_probe(struct platform_device *pdev)
 {
 	struct meson_aoclk_reset_controller *rstc;
-	struct meson_aoclk_data *data;
+	const struct meson_clkc_data *clkc_data;
+	const struct meson_aoclk_data *data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct regmap *regmap;
-	int ret, clkid;
+	int ret;
 
-	data = (struct meson_aoclk_data *) of_device_get_match_data(dev);
-	if (!data)
-		return -ENODEV;
+	clkc_data = of_device_get_match_data(dev);
+	if (!clkc_data)
+		return -EINVAL;
+
+	ret = meson_clkc_syscon_probe(pdev);
+	if (ret)
+		return ret;
+
+	data = container_of(clkc_data, struct meson_aoclk_data,
+			    clkc_data);
 
 	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
@@ -71,19 +79,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_clks.num; clkid++) {
-		if (!data->hw_clks.hws[clkid])
-			continue;
-
-		ret = devm_clk_hw_register(dev, data->hw_clks.hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(meson_aoclkc_probe, "CLK_MESON");
 
diff --git a/drivers/clk/meson/meson-aoclk.h b/drivers/clk/meson/meson-aoclk.h
index ea5fc61308af14c63489b7c72410d9d981d8745b..2c83e73d3a7753c2094d2acc7c75b524edb5bb9e 100644
--- a/drivers/clk/meson/meson-aoclk.h
+++ b/drivers/clk/meson/meson-aoclk.h
@@ -20,10 +20,10 @@
 #include "meson-clkc-utils.h"
 
 struct meson_aoclk_data {
+	const struct meson_clkc_data		clkc_data;
 	const unsigned int			reset_reg;
 	const int				num_reset;
 	const unsigned int			*reset;
-	struct meson_clk_hw_data		hw_clks;
 };
 
 struct meson_aoclk_reset_controller {

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
