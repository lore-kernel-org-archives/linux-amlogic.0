Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54DC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 11:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0WBUi7HpHhu/WAU6FdyvPLQaURNu7F/mXRbh4ebaSw=; b=wO2LeWVgsnf1WG
	++d6uDnsvw0z0iEEjQj7qbC54mEA2wQggX7SCilC6yaecQDtogU0iikOdBwu/ozbSrAyvXKnCdrem
	rFiCK66kY3DSp7Hyujr+3EWYl5VPPMgLtE83HBcWC6SxEF5O/DE7l6bceP/zVs52KqfRQobj4xkNd
	JjDoG9wr9hPzBrrdK8BVc6Vrsz11LoGMx2T36DcIgQr1I8+VI9bKkhMQmgo/uPzcyXFBuTC42aKox
	gy4v6mX+u+O2KDrA7per6F65s27Q5UvaZtUMuXLHwQPFVKNOQkNWgvTJbQ6Of1rGqqloGdYcn7waR
	RARyk5PcqmZsla2XDmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWlN-00G28I-FD; Fri, 25 Nov 2022 11:20:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkD-00G1XN-Sz; Fri, 25 Nov 2022 11:19:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso3161052wms.4;
        Fri, 25 Nov 2022 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+Dm0WodzoCwPekd8CO1ZcYNi+jBHrS/Ym57B3kSSJQ=;
        b=Hn6VrYtyjsw/RxM7FIytyKmMTHcmSQdULy25PBy2jG77GEB6p9pcLoZls6GcB4iSPe
         bHxSw2D+ZnMEAfcAx7rdY3UwL07a57rknUPQ+WwKueTJ5svOG5cIse490VuInvRpKlMC
         tWgc4Hn8GjcCMiYgrVKFfyAtHTsw4qlpqaZrJCS6KJNpeoSG00b9/gtJx4Mrj30vKI65
         0ReOELdEpsnDPt10pUhk6uBkBLbwMGFcDZRhwsebCn7q94J+iAbfLFiwiqwEYC6wMrRO
         c19Vh4P/VV2/Fc3ZEOw275zHau96+AklK4IEjvDfGW8x/RitxjLhVdoNmm2b7F/ArIcZ
         Ajvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+Dm0WodzoCwPekd8CO1ZcYNi+jBHrS/Ym57B3kSSJQ=;
        b=AihtNE/xfWK/4qtprDFyBRHkSK7wZ8BcLlSWbuyNPwob9FCStbhhddpmLGDjhOud9D
         e5khCgBBJl825KWfeFkKC9rNDkISJq2TCxW+YWP+jNYqrRzRnOmdbIS7E8MAHrxrn+PA
         I9Gx6kElFuSnYUofzrZRFfw4sLQeTgXs5F2sgmvIrgPf5FiTxTQET1dlXn3Zf1xeP2jh
         Vp+5MZEbl1DZC8MgKnqbQtO3p6KtqEMI2e6oGp/VmxvH+gX2rWR4DS1vds+PYHsYQW1O
         /fuKCOi6BexhKtfu9+tiQOlM9EgBMAeDvEm+tIQ9ydC5FdwdubbMx0FbvLnbXiWXLHKx
         Wnog==
X-Gm-Message-State: ANoB5pmxv1vpNPZKdVxPRBEC2ns0bv/uIW+mS5gWUVksWPK1g9St9c0h
	BMSC3c4t8886lCeOYw48JjM=
X-Google-Smtp-Source: AA0mqf55R9KgI/Juvsgb/srUjW0m6KonIuK6lfizlFd8UR4T+C8S7WL+NJSarGHx2qIZYQSTcU9gqw==
X-Received: by 2002:a05:600c:3ac7:b0:3cf:75db:c417 with SMTP id d7-20020a05600c3ac700b003cf75dbc417mr18616319wms.109.1669375182380;
        Fri, 25 Nov 2022 03:19:42 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:19:41 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/6] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
Date: Fri, 25 Nov 2022 12:19:16 +0100
Message-Id: <20221125111921.37261-4-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031945_976857_6EB15FB3 
X-CRM114-Status: UNSURE (   9.70  )
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
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index dd5f2a13ceb5..925cfaf50d11 100644
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
+	{ G12A_HHI_NANOQ_MEM_PD_REG0, 0xffffffff },
+	{ G12A_HHI_NANOQ_MEM_PD_REG1, 0xffffffff },
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
