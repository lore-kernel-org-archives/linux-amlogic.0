Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37055C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02163208E4
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yb2dB0VZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b6jgKvug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02163208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x40kUjhEf8oxyRAruqZy8vouato6rJoVn4ecWMJNBc=; b=Yb2dB0VZMDjD/8
	Spw0h2gOHrVNsiU503eF/i3bS4oU1cwUrTSCrGqnp7g68VbtDx+NLaP2mLT8oNOqbaKO2pf9KCRwm
	xVVUqrfbiXjm3zqAp3PhoFQ4QUGVg3MN0mx/bhx+e9mocrdmRMNR/dAvy3RNu6t9c6GtU2V7ECCPf
	Ta4ywR3KYa9sV6jW69jz9vC+HpjIcW+cACXflTHrmP6114KyG4qGoSLfUIGbQ7GX8A4Q9Ed0zjcac
	INHDf2c5GiWCuq91VrS8i+uU6ts0mE252YoZyL2WDqMYQQOjN40qtTqkc7eGaSLCPbL8v+EvzsXZL
	6l19wLmMTH0Ol5q7iqfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtrd-0007ro-OT; Mon, 01 Jul 2019 10:48:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqL-0006aR-3K
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id s3so21261wms.2
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Owl4nTSq6DhZ2V584A99yDsOKLIIIUktJdAv0EVjP8I=;
 b=b6jgKvugCOJlbzkKecpVeAxHM4R651JUN9SFcYJFMhU8flW2qe2hf+uEDz0sQuelzM
 zr0DOGrSMO7P+19xgHrSExXjxPZwZ+Wi1YYtFE8PbzZRSEremFLug0RCjsJqVQmK6Z6r
 K4MhBJJvU8Jkvy//BNrFXv22CP8+cudLChxCn96ErMScTL4PjSpkxHrD/k0QiZBr6kGK
 lMYuga93UPYgZ8KdQJRveA6UOVUQC8PrGPAHH0AuopkolxDns4Ir+EKc2r0nLNgrnUot
 wcA5tVFj3Yofr6BmODaMLCnJrPEE4uqf39cT8cqDAbAmmrxFN5ImAvELoDbBxjXG80NI
 geNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Owl4nTSq6DhZ2V584A99yDsOKLIIIUktJdAv0EVjP8I=;
 b=oxPwAY/WO8jsph1cxoloals+iFr8C8RnoJfxl8dJ88zObCmzv7YdBnWxJgSqrc0ktY
 5d6erJhPMrXw98SfSjDZRF3hCTrsexuOsVkNmO2BNQQNWuxDdLtverN+fmyMDsALiVr6
 UnMTpQPWxh4qNTx3iVwf8KWj+zgqEyD9aU/TjOfT0KcaUhq4Vmgfy9IriIyiDEHTIOH/
 baqSGSrO2lUhow7Dcz4HHF5fu8pCWYnWpXO9i/BYW/gY4SzZIfUUJNoi2dLZ21CGh9ad
 0xkKzA3Rooj5v3tKoq38BkOyScMNMWwyI/9vLGhbtOY7wQINsRo7QqyQq7L1cM5XuLVl
 5N4Q==
X-Gm-Message-State: APjAAAXp3rEgQboEB9JQn0b/DkxyHA7Cpz2xsBEq7+UyZxlYxWIjhZoH
 GTVLKwvKrM0rOQIF77MtiT7BXw==
X-Google-Smtp-Source: APXvYqynQItuO15gLgigmTYWG4A+wwtTg+waNY6jf9w784dk5DTX+gMvdFcmQJmdNPcH2LhS730ptA==
X-Received: by 2002:a05:600c:2c7:: with SMTP id
 7mr16475575wmn.45.1561978047295; 
 Mon, 01 Jul 2019 03:47:27 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC 03/11] soc: amlogic: gx-pwrc-vpu: add SM1 support
Date: Mon,  1 Jul 2019 12:46:57 +0200
Message-Id: <20190701104705.18271-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034729_144809_9E59E400 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic SM1 SoCs VPU Power Domain control,
it uses a different register for Isolation and a supplementaty
register for the domain memories power control.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 120 ++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 511b6856225d..fabb2868d09b 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -18,6 +18,7 @@
 /* AO Offsets */
 
 #define AO_RTI_GEN_PWR_SLEEP0		(0x3a << 2)
+#define AO_RTI_GEN_PWR_ISO0		(0x3b << 2)
 
 #define GEN_PWR_VPU_HDMI		BIT(8)
 #define GEN_PWR_VPU_HDMI_ISO		BIT(9)
@@ -28,6 +29,8 @@
 #define HHI_VPU_MEM_PD_REG0		(0x41 << 2)
 #define HHI_VPU_MEM_PD_REG1		(0x42 << 2)
 #define HHI_VPU_MEM_PD_REG2		(0x4d << 2)
+#define HHI_VPU_MEM_PD_REG3		(0x43 << 2)
+#define HHI_VPU_MEM_PD_REG4		(0x44 << 2)
 
 struct meson_gx_pwrc_vpu {
 	struct generic_pm_domain genpd;
@@ -125,6 +128,53 @@ static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static int meson_sm1_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
+{
+	struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
+	int i;
+
+	regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_ISO0,
+			   GEN_PWR_VPU_HDMI, GEN_PWR_VPU_HDMI);
+	udelay(20);
+
+	/* Power Down Memories */
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
+				   0x3 << i, 0x3 << i);
+		udelay(5);
+	}
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
+				   0x3 << i, 0x3 << i);
+		udelay(5);
+	}
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG2,
+				   0x3 << i, 0x3 << i);
+		udelay(5);
+	}
+	regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG4,
+				   0x3 << 4, 0x3 << 4);
+	regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG4,
+				   0x7, 0x7);
+	for (i = 8; i < 16; i++) {
+		regmap_update_bits(pd->regmap_hhi, HHI_MEM_PD_REG0,
+				   BIT(i), BIT(i));
+		udelay(5);
+	}
+	udelay(20);
+
+	regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI, GEN_PWR_VPU_HDMI);
+
+	msleep(20);
+
+	clk_disable_unprepare(pd->vpu_clk);
+	clk_disable_unprepare(pd->vapb_clk);
+
+	return 0;
+}
+
 static int meson_gx_pwrc_vpu_setup_clk(struct meson_gx_pwrc_vpu *pd)
 {
 	int ret;
@@ -242,6 +292,64 @@ static int meson_g12a_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static int meson_sm1_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
+{
+	struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
+	int ret;
+	int i;
+
+	regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI, 0);
+	udelay(20);
+
+	/* Power Up Memories */
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
+				   0x3 << i, 0);
+		udelay(5);
+	}
+
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
+				   0x3 << i, 0);
+		udelay(5);
+	}
+
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG2,
+				   0x3 << i, 0);
+		udelay(5);
+	}
+
+	regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG4, 0x3 << 4, 0);
+
+	regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG4, 0x7, 0);
+
+	for (i = 8; i < 16; i++) {
+		regmap_update_bits(pd->regmap_hhi, HHI_MEM_PD_REG0,
+				   BIT(i), 0);
+		udelay(5);
+	}
+	udelay(20);
+
+	ret = reset_control_assert(pd->rstc);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_ISO0,
+			   GEN_PWR_VPU_HDMI, 0);
+
+	ret = reset_control_deassert(pd->rstc);
+	if (ret)
+		return ret;
+
+	ret = meson_gx_pwrc_vpu_setup_clk(pd);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static bool meson_gx_pwrc_vpu_get_power(struct meson_gx_pwrc_vpu *pd)
 {
 	u32 reg;
@@ -267,6 +375,14 @@ static struct meson_gx_pwrc_vpu vpu_hdmi_pd_g12a = {
 	},
 };
 
+static struct meson_gx_pwrc_vpu vpu_hdmi_pd_sm1 = {
+	.genpd = {
+		.name = "vpu_hdmi",
+		.power_off = meson_sm1_pwrc_vpu_power_off,
+		.power_on = meson_sm1_pwrc_vpu_power_on,
+	},
+};
+
 static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 {
 	const struct meson_gx_pwrc_vpu *vpu_pd_match;
@@ -362,6 +478,10 @@ static const struct of_device_id meson_gx_pwrc_vpu_match_table[] = {
 	  .compatible = "amlogic,meson-g12a-pwrc-vpu",
 	  .data = &vpu_hdmi_pd_g12a
 	},
+	{
+	  .compatible = "amlogic,meson-sm1-pwrc-vpu",
+	  .data = &vpu_hdmi_pd_sm1
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
