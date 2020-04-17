Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C20C2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BD020780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XLuX7Bvl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="la2mLgGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62BD020780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0j0D7sauT+eAGJQNmcOcuIZ37L6J56kdchbIkvIUfg=; b=XLuX7Bvl8W+dVU
	nqv1/R70enV48lXPIaqXn2TaBd5MVqAi3zo4F9H95UaDHK9oBPwgeX8A4Y22ixukl2FofviRxHxKF
	IG6f/A1vLzAEjGGpRtuzNhrWn1nHpMbQW2dlqzxFdSqAorlonWUbnRLiGWDPNaDJSELoWLgW3Au/5
	AIHCLLA0xvu+ZAiowfCXwwxIkN5pv35f7PHwYBz/x9N7NgL9P/S3bUpn2cjfnW20an+GwP5pKxDdK
	xRD4j4wIqGXnbkMXFmoO6/pxVgbh2snsX28NUH7RSyeCST3ySlOAWV/mgZuRL7CvrZ1cyJ5Mgj7kU
	zeWk+eMjDwxHp0gjGIiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPWMa-0002ez-4w; Fri, 17 Apr 2020 19:09:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPWM1-00025Y-RM; Fri, 17 Apr 2020 19:08:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id d17so4251471wrg.11;
 Fri, 17 Apr 2020 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSI3Jk2pdt1qXkGfoD18aihrdmY02gauY+JtpjGwyDs=;
 b=la2mLgGLpJ8qxjy95X3+75SpjBR1yMi9XxMPk75IXxglNUc4NBEOhJinZPVeaRQOiD
 fUPhvso8yxqEwqZ6vObzYdnwlPe63ckCRIU7N4F5H1zsB3Ns135yfGNCSgTlE11G/kct
 xdlcMzSZtIO4VifRYIblmz5/LkhlK4cROSqNTMrn2qsm8ZtcjdJ1y42bgT2L/dqD20ii
 oVcCauugUAkH5vkC1FawTbsoi+ta8JsH7SzXA3u9SnCgUHYuVesScQlP73c1Xm/T8Ss2
 AUJwQKtEa2GB0TYWwd5v+rdMV2BkV1OvdDCY/A7a1eVrQfUdtAXUKmvrCIYrm66ZKK4z
 7kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSI3Jk2pdt1qXkGfoD18aihrdmY02gauY+JtpjGwyDs=;
 b=nK78wLRBgrZjP9Ytwqn2vf6Au0O+UwhyIZfi/u5ColICkuTfzpx9N99a+/EXln7NsK
 6Yxw+gNViA5fcdmPGjYMpRkTaBAOq2acCAWV4F6Tk3S/3C/Kw/9UMWf+Ns7iMAJEFMWa
 KnrUkeBUaU9bC3jI4hqMKYQkNu5TI/SFzNYS4ft612Q9vAXv4fbNajgsAIvAD7kN1xip
 HkeVlMBQLffdB5G6F6sirAWiila5IoqYG0SUx++UZURkbt9R2kGpxS0gbkWWpq0nP7iw
 lr594MmhGIA8xw4DRAEPWVU4j5gUAeSvEeVHQfbvL/ClD3hLKczOo/5p7UVjqO/jGWya
 +V+Q==
X-Gm-Message-State: AGi0PuZ6mFLryflXe5gKWiBnhOUu3DZ0eeNDdGZ0kjNncjnS741LURHX
 XyDRMVliB54q8crN08vndfnqJhOv8DA=
X-Google-Smtp-Source: APiQypJ6Btsq4MlRda9I/g/tQ5dwT9eFZVWGmVrnlC8lxijrprfFMX8yvGngCxTLQBPfZfl8Pd/m1g==
X-Received: by 2002:adf:ef01:: with SMTP id e1mr5829196wro.182.1587150524474; 
 Fri, 17 Apr 2020 12:08:44 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q17sm8722220wmj.45.2020.04.17.12.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 12:08:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] soc: amlogic: meson-ee-pwrc: add support for
 Meson8/Meson8b/Meson8m2
Date: Fri, 17 Apr 2020 21:08:24 +0200
Message-Id: <20200417190825.1363345-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417190825.1363345-1-martin.blumenstingl@googlemail.com>
References: <20200417190825.1363345-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_120845_881167_FDA85BEF 
X-CRM114-Status: GOOD (  15.57  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
