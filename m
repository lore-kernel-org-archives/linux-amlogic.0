Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E83C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DDD2084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfyqoGP+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CuriOZMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4DDD2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+N5EDZIyZYFSqtaAdBquS7eeaDjZ9KAUwWvB72tLv4=; b=lfyqoGP+NckE9S
	KLXBr7Ja7FiUC+b/ym6E7rRCm1d9DWDziWkXVyn7JZtxCdsFmLpRtzfMFxE0xTIt9l1CSmCnFRpqo
	os/BXCblJGGBFxXDBAbqoa6JUnAMDk+FfCUn3VXe4KwstF44KLur63v7CYUfXKvZl6XQZCLctVcGX
	EIwM5i0U5coy7iIkQM6s3ZvlhXrNYQzmV2qh1vPy4XIpME5rLd9vaHvzKEz7CFyKtM3RNVRWvf5CX
	2WnKCjD7e2MbgpMl5lh3HUZdrvISqZcHIqNlKsIuZQLN5r+YSwwL35enaNesfEeIdSBUpT+JoS9s3
	ml8fWr5birqxIqtqtTaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEt1Q-0008HP-Oo; Fri, 12 Apr 2019 10:03:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt0t-0007Zw-9y
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 10:02:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id r4so11123508wrq.8
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 03:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=/7UXe2DQp/yMvOny3p/HegPYQz23AchTDS99VgInBWU=;
 b=CuriOZMvLZu6W5D0eoLTC8FoMZJ0zKbd+M0jAoDyAEqzbJn4eHScWYTnqr3qMAl+cr
 nSA21A3498huru6/8evhz+PrG89PYx3JJnkjfV1zSzj95EwZHpR9kWlPFAJuT5QqKjWM
 rFN4jH+2B11jUCrJKBC9May6Ol7HA3M1QsHJplEzERBg0FL9pKZlrF354tFBfndSSCmU
 Jki66MQkVLdcRLbevlSB/w7Sh4NywcDzhnadGujKZc/B3bLvNsJ2GhCjaMolR2QBNO4J
 k5KDn0F0VqlFrBvGiKvmkD7SDAJIDN9761cJmHzmj8EorNUH7NKFAeYaoCsAzpeQl+2G
 mtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=/7UXe2DQp/yMvOny3p/HegPYQz23AchTDS99VgInBWU=;
 b=RsOw5BTDXTQZ1aA2xYdM+WUOJt7PwkNGi6BbcZEtvWzUqrnSKAET4WgRB0llPVAzCe
 d4eROhdrASSjuMY+juElKT1j7uFqOj0uLKElXqrwVIdRrkVcvXgDeLOkStbhhHD99cgM
 wWW5J2m8ixu8usjooIGSWmL8pfu0gXy2pJjIJ93gdPSovUw/LDy0em+SDfODBcyaqyDZ
 /6mcfHdp1XJ4V27kybMf1PfWUmu25HyWL+S0Ylgs/9CxMdXw1D0vGJTyc64bYelsDImK
 nWC+2jR+rMP71aKS2Kd30xv1EMhUzsgl35AVohtq/BiCDOhKnDGY6yDxWefNNzxAeEnF
 zGuQ==
X-Gm-Message-State: APjAAAVMIJYemWxZMGTY5HV9kPkLiiEDM5Tp+i2UnknHR9jj/57PCSp+
 WU5cVPjf0T0GGZzttkKQOS/7jQ==
X-Google-Smtp-Source: APXvYqyXe/x7KxLnFH96TFnOajXc5ljmtO4D8GhNtWC1yk24LarkgfUMteurHFq/GwhD8VRy650O0Q==
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr24909809wrs.5.1555063345983; 
 Fri, 12 Apr 2019 03:02:25 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm5961031wmi.16.2019.04.12.03.02.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 03:02:24 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date: Fri, 12 Apr 2019 12:02:21 +0200
Message-Id: <20190412100221.26740-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_030227_393261_48954913 
X-CRM114-Status: GOOD (  10.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add TS clock used by two temperature sensor

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 86a7c1b5bd42..0a1cf782670b 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2480,6 +2480,33 @@ static struct clk_regmap g12a_mali = {
 	},
 };
 
+static struct clk_regmap g12a_ts_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_ts = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "ts_div" },
+		.num_parents = 1,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(g12a_ddr,			HHI_GCLK_MPEG0,	0);
 static MESON_GATE(g12a_dos,			HHI_GCLK_MPEG0,	1);
@@ -2769,6 +2796,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
 		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
 		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
+		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
+		[CLKID_TS]			= &g12a_ts.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2966,6 +2995,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vdec_hevcf_sel,
 	&g12a_vdec_hevcf_div,
 	&g12a_vdec_hevcf,
+	&g12a_ts_div,
+	&g12a_ts,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 39c41af70804..877b8d205f12 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -195,8 +195,9 @@
 #define CLKID_VDEC_HEVC_DIV			206
 #define CLKID_VDEC_HEVCF_SEL			208
 #define CLKID_VDEC_HEVCF_DIV			209
+#define CLKID_TS_DIV				211
 
-#define NR_CLKS					211
+#define NR_CLKS					213
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
