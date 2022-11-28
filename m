Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090DCC4167D
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iCtPgIGwbz45YSsTw5QPUFuvyvTXOCZkrwj3iBFQLc=; b=tHlCPDl1gKtPEp
	EUDjACuvVxQ7OnNlAbCbkii4qf9uu6Uym4D4dN+m0gJnR4wDOxxmRg7iORolLUEzntIKOUDGlaSiI
	cLe1Pp4KbOvM9YiYbaPVMFIizkdAANvo1+Zx+GVW9SZwjUt6lvf3B8o/2Nv6ukrU7ZuwzO2xG75E4
	4wXObz9YThp6x37XHdKfBttUL0ku8g3IYr/iTZ2nKYoo7G6vF1wmMCESsdjur//0yk2c53D+zKqrm
	WiJQD85wqtXyYq4kf03cc8nFtPUdhkzP/wBf4h2GeAQ5SfUVZlZ5YbiWQhViCTyZGOvV5eXcnJQod
	OoLcfRoEbgAb/uI96pCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9u-001EGY-Up; Mon, 28 Nov 2022 11:18:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9D-001DsY-Ba; Mon, 28 Nov 2022 11:18:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id b12so16259600wrn.2;
        Mon, 28 Nov 2022 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw/am3froU3IMTWG9BB3ZSyfplgImMW6lCXqrhZP2N0=;
        b=e8gELn8IgLw4c7pgk25h5/TtTBA2qpEO4v7J4nDEkbxG4f4qJQCppwKHsdxv7jQxTT
         oYRhB8ieddTEJdMy5kKerOReXDZew/TVw+cxZM0t09EACpwHJWwYcP/cYk/N5G5qgzQr
         wXqyYIIE5Ty0i9N8Ia3p9e2uTXykzwb4psd257FT8ky2k3h4TN7FvioOs/TxN3LMBpC0
         uMYzTl7Ob02h/SFQJxMpeoXfKP+qFJgn+lzJnWzaAtEzoHAC4Xq+1bYU5FJnZ7KniQyV
         YAZKK1/vizqL4so3adpeGhBRLbMuMvyUuzSf1Z2sNX8/Q9uA+WfJB6LYH+DsKM/Scfx4
         NjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cw/am3froU3IMTWG9BB3ZSyfplgImMW6lCXqrhZP2N0=;
        b=oDI6RhNPr8CSo42XSa1TxaFdMhMdN7ioR3rLBPYsfQt3UpLIONyPRhsAatPhTAyD0k
         S5YjuF8BEsUNItT7qHF4ubsR5eI1XVklnUeuJMDYsjUETlqHWl5Z0l+gxtEpFfMWDCs/
         N2RimINwxyIh+wtNohlvZxgicswO0KwisPdTfQjikX0kzYA59DAkhZaa95DVjseCAfAp
         v+Epd5+K6ZUzv3YYc3EM/wIIH7uIwP/zcAuI764u2DZ+tgNGMPxwNWzw3thkywfgL5uw
         be2F2tLKoPReVIYJuXfack8LSXnOgNTebDQephFZ+7gI2TmBhCDiC+3qpM/Yl+gw6qP9
         yk/w==
X-Gm-Message-State: ANoB5plpD0y27uYGUfWLUBbJD8BJY1I3QXVoQqCWlZ0KdWCoUN0xL0T9
	N4X3HFKM5r6oeWdDeF4/+x8=
X-Google-Smtp-Source: AA0mqf7FlFtIDKPTjGZuk8Oe01rtn29LvDSRj8mFz6LD40ZubOZeqIPs8zVhbu1uqPDi5exDxM72gg==
X-Received: by 2002:a05:6000:883:b0:22c:d6c7:562 with SMTP id ca3-20020a056000088300b0022cd6c70562mr21365842wrb.8.1669634282187;
        Mon, 28 Nov 2022 03:18:02 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 03:18:01 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/5] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
Date: Mon, 28 Nov 2022 12:17:36 +0100
Message-Id: <20221128111740.39003-4-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_031803_421729_DB46F2DA 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index dd5f2a13ceb5..dfbf0b1c7d29 100644
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
 
+static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {	\
+		.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0, 		\
+		.sleep_mask = BIT(16) | BIT(17),		\
+		.iso_reg = GX_AO_RTI_GEN_PWR_ISO0, 		\
+		.iso_mask = BIT(16) | BIT(17), 			\
+	};
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
