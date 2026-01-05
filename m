Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892ADC9833D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jtf4pxatF+tgU9Z7S4y7RG+aaTspx3e16N9cN6YrKi0=; b=4K5MRUsdNlVHNZ
	F7ixYQN/IT/Uc5f7p9ZCC/P1hOqBS6V9OG9Sjtk1AY5vZoCiLtPoAqxeSJtoNSuha7dWHyWmEvCcZ
	dda5iDUzyqG5SsEjLpwyO2ao0U7LmKXCnmK2m4gov8+pVNnDtG7mkabthG5EVvy4b0PSG2TGtbTDC
	W0ysYI7wxrsFFBJPojmgFDJKoysh5YJF8qLcszMDIDzI+UIywEeoMrRbMgWflmC2orrDAvRotj+h+
	t+GVEqvn4AyqnVuv5BS62SSfC/TPsaGxDxn2SqZgd6qQXqKRNe1g/IEjSQHOMvf9Fa+g+Yni/qhQp
	PTnu9EVR/rpVZRJn/vhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUL-0000000C4U8-3O5q;
	Mon, 05 Jan 2026 20:47:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUJ-0000000C4QY-08xj
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b736ffc531fso78866866b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 12:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646057; x=1768250857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=;
        b=m951FwqwF8Sbkr+mZVwqCS4c/vITK0MWFZ5k/uhHVvd6w4AhE1sQ50adqwGjweedmf
         D6sMsVkW8iSgPKFoCaJzl/Ns66X6hFbDRtoM9RhezebQeq4O9TDYd7PyVOsTIYrTN6VY
         xv9ee3oSIki69XA4OKsQ2/F/4pJIXUgBSK0qqaasc8RGuvcp2Ec4S+g4RWaomR/a19h2
         UaSaOzdV1VsdcXzj/Vl1fVB9hyxAXebCFFG8utXn/B+AgiHoE7Fz0ItGQ8o1cEVdrQO+
         RBPOb8f6dnsYjem0tZnvIP4b+UgWvutZ/446Z1NEON7G3PJR4WSGIynSZgBMJSjs1fF3
         2uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646057; x=1768250857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hizUAH1iD19ouU6HKSD59ruDhjDWmQAYbT869eukFQc=;
        b=A/NPUeK/GID1srzMaE+mPfdzgIsjn/nowq3HYiY++8/ceYZv5lCZsqKhTNTsJ/mXIb
         x57Huxsu11vVo0VbykOFQgiraxWBVcnX5JrniXeeqdVsTSky4gdahBt+3FVz53UA5imI
         k3z7aez15m/KzJBoaD+3ORPl/qHA+0RBFuoREAYzsYfm66GBJBEaRDO8a4I1YoBC0/gm
         TwSSoBBgCN0OkOiZzf4kgl2zVB+n/aO90lvT0SbCNVIYS1gEbdBGh/df1P4omPvCn3Au
         pbZ5lqm2nJ0CX7YLpeGZ8shh51ENynlDTzPe9cKea17KlxSTg7aRPX56ObyAZCKN9OdG
         IJCg==
X-Gm-Message-State: AOJu0YwBbtGTz92esOu9NqxRNc3C2qj7pQx+mpVVMCPUp8yhOq57M5tr
	itoaolUzNS8cPL4Aors9hHA2D7VMj5YTa+44DwJqLih+DRgqpRAiqp94izfGwA==
X-Gm-Gg: AY/fxX6iaPuIBA4OgkSNPzUGzD7bElsoIth8IIwC7TgmiPHiaq19DDctcos/oDIizZq
	F6A/Yi3IblQ6x69Ls80A8HfaNedshsrX861slIWBD2mleDYQ/+++t1uPX/aU82M6xsH9EnOy3AN
	N/rRmh7YX/jF446acyptwEWYse0NxwQvtkjbf7PjS6oZxjjjj6EeSiOrE0ECRL28BKdYAYpNWgj
	mhDhCJ+TUqJQA1ehFvD5Qja8iHxMzZ30QZC8yW31Og07t36q4RewptN+CSrREfnT9Wtw9b7N/7H
	yub0r9ndXdQve5811xk42L6RuinLDoRpaAhxUZhvAMuLk9j8/rVQP7LCmTTyZjEs7YYz8lHAeq0
	BToJsvLjMHACKaGJlkz03HwIYV906Jt+LXUbrwXTNx8mM6IGIkv3bar7JTKrx8C+cX3ERosDjSI
	14P/OzhMnt2Piz0OOQuAeBa6k3yY2KMNbFjUuKLyANDEhpfc3zEMPT/H+P3dm38kKrZbiZg5d/7
	JP63GcgLIbI/9VEoUH9djoW1dImSBKd7MjS82XSfQ==
X-Google-Smtp-Source: AGHT+IHoFwU8UR+te3U4dWAJlcYcZOAjrsIoaFipeIJMAXppeowFkGiwsu7iqdcxUVE1fCrIPqg8ww==
X-Received: by 2002:a17:907:3c8e:b0:b79:f965:1ce1 with SMTP id a640c23a62f3a-b8426bedeb1mr92268466b.42.1767646056667;
        Mon, 05 Jan 2026 12:47:36 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/3] clk: meson: g12a: Limit the HDMI PLL OD to /4
Date: Mon,  5 Jan 2026 21:47:09 +0100
Message-ID: <20260105204710.447779-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124739_081062_02395A2B 
X-CRM114-Status: GOOD (  13.62  )
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

GXBB has the HDMI PLL OD in the HHI_HDMI_PLL_CNTL2 register while for
G12A/G12B/SM1 the OD has moved to HHI_HDMI_PLL_CNTL0. At first glance
the rest of the OD setup seems identical.

However, looking at the downstream kernel sources as well as testing
shows that G12A/G12B/SM1 only supports three OD values:
- register value 0 means: divide by 1
- register value 1 means: divide by 2
- register value 2 means: divide by 4

Downstream sources are also only using OD register values 0, 1 and 2
for G12A/G12B/SM1 (while for GXBB the downstream kernel sources are also
using value 3 which means: divide by 8).

Add clk_div_table and have it replace the CLK_DIVIDER_POWER_OF_TWO flag
to make the kernel's view of this register match with how the hardware
actually works.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/g12a.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 185b6348251d..19057d2dff47 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -777,12 +777,19 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 	},
 };
 
+static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap g12a_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 16,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od",
@@ -800,7 +807,7 @@ static struct clk_regmap g12a_hdmi_pll_od2 = {
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 18,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od2",
@@ -818,7 +825,7 @@ static struct clk_regmap g12a_hdmi_pll = {
 		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 20,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = g12a_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
