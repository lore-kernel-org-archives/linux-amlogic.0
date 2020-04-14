Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339D3C2BB1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3111206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JYMJ++oL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rCQmxswG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3111206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7ozhGSH6Dv60CzU+DCtTiCHzLlLBmO0puShO+TrmBI=; b=JYMJ++oLaHkL+3
	0pkvCvE41hvhEepJiQVEmmmk/BWFNFNBj/R06aMVvaMlUb4G/oeFXMA8p99HoAY+rABR6ickZ4/ft
	k9PQNJTEREJTTBQ8SBBd9NdBoPQJMDeRzinpbkxfox1czBuNcsJ6XdCRgv9dyfMJ/I3TcyOnM1LlI
	+LyUyYCr0pjcAbk3izZ+oQPZjd9OQWDSVoPfYULGxNxotlBLWQ4s7JkPV+zqjl5aZfufWoGPaVR9u
	vRlU91e16k80tLWdPKKD3VLWIcBAGxfZfG40d8ZGTZKM/k0vYK7TBUDt7jP6IM96OFApul5Fholk/
	9HNAZyzw6/y6sLOhQhnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORyr-0001KT-0M; Tue, 14 Apr 2020 20:16:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORxz-0008Pu-UN; Tue, 14 Apr 2020 20:15:33 +0000
Received: by mail-wm1-x342.google.com with SMTP id r26so15833630wmh.0;
 Tue, 14 Apr 2020 13:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4l4dlajAQ5hYjHdHbwaVhCtPIXq0hp8eJOoIEyPOB8=;
 b=rCQmxswG1BGOEARKUCexdg+aGeADAIKgZIwZjwJkLZrGhmCovgrO+m71XsKtHMwhcW
 jGTKcfBk9GxSTf79LGD7XxCdD5zurhHtPqMMh/UsTeeVYX6rQhPqDtQUYsOTVD//mTkX
 lGIShvLgthU6cz53Kri6oAh8W9SlVpcgLklPEsH3AYFn/Btx+9dTE15PxwlrvewOrz+q
 loCkkfriYZGolidfxl9eeapc2PeCYoH+abWdGDRnOEp2GCeRGV4yn2hMs9HIto0rdEs+
 4sQZCjCtWNIzeW9R1/A/yFXsIUCfw1kLW9k1S2ibSQfEj1ClNMg8q4Tkf78ePOEmiMzu
 ZGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4l4dlajAQ5hYjHdHbwaVhCtPIXq0hp8eJOoIEyPOB8=;
 b=jqCm86lV8gN80wGQGezvBUkPaqyeDv9Vg/4Ij/O1BMhwCN/Zqf8f2SeResVBtnrHvm
 hYm+ZTxYYkksHptMfpYC3P1yL69Z2XdxyfLTwJ64/nW8e+b9it8KKFgGtHcpen9oDtJG
 K7HdnEs64NW44e+U+0nQJCxXUTI+UjKMZUaN9cg14bPMotrqsECK0Ezvz8ADyeFvEwXa
 yRttW2T0T1T6ja3azu1MiPV92mPZCwpxItrKVGMNvCMVpfcbi/FcqHUHZZ0+gsVSs+pq
 Tv3YBvUL2Z/PHRyr/QLegkO16ahOk4l/eB0gdKk+X/VYgU1qLBTEm0HJ2IXmLQdBK/8N
 hP7A==
X-Gm-Message-State: AGi0Pub/TEeb29DZxJsc+wM/4dRkLLX7BfJpO4WWIv9ezFn3Id0drBT1
 GDfKqlJv6XdECwL6evM3kAS6Wm4puwE=
X-Google-Smtp-Source: APiQypJn7651jK1wPIoK97bfaAlMxVEJAxTqdFKuTBux1LLYd0Wh6Oa1R9Ue81ARL/IBgupmXdzqDQ==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr1531218wma.150.1586895330456; 
 Tue, 14 Apr 2020 13:15:30 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id u17sm22537467wra.63.2020.04.14.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:15:30 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v1 3/4] soc: amlogic: meson-ee-pwrc: add support for
 Meson8/Meson8b/Meson8m2
Date: Tue, 14 Apr 2020 22:14:56 +0200
Message-Id: <20200414201457.229131-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
References: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_131531_986653_E3065911 
X-CRM114-Status: GOOD (  15.00  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the power domains on Meson8/Meson8b/Meson8m2.
Meson8 doesn't use any reset lines while Meson8b and Meson8m2 use the
same set of reset lines (which is different from the newer SoCs).
Add dedicated compatible strings for Meson8, Meson8b and Meson8m2 to
support these differences.

Notable differences between Meson8 and G12A are:
- there is no HHI_VPU_MEM_PD_REG2 on the 32-bit SoCs
- the Meson8b datasheet describes an "audio DSP memory" power domain
  which is used for the hardware audio decoder
- the "amlogic,ao-sysctrl" only includes the power management related
  registers on the 32-bit SoCs, meaning the for example the
  AO_RTI_GEN_PWR_SLEEP0 register is at offset (0x2 << 2) rather than
  (0x3a << 2). As result of this (0x38 << 2) is subtracted from the
  register offsets, which is the start of the power management related
  registers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 72 +++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 3f0261d53ad9..b30868da456a 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -14,6 +14,7 @@
 #include <linux/reset-controller.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
+#include <dt-bindings/power/meson8-power.h>
 #include <dt-bindings/power/meson-g12a-power.h>
 #include <dt-bindings/power/meson-sm1-power.h>
 
@@ -22,6 +23,12 @@
 #define AO_RTI_GEN_PWR_SLEEP0		(0x3a << 2)
 #define AO_RTI_GEN_PWR_ISO0		(0x3b << 2)
 
+/*
+ * Meson8/Meson8b/Meson8m2 only expose the power management registers of
+ * the AO-bus as syscon. Above register offsets need to subtract this offset.
+ */
+#define AO_RTI_GEN_MESON8_PMU_OFFSET	(0x38 << 2)
+
 /* HHI Offsets */
 
 #define HHI_MEM_PD_REG0			(0x40 << 2)
@@ -73,6 +80,13 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_vpu = {
 	.iso_mask = BIT(9),
 };
 
+static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
+	.sleep_reg = AO_RTI_GEN_PWR_SLEEP0 - AO_RTI_GEN_MESON8_PMU_OFFSET,
+	.sleep_mask = BIT(8),
+	.iso_reg = AO_RTI_GEN_PWR_SLEEP0 - AO_RTI_GEN_MESON8_PMU_OFFSET,
+	.iso_mask = BIT(9),
+};
+
 #define SM1_EE_PD(__bit)					\
 	{							\
 		.sleep_reg = AO_RTI_GEN_PWR_SLEEP0, 		\
@@ -124,10 +138,20 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
-static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_eth[] = {
+static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_eth[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(3, 2) },
 };
 
+static struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
+	{ HHI_MEM_PD_REG0, GENMASK(1, 0) },
+};
+
+static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
+	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
+	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
+	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
+};
+
 static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
@@ -201,7 +225,27 @@ static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain);
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &g12a_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 11, 2),
-	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", g12a_pwrc_mem_eth),
+	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson8_pwrc_mem_eth),
+};
+
+static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
+	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
+				       meson8_pwrc_mem_vpu, pwrc_ee_get_power,
+				       0, 1),
+	[PWRC_MESON8_ETHERNET_MEM_ID] = MEM_PD("ETHERNET_MEM",
+						  meson8_pwrc_mem_eth),
+	[PWRC_MESON8_AUDIO_DSP_MEM_ID] = MEM_PD("AUDIO_DSP_MEM",
+						meson8_pwrc_audio_dsp_mem),
+};
+
+static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
+	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
+				       meson8_pwrc_mem_vpu, pwrc_ee_get_power,
+				       11, 1),
+	[PWRC_MESON8_ETHERNET_MEM_ID] = MEM_PD("ETHERNET_MEM",
+						  meson8_pwrc_mem_eth),
+	[PWRC_MESON8_AUDIO_DSP_MEM_ID] = MEM_PD("AUDIO_DSP_MEM",
+						meson8_pwrc_audio_dsp_mem),
 };
 
 static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
@@ -216,7 +260,7 @@ static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
 	[PWRC_SM1_GE2D_ID] = TOP_PD("GE2D", &sm1_pwrc_ge2d, sm1_pwrc_mem_ge2d,
 				    pwrc_ee_get_power),
 	[PWRC_SM1_AUDIO_ID] = MEM_PD("AUDIO", sm1_pwrc_mem_audio),
-	[PWRC_SM1_ETH_ID] = MEM_PD("ETH", g12a_pwrc_mem_eth),
+	[PWRC_SM1_ETH_ID] = MEM_PD("ETH", meson8_pwrc_mem_eth),
 };
 
 struct meson_ee_pwrc_domain {
@@ -470,12 +514,34 @@ static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
 	.domains = g12a_pwrc_domains,
 };
 
+static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
+	.count = ARRAY_SIZE(meson8_pwrc_domains),
+	.domains = meson8_pwrc_domains,
+};
+
+static struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
+	.count = ARRAY_SIZE(meson8b_pwrc_domains),
+	.domains = meson8b_pwrc_domains,
+};
+
 static struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
 	.count = ARRAY_SIZE(sm1_pwrc_domains),
 	.domains = sm1_pwrc_domains,
 };
 
 static const struct of_device_id meson_ee_pwrc_match_table[] = {
+	{
+		.compatible = "amlogic,meson8-pwrc",
+		.data = &meson_ee_m8_pwrc_data,
+	},
+	{
+		.compatible = "amlogic,meson8b-pwrc",
+		.data = &meson_ee_m8b_pwrc_data,
+	},
+	{
+		.compatible = "amlogic,meson8m2-pwrc",
+		.data = &meson_ee_m8b_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-pwrc",
 		.data = &meson_ee_g12a_pwrc_data,
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
