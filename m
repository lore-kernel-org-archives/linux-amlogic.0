Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FB6C47088
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=As2/R5b37zRgQTxYtnMebFBWZJ0a25C7PYRYzHSJDD4=; b=D7+lYLi467sWvl
	CLo/9O6cON1o4FJzkSSRjgY4Z4FY2yyGpVC0l738zXuEuRYKXeh7Dm4IF7C0VA27GDnz/0kPqktnB
	xNCAPPy5zIh/4LiHevRTM2ZMv1U98eWhx0Q5qOWoWZ1ODBcdPXteRprEpdOssvVikCk4ZV8q8ZY6V
	CFD+K3zJNs2NpKjWWfx3uOZn2Xw0wf2WzVAe4vjlxmIXY8msCAG+qI5h+yzX3QPe3sZsQ1TiJRXqT
	AI+AYHDibBRoWfYNY0ukx39fwZgrBtBZZwtdYkOjINkY/Mnhcc+/1Cw9E16hNC4prYjNwFrXkcEkC
	Jmn5xdR9G6s0f5fHlTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14bV-00G6Ye-Cu; Fri, 02 Dec 2022 11:53:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14av-00G6HM-Af; Fri, 02 Dec 2022 11:52:42 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x2so6204455edd.2;
        Fri, 02 Dec 2022 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFkg6LALiTZGl9NAXbdWzz4DpTKGtwoKK/kUM7aSbHk=;
        b=MGB53sJL6yNAkcbcZAcQts88mjn8TP+JI77aEgnVW+FAk+1d6rh9ciPxK90Zeee/Cm
         2sIEUfrOhCWKWZQbuL+VJvUUJBL5hZRrkL6ReE/KKXcQJ/BVqjaj+i6ECDUu5hci0ot/
         lgYI37DqkagAHEbN6+IfcGdqdKJYKhPkuj2q8zblZ7FCFc3bB751wdFMitgFkfLs2AoL
         CGWyWvhYZLQT0dIKRhFjgRp+pDWQevKkAIv72WwRjcc4EIK/8U8ChrQ9ykdzOVnPlIx+
         p78QIwsckbEY30ifzsEuFsZbDWVjzfD1hqgWP1jtLjA8GkusPtRQ6gdt8HMJ+DbiwTJM
         2MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XFkg6LALiTZGl9NAXbdWzz4DpTKGtwoKK/kUM7aSbHk=;
        b=J2h2d/zrOO7jtxMUybOu29dNJsOwH3b/Gr6rSl+bKow60rS3zmwQiC8ce5Y6+XGmXM
         NKhOx/uBId/4Rv2bY4AKdiTccBjZUCj4lse/Z1+Pk1EZW6aObNpymJT/q83uvnLZCRZZ
         SNR9W7y8kM12vn6vY2r2pft4riKqDYh1pv4LlxRgSVIuM5tDXu3Nr/Qea56tieyVxi6J
         6KVYo5r/U+d8R3t3fDamGAs801jY9+tjaTw2HDVi2xTy5SSMTI9U09bfQD1dqlQbF0J/
         G8xsOQ3CfWZYiuLwOjOR+/P7Gp1Z92u4EPi861Vun6jCjkEZG9HAbzuVvRZLPwoymLoV
         JEzg==
X-Gm-Message-State: ANoB5pm1M0eR/MNfLucd+y7lgsaQm4aQ1gPFpmQJR9W81exICuErZSAV
	x4+G9UDNom5hkhxZ9c+m+iVdWzE2nX6IRA==
X-Google-Smtp-Source: AA0mqf5YSdD37zIdHOwaNDFnnyA8aeWZS/MRjbqAv9Ar3+pF4SJfF+ThVg5sQUFrfqscQmTMdUV2lA==
X-Received: by 2002:a05:6402:19a:b0:460:7413:5d46 with SMTP id r26-20020a056402019a00b0046074135d46mr64058882edv.47.1669981959517;
        Fri, 02 Dec 2022 03:52:39 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:52:39 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 3/8] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
Date: Fri,  2 Dec 2022 12:52:15 +0100
Message-Id: <20221202115223.39051-4-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035241_400539_7162A66B 
X-CRM114-Status: GOOD (  10.07  )
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

Based on power initialization sequence in downstream driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index dd5f2a13ceb5..f54acffc83f9 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -46,6 +46,9 @@
 #define HHI_NANOQ_MEM_PD_REG1		(0x47 << 2)
 #define HHI_VPU_MEM_PD_REG2		(0x4d << 2)
 
+#define G12A_HHI_NANOQ_MEM_PD_REG0	(0x43 << 2)
+#define G12A_HHI_NANOQ_MEM_PD_REG1	(0x44 << 2)
+
 struct meson_ee_pwrc;
 struct meson_ee_pwrc_domain;
 
@@ -106,6 +109,13 @@ static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
 static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
 static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
 
+static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
+	.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
+	.sleep_mask = BIT(16) | BIT(17),
+	.iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
+	.iso_mask = BIT(16) | BIT(17),
+};
+
 /* Memory PD Domains */
 
 #define VPU_MEMPD(__reg)					\
@@ -217,6 +227,11 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
 };
 
+static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
+	{ G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
+	{ G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
+};
+
 #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)	\
 	{								\
 		.name = __name,						\
@@ -253,6 +268,8 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_is_powered_off, 11, 2),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
+	[PWRC_G12A_NNA_ID] = TOP_PD("NNA", &g12a_pwrc_nna, g12a_pwrc_mem_nna,
+				    pwrc_ee_is_powered_off),
 };
 
 static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
