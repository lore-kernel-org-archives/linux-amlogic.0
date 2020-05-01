Return-Path: <SRS0=tEAa=6P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6BBC47254
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 21:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B7622166E
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 21:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXrlznlK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MuTDr2+2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B7622166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZ/A5pLRDGkxI26i5xs4jhB5y3oH6tmqmoSGbZ/NJHg=; b=hXrlznlKms5TS6
	z0ehUK/20raFgQFBrPNkmrcqFFQ4Sag5Ke/FFni02rQWuqNCQ4uZ9bmkSZQap6Iq6knn68j+xa42j
	Nbe40sMefHV6QCK7FGeyC4uvR85vEoIlYC4LVcc7jTfdLdbn+OonN+3nFQxVA+50K3dsG8hs0OvsK
	Y9oIqi+Xd/Q9XLlYW1SsP+hOyvwf+yN4bfXStawN3YOzSA6yd5BMo4Iedz15kwKAP+WKv565kbjIO
	IjMtQRATfgImdlztjshcW/eDAvLY8Afro+pP4sInqwi7vOUT/PcsCIdfq+M1nhXwLgnbFaoSSgCZ5
	DhjbtIthPfTaAWrfCgcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUdfG-0007mI-4D; Fri, 01 May 2020 21:57:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUdfD-0007lS-0t; Fri, 01 May 2020 21:57:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id r26so1385768wmh.0;
 Fri, 01 May 2020 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LeCJAhwRsYVxYzeo62O1bYkDk1apTyT1HdK24IWP4Fk=;
 b=MuTDr2+2DQBHsrpjMQthLR/Bz409Aar9bo8FDua4h2bu8tJg18r6nXJFs/VY8o5xiC
 MEu3OaFM0ItCRBVcDasFGSinNIYW6sfKDcBg7V8uO+fYnqJ4BpYpkQqGQA+u62O5uoRB
 +/47Bh3V63s1jj81/t6ZQfqPeTqcD4x63yWs5jvXNAIzFowOWGozXWpzCxS34ZROLuTZ
 a5WeERqfWz0ui64H/xLvVqyrHU58cht/aJxjOK8eQ6DZZwDSnbpLBZWHQufy930CPI3L
 F1pLCgdcD8ceCgZEEi2a3rUqRbQbI8YGFJhAccqSUPewzHSNFC9DVcTfT3Qyl6E5yYoH
 lK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LeCJAhwRsYVxYzeo62O1bYkDk1apTyT1HdK24IWP4Fk=;
 b=VQJWgXVA+iOM8EeNc7B26HurBTKsRnzH9hkz/kDqKuEIOFPpF6zyN4dJH34wgC9orB
 4wzpGXIdRjNqqfgYLC0FsbPzyhF6W6sMAcZsGvNcLcsu34rR7J/EdZhUr6lToAiLpOX9
 Rf+QLpeGzAkEF7bVrENEd3a0jsnfd/8kNTZDcCs298nYSGodqi9Gyv5Rs72iUXC4SaV1
 CGk9eeO/xGhi8unmaeDs6wVeB3Dt6/i92KJQG5vEyFlIt8IOH+wxR6ECxh37A23CZjhW
 FyAVQAYKJ3V115PIeeY6qCPvGbITvabbHzNaF3W5Dc00SewjYDz6bweb0vR1PXSxVu2r
 AcUA==
X-Gm-Message-State: AGi0PuZPDY2nROMX+kI1nwqFgW1Z8c7F4VTobSGvh92MK9sWMJFl6WBy
 /5FG0ovyoeHhCUOR8uLqP2FaHKt4DHYixg==
X-Google-Smtp-Source: APiQypLJWmvp14R+a/AtW56ASJefOAyOcJNiQNBB7+Ntawn8Bd5VJ1Hj08P37W+9ac39QOhMNpr2ZQ==
X-Received: by 2002:a05:600c:2945:: with SMTP id
 n5mr1501227wmd.148.1588370258953; 
 Fri, 01 May 2020 14:57:38 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b66sm1373412wmh.12.2020.05.01.14.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 14:57:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH] clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL
 registers
Date: Fri,  1 May 2020 23:57:17 +0200
Message-Id: <20200501215717.735393-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_145743_090132_608FC7EC 
X-CRM114-Status: GOOD (  12.29  )
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Not all u-boot versions initialize the HHI_GP_PLL_CNTL[2-5] registers.
In that case all HHI_GPLL_PLL_CNTL[1-5] registers are 0x0 and when
booting Linux the PLL fails to lock.
The initialization sequence from u-boot is:
- put the PLL into reset
- write 0x59C88000 to HHI_GP_PLL_CNTL2
- write 0xCA463823 to HHI_GP_PLL_CNTL3
- write 0x0286A027 to HHI_GP_PLL_CNTL4
- write 0x00003000 to HHI_GP_PLL_CNTL5
- set M, N, OD and the enable bit
- take the PLL out of reset
- check if it has locked
- disable the PLL

In Linux we already initialize M, N, OD, the enable and the reset bits.
Also the HHI_GP_PLL_CNTL[2-5] registers with these magic values (the
exact meaning is unknown) so the PLL can lock when the vendor u-boot did
not initialize these registers yet.

Fixes: b882964b376f21 ("clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Jerome, this one is also not critical because we don't enable the VPU
yet. So I based this on commit 16afd70af5b21b ("clk: meson: meson8b:
Make the CCF use the glitch-free VPU mux").


 drivers/clk/meson/meson8b.c | 9 +++++++++
 drivers/clk/meson/meson8b.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 811af1c11456..edc09d050ecf 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1918,6 +1918,13 @@ static struct clk_regmap meson8b_mali = {
 	},
 };
 
+static const struct reg_sequence meson8m2_gp_pll_init_regs[] = {
+	{ .reg = HHI_GP_PLL_CNTL2,	.def = 0x59c88000 },
+	{ .reg = HHI_GP_PLL_CNTL3,	.def = 0xca463823 },
+	{ .reg = HHI_GP_PLL_CNTL4,	.def = 0x0286a027 },
+	{ .reg = HHI_GP_PLL_CNTL5,	.def = 0x00003000 },
+};
+
 static const struct pll_params_table meson8m2_gp_pll_params_table[] = {
 	PLL_PARAMS(182, 3),
 	{ /* sentinel */ },
@@ -1951,6 +1958,8 @@ static struct clk_regmap meson8m2_gp_pll_dco = {
 			.width   = 1,
 		},
 		.table = meson8m2_gp_pll_params_table,
+		.init_regs = meson8m2_gp_pll_init_regs,
+		.init_count = ARRAY_SIZE(meson8m2_gp_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gp_pll_dco",
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 94ce3ef0c1d5..cd38ae2a9cb5 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -20,6 +20,10 @@
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
 #define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
+#define HHI_GP_PLL_CNTL2		0x44  /* 0x11 offset in data sheet */
+#define HHI_GP_PLL_CNTL3		0x48  /* 0x12 offset in data sheet */
+#define HHI_GP_PLL_CNTL4		0x4C  /* 0x13 offset in data sheet */
+#define HHI_GP_PLL_CNTL5		0x50  /* 0x14 offset in data sheet */
 #define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
 #define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
 #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
