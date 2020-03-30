Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEB3C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:11:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD5A20771
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYbvkfqm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EF4TwF51"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FD5A20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7H648Qfv+ph/Ex0/dD6kBmaeDSq1gngsW62DyD/WDD4=; b=nYbvkfqmOfkAyQ
	PYubh/sVOCFfA3K/XvgpGaFkbktFjEXCJs1XNbEhoPFyHfpyIh7lAUnDkniUW1Jo3neoU+TxkWKtq
	oDNIAqkFtOFHTp1L6KTREPGwb4AlaCW2lFSIy8V/qspcc8FvAWsGgYWqKRqmCwXwR9H2m8Q5YaIUl
	H2TW8BDvhgS/Gxvz1dvLREXrrXB2eOzD2/Nkp/L80Ux/6x1zBvw67ngM07KtmjZaw7SvFhairWvES
	wFjGIzKcXSWvRj0FVZNIL/3dMKJCta/dPaBdTr6kTJ93yDZ9q+RxZFbcKqqLmUBFH3TicpP0O7Fhf
	9kvGIHN+g4hBxaeNRUSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ2dK-00021B-Tr; Mon, 30 Mar 2020 22:11:51 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ2d1-0001jY-9X; Mon, 30 Mar 2020 22:11:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id 31so23568673wrs.3;
 Mon, 30 Mar 2020 15:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PKd+/SwaFc/8uopc54d2zl4DkYvufR8oUaq7MhGEZW0=;
 b=EF4TwF51AfUN1lIwRYek6+eBZzsQcUmm8bYWbbXGb2mnRZLl1bp+BFHcJbg2P+stbv
 NFnVkDzaV5X/I1su61qbHRah5jskYUf8kzjpDHNCjDHsl+rLSdm2aNoiJHyHtUwCWlGb
 laEVNC+Lv9Y6JUG3Dm0b2NdJ1OOB7+C0q7JHoFjrKJJlk2OKm4D9OdSM+K3TIPl9PnqJ
 a+XHAid03t4cTctRHHHdyUgvwvRMn1GUeHsB8hQYKgRFEcto6iQQc4cV83R+otSC1b61
 cavCZ78jaDH7OScxrngocBBYwK5PTlB9YVMNqmftrhkqdokN79IZHIkPZIHP06aKzdga
 BaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PKd+/SwaFc/8uopc54d2zl4DkYvufR8oUaq7MhGEZW0=;
 b=E2+Yord0dJio6LcbjErvoIBwVA1YcmXhT1Y+lBqnzrTFjUCrhWGyvzuf8ktM+lizXE
 17gdT7PSkjI2iBzX4R79ztWLZxh30IE9CldypVQpUcnICdGSrS38RNBgB43h/rCJmRhj
 VOH8vK+QQkfC4hFuPdFcqGGrr3D3TlgDSLdfVfwSl+9gNGQj69fnQEddmaXRaYeNqO6D
 qpZQPoBkUVCMpnJzYZ9gc3wpCr2UBwQe0LXAF7ZEdlGzH5qzNgSwOC7PGwEs62HtUIzx
 0zLfm5dzmv3KoPbRx86qxvk7Ka/+bK61cqxFQsylTtI7ljtBrvt0/WJ1E0Ys+0mjoM/3
 BZxg==
X-Gm-Message-State: ANhLgQ3yY1vyeN4xisRUWP707JTee1AMiCn6/+1Wq5Y7u9Q9XAzFImZo
 /ueqmZedwdUM+UiRyDAN5J3zF28G
X-Google-Smtp-Source: ADFU+vuzqjpSAFP9jLZ0jvH6APY0YiXy3oxdro+kCvlvWkDnfGPkNvMs4WdyNjCnUsk3/+L+tWmfGA==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr16188951wru.94.1585606289301; 
 Mon, 30 Mar 2020 15:11:29 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b187sm1260509wmc.14.2020.03.30.15.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 15:11:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 jbrunet@baylibre.com, narmstrong@baylibre.com
Subject: [RFC v1 1/5] clk: meson: gxbb: Prepare the GPU clock tree to change
 at runtime
Date: Tue, 31 Mar 2020 00:11:00 +0200
Message-Id: <20200330221104.3163788-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
References: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_151131_330891_E5968C1F 
X-CRM114-Status: GOOD (  14.10  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The "mali_0" or "mali_1" clock trees should not be updated while the
clock is running. Enforce this by setting CLK_SET_RATE_GATE on the
"mali_0" and "mali_1" gates. This makes the CCF switch to the "mali_1"
tree when "mali_0" is currently active and vice versa, which is exactly
what the vendor driver does when updating the frequency of the mali
clock.
Also populate set_rate requests from the divider to the mux so the GPU
clock frequency can be updated at runtime (which will be required for
GPU DVFS).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 5fd6a574f8c3..0a68af6eec3d 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -957,7 +957,9 @@ static struct clk_regmap gxbb_sar_adc_clk = {
 
 /*
  * The MALI IP is clocked by two identical clocks (mali_0 and mali_1)
- * muxed by a glitch-free switch.
+ * muxed by a glitch-free switch. The CCF can manage this glitch-free
+ * mux because it does top-to-bottom updates the each clock tree and
+ * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
  */
 
 static const struct clk_parent_data gxbb_mali_0_1_parent_data[] = {
@@ -980,14 +982,15 @@ static struct clk_regmap gxbb_mali_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		/*
-		 * bits 10:9 selects from 8 possible parents:
-		 * xtal, gp0_pll, mpll2, mpll1, fclk_div7,
-		 * fclk_div4, fclk_div3, fclk_div5
-		 */
 		.parent_data = gxbb_mali_0_1_parent_data,
 		.num_parents = 8,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		/*
+		 * Don't request the parent to change the rate because
+		 * all GPU frequencies can be derived from the fclk_*
+		 * clocks and one special GP0_PLL setting. This is
+		 * important because we need the MPLL clocks for audio.
+		 */
+		.flags = 0,
 	},
 };
 
@@ -1004,7 +1007,7 @@ static struct clk_regmap gxbb_mali_0_div = {
 			&gxbb_mali_0_sel.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1020,7 +1023,7 @@ static struct clk_regmap gxbb_mali_0 = {
 			&gxbb_mali_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1033,14 +1036,15 @@ static struct clk_regmap gxbb_mali_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		/*
-		 * bits 10:9 selects from 8 possible parents:
-		 * xtal, gp0_pll, mpll2, mpll1, fclk_div7,
-		 * fclk_div4, fclk_div3, fclk_div5
-		 */
 		.parent_data = gxbb_mali_0_1_parent_data,
 		.num_parents = 8,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		/*
+		 * Don't request the parent to change the rate because
+		 * all GPU frequencies can be derived from the fclk_*
+		 * clocks and one special GP0_PLL setting. This is
+		 * important because we need the MPLL clocks for audio.
+		 */
+		.flags = 0,
 	},
 };
 
@@ -1057,7 +1061,7 @@ static struct clk_regmap gxbb_mali_1_div = {
 			&gxbb_mali_1_sel.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1073,7 +1077,7 @@ static struct clk_regmap gxbb_mali_1 = {
 			&gxbb_mali_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1093,7 +1097,7 @@ static struct clk_regmap gxbb_mali = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = gxbb_mali_parent_hws,
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
