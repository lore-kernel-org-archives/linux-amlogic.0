Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7713C43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iCtPgIGwbz45YSsTw5QPUFuvyvTXOCZkrwj3iBFQLc=; b=m1baTT7WAuMK1G
	cgV6U+DTpmt5Z6YZYYuFl3qgO+EVmIkAWngWTVxqbO4DtUjtZERinLuTvuWtcFXGmLwcAudf5aS1k
	WTNvmtRvttiCOjYQlEKeRSm3Q/ycVHx8Oq2iWfYO4D7USLsRR1OLGtwDkp6+87uGo3Cvx2HLq6G4d
	1BRg3wiXPDbTbqjcJ1HVuuQuukyzRoYI4ZQ2YNHoP6QzPvpu9QYWML06DXqaYcTkpKtMBF1oPhG43
	TZ+HELlrRdrMKhhoLyL6VIrfHch5y20CbBUSmGZjFbZJ+wf+3R9+tJpzdW13vjP7sa5352Yz+ZQHD
	dZBmKnIMbUfjp0PTd0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fmR-006JBM-Us; Thu, 01 Dec 2022 09:22:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0flc-006Ii2-L5; Thu, 01 Dec 2022 09:22:06 +0000
Received: by mail-ej1-x630.google.com with SMTP id td2so2726034ejc.5;
        Thu, 01 Dec 2022 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw/am3froU3IMTWG9BB3ZSyfplgImMW6lCXqrhZP2N0=;
        b=VtKXP9AfoQpyEZYYV8RQoSBNAXIYAvwbKi6Yg6Coz0B22h0nwf6cOnNjAiCNC6+8J1
         7NolDrEwXwXRx4yAaXXvqvu4wIgZsTZ6gLLbOMAqjbY94rN0zdjIWXsYwnONwGW/NsC/
         w2BiyAJVq4d0sjwWQtorKHctehY7vfauDgXs2hBNxAUV8PVaRnzRlqVrq6EGnTfq/vot
         z8opNiGX6/1bWF+R5skTgx9u1kpkMP54cALtMfMmZFlCymXrysGAOIRICToMQONZs/4l
         x3ufy1N7+UUN9Y4RraBMyMX+QvO6MiINR/ScMSbAh+mq210eN2ipnUpL/d0hsGL7jsGR
         QzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cw/am3froU3IMTWG9BB3ZSyfplgImMW6lCXqrhZP2N0=;
        b=YmgEt/nFAgFRxmpaWqjkmlbEfdjnjEsdVkUtF5FQSoMl5tuzqdOr4wM6sS48u2aKKm
         AlSqBCoppmjTb/RACXKVzJBRUw2tgynBM4YV7dcJ1IrmAlzdy688nZUVOXai6ziKWFYV
         9zW73C2PGKMzMe0uzpCWMp+azURJkq1f1gNwfqfsJSwsUuLq4bnHI+8xTp7VJYr35GKq
         Vd3f8rFOnlS/7cB2DjcX9F4TOFayMKL6z7whuNce+3GfKn81CitvHBX+I+lwg6bU61Lc
         a6yZdWEOflQ4AqVbQbTPMw6rGKZWcuT36/XJN/1o1NcAjVXR2Ko3IRaMqh06t/BTDcxS
         FMtw==
X-Gm-Message-State: ANoB5pn8CQgGKHmF0GnH5mhMm9FrbAD8HkWpCC+8rhp+hJP4w2ZpsaNH
	VXEHOIW+F87DymVqZaz0V6M=
X-Google-Smtp-Source: AA0mqf6j94e36tZw8yrtZZ4lcltmqWjX7I3vRd3gaN2OAM5MqJ9bj+WCkFF+5F9Iy3UWrMLt1UWLkg==
X-Received: by 2002:a17:906:a387:b0:7bc:2ad:7c1e with SMTP id k7-20020a170906a38700b007bc02ad7c1emr28734923ejz.588.1669886523183;
        Thu, 01 Dec 2022 01:22:03 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:22:02 -0800 (PST)
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
Subject: [PATCH v4 3/7] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
Date: Thu,  1 Dec 2022 10:21:24 +0100
Message-Id: <20221201092131.62867-4-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
References: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_012204_719445_EDE5EBDE 
X-CRM114-Status: UNSURE (   9.90  )
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
