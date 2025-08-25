Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08530CA0FF1
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPWckTRQDSvvNZPNiI+aWHLoq44eEMe1WJvfNFTbLYE=; b=gvT8zWB88Xl2g5
	jmij4Bd0k/OSzi4fAUzi6FmZ8DwLVwH8fdwzAEqm3q5G72kzj2syPZn7fdOLDycKViYKEXswwBox4
	gAbb14O9IVrvUNJDT3y8QzjTo0paXQGyXQx0VXDW6ulvkcdBppPbtxehU3DBwqza/JU3silmXCiAC
	DucQzx7W5cQ21MkdEmGgmPAFrmI6393bBh/8QymJtMSvg/dKMgdOLEqfObKBzjE/zu/w77bK/d75J
	X7paPZR/Avxsp7FMuhe+0f683rfGFhGxNAxf9JNNwCLVy1XjRdffwPj4Uvels5zCWBk8nhJv9NPIQ
	NtRn5oC/R0lqRN7H9HLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9N-00000008WB1-3QdX;
	Mon, 25 Aug 2025 15:30:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYAA-00000008Fgy-2ct9
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso3756343f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132029; x=1756736829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=r5MiBzKaJ4+OZ2pioYiHfm6Cjf0da9hhuAeAHt9G+rEtxZ3AQwi7TvsvKDZtHgyXdU
         1dGQ3Id66r8ru3Z1tn0Jz3pAmJigpGAUIMWl45wLBc4qL0LzOV3qp6nSzQpXvMamj9yC
         Yu/v1JnRbql0NBGEpWk5c8GO4iOM9v2a9YsiVu3z0EUgnKGGMcXLLoXwr0XtWVEnxpiQ
         Hfl3sTOuxmPV2wjwBdrzob/npFNg2KgouKD174JlEmOX3Bt5q2m2D0x0btQeIC/P4P05
         wVjQusuCwDM/wgk8EvQDjvy5uXzfEHm4H7a5xvRRvCdEa0rlfxPJwoE46xxv5aLyf58I
         0Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132029; x=1756736829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=VHu4xP0oagbEkeU8+wripsnIFjHzY9TzPI4t+gxeu5YFQus0VnBEgSWTAH3NVszhWw
         JR5yA+cqPmpo0r4kg+vDR9J8qGWixSCxCpfMXxMwcFjEFVtdK8on5Gvy0L4fFbacoHve
         O5D0bD6c1CXWZM8Zc6/e7OSdQuE3OPRXCIbMM3Ppj0YXvCACXIBNE2Oc/bNbQ76EURyE
         ry/VhY1KoBPJugPldTSytxvBGLv72Lo+y3kBJGzsR05yZ1c4Rwf2qh2SzsJ6zgXPONqy
         jWQO2B8UVEi6npddFKbUTg0U7vaKdbaxmHv7p2N2rEVoB3T3LgNVRHM7S5g96EZ7ggu5
         tKQg==
X-Gm-Message-State: AOJu0YxFmAqVBEaxdTXsWmTGi2uOzac3VP2UYneq+zbckK6oIm5KXS6c
	GK0m80Kzv+GGnht30ATkHzp7uu98oizbWsK7Z3IsF60YHzKuByshwe763MqCRIqzO/o=
X-Gm-Gg: ASbGncuVSMphgxGnlsz3tZPVaJo6USaq78riraHls/BiWezJFs9aZsb9A0f906JM+dk
	dE9atmT+Ulr0reJE5WdGjDF/00VIPfLLvX0M/LDpF8yVLLVc2FI6JPD6QjH42EtMtavowIi8O9P
	xmXzA+OTSUZA7C+hspY+laR7PSPsM523+yk+7QP7XC6jA/aCaWX7HtIoSVkI2Wf2w8He1mkP3iC
	63pClEjnCcOnR9QkMAoQZiOpJMv2eHpS0+tDnbxLqLysVa6q2M8g0OUJzn65ar38ErAwTSiNfX7
	yPIek4VIf4FZmdiqYTyBDEVbjM6G1DYvEOzsS4MR0+33EFADgG6uouteFmt8IN+d8nXujoLgPPF
	vVhzx2CumPUmAjX17AzkEVBL8xpcxmXnotPlq
X-Google-Smtp-Source: AGHT+IHt4lgpYTFRKVUdHW44E3mNT49oLGAxgQr8oV91u9YCleboiVtqxtigsGd/l4FjIi9FOMDqlA==
X-Received: by 2002:a5d:64e4:0:b0:3ca:6a35:13f4 with SMTP id ffacd0b85a97d-3ca6a3516c3mr1642673f8f.46.1756132029030;
        Mon, 25 Aug 2025 07:27:09 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:29 +0200
Subject: [PATCH v2 04/12] clk: amlogic: aoclk: use clkc-utils syscon probe
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-4-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ey5cZdSnxDBMQWblcJDibJDA5OZgFBnUd6WG9uhMGLo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKxESzysED9LwfQG3fV63KVp0SL8l2UgmZXi
 8CCokopy0WJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxysQAKCRDm/A8cN/La
 ha3yD/9FcCX7DiK/3I/l/3yH9yWepYrt+n+X3Gsl9mHQ0mS1p7l2/X+flH6m5LUNMEZDZj3203n
 +XvvAepAIKNwsGiqA00GHEmFIHZZmb1zgbjUx5zO80SjyPOMrXyxh5Ur0yM/9Jq6D1c0XqBbb7Y
 vpr+z7bmk2PphcrU+eA4R3aJo2EJFsHxSyQvtiNO/wAsQQMM35SM/goZyXvG5sUSND1FZuw9QMF
 lURAPl8N8+OmKOIrHbRndwoNnyRMM2MzZpoE+mh4i/x8ObxZisk5hn1its81dCEXuct3CxRdxPi
 K/IOo62RiY3lZGIhJ0lIubUW5fWLE+26rnwq7qfyqxmvZ68ifUzLMvJbYc5gU1sTSLRYdKiSVVG
 fdX4jgbLi8iWJbUd64Z3Qf5fJGlWlqWzcroWZIGciOM2+lI+Tp54TX2x+SiKcBbbh8Q714YoiTt
 pfkladXgNyTMzwJLYsPl3/8YDTDS8SOzrXtb/P3eq6Inb63FyTjl+FfwvXE3qg5pV0hpHoxT8Yb
 CAbnwrPNULHYs9jzbGFSZ88sl2Ds8KXNn9IcYA19LULt9Yji+Od+YwBJvM4cfbhT22/hLSK8XbG
 +agSjfpjdmbbzE3WHEIndXwlvrYZxYiVxeAAjEE6DOtZVQpl7eePNCi0vSTKHEJaeyQklyofR0p
 xu7N++N9VE+YEyA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072710_673128_9C9E506D 
X-CRM114-Status: GOOD (  14.89  )
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
