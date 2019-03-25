Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA96C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF7E2085A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0EQmnuC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z/rZk5qJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF7E2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k7GQ24M07iNVN0aEBjpKJL2xaDFSVmUhJoK0J6sRcAk=; b=T0EQmnuCoIzJKB
	Ubh9RAst0UD4chROZKrDWxoZRBvlIIwtTnw7hFO5WQlacVmACvc+iU14xUH4N14q2VEgWo5AZ/khN
	5YcIYM+NS8j3VgD8yPAeTFAKDMAPOjt8HkXwdBaqzGEyZnl5hLuRui6LXejX5SDprNsdrwTxQLBo2
	7fhHIFu+4T9u+IhdCdRxK96Mq1BLigt4Pd6ZCAyDflakNrvYwSHL2yuzaUJzwvszw/CMIcSSMcle8
	tf7mtcYkj5RhHcCvUsMB0LdJybB0kKnog0n+fpM878DoT1OOVnAgUE9OCAAJ5xUmmnqUMZXkTPLSZ
	em+t53aLCfdjhNeiyKag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8R0u-0005FA-H5; Mon, 25 Mar 2019 14:55:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8R0p-0005DG-0j
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:55:46 +0000
Received: by mail-wm1-x342.google.com with SMTP id z11so9340429wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rbt94YTH655ILjC6giLP1+x1iu+quWQun/TDgqjaOYo=;
 b=Z/rZk5qJHNd7+AG4/gHvr1zcV0YjBqpqoDHb+Oh22rDq3C+fOGpYR7lEvFT7v/yXpk
 BjYUe94EIDHln8oJBBwcIdpuelNmoruj7EbA9NFJM1iMyCst3m0qgDb1Pc6gbTq1scC0
 K6xwbqnudOVV82FLWndLmTtWb5omIfcALyNbmcvkQHRUqTqOxusTSDSyWI2SvvNKEY0U
 FAlcQfmwGuBHCarKOQLFD9/yNl4Gf946XDLFMsB0LbSlJNqzREL+ZK0KRACm9WRMBTDM
 JT/ETWaeb7NuIQRH+rmD6XrElgpZuJaVESvL01ZndEhYJGGHcHR9xiDO6cqviXZ/1whs
 RcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rbt94YTH655ILjC6giLP1+x1iu+quWQun/TDgqjaOYo=;
 b=dofJ/acAmz7DkOC6pHObWBOgYmf79HfCaaN0CwNY7tKf6pJ8XJ2bHAJTmm/ed07n0A
 0I/2J4NNlDGCU/ykDe1EbUWIU+4IcoohpjqjKBGPIZorh4C6H0hr9J7sA/1gnunvE61s
 6I8VIHum8f9ZB8kFThu/PehJShAkJTbQE3rRUwfJvgiiTp8Dk1f+gWKgqqmgjVBzu9nF
 t5m0XiLsszs9KZg6IboGKRmLBQttdiE1cup2cwJkHBBG2kAqJkHS48/6Bnhb0L5VXCIe
 FOOqZr0hTK93JU0KBanKvua6uktCHX1aiOSNvrFlJ9uUwpqxb2qgJuRtYUsO20EmpPcD
 MFUw==
X-Gm-Message-State: APjAAAXhav9vorkOKbLaPHGH7U0jGJeuGtW4Ep9YmcUnUnignYmgbgyD
 l7GDXSehNcPF+MyUeXfNVHtyhQ==
X-Google-Smtp-Source: APXvYqzFqAqhW4SmnTcoBoNm16TnvRa993kAu6Ph2iwYzjjhndn+8GQOnUxCedCdBSzoIcNW7rYfaA==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr5895680wmi.67.1553525739672;
 Mon, 25 Mar 2019 07:55:39 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id f9sm17731778wmb.36.2019.03.25.07.55.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:55:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] soc: amlogic: meson-gx-pwrc-vpu: Add support for G12A
Date: Mon, 25 Mar 2019 15:55:37 +0100
Message-Id: <20190325145537.31697-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_075543_062017_95631EB8 
X-CRM114-Status: GOOD (  16.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoC has a very similar VPU Power Controller setup
than the older GXBB, GXL & GXm SoCs.

This patch adds the variant support for G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 160 +++++++++++++++++++++---
 1 file changed, 144 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 6289965c42e9..511b6856225d 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -11,6 +11,7 @@
 #include <linux/bitfield.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
 
@@ -26,6 +27,7 @@
 #define HHI_MEM_PD_REG0			(0x40 << 2)
 #define HHI_VPU_MEM_PD_REG0		(0x41 << 2)
 #define HHI_VPU_MEM_PD_REG1		(0x42 << 2)
+#define HHI_VPU_MEM_PD_REG2		(0x4d << 2)
 
 struct meson_gx_pwrc_vpu {
 	struct generic_pm_domain genpd;
@@ -54,12 +56,55 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
 	/* Power Down Memories */
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
-				   0x2 << i, 0x3 << i);
+				   0x3 << i, 0x3 << i);
 		udelay(5);
 	}
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
-				   0x2 << i, 0x3 << i);
+				   0x3 << i, 0x3 << i);
+		udelay(5);
+	}
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
+static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
+{
+	struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
+	int i;
+
+	regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI_ISO, GEN_PWR_VPU_HDMI_ISO);
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
 		udelay(5);
 	}
 	for (i = 8; i < 16; i++) {
@@ -108,13 +153,67 @@ static int meson_gx_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
 	/* Power Up Memories */
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
-				   0x2 << i, 0);
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
+	regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI_ISO, 0);
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
+static int meson_g12a_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
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
 		udelay(5);
 	}
 
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
-				   0x2 << i, 0);
+				   0x3 << i, 0);
+		udelay(5);
+	}
+
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG2,
+				   0x3 << i, 0);
 		udelay(5);
 	}
 
@@ -160,15 +259,37 @@ static struct meson_gx_pwrc_vpu vpu_hdmi_pd = {
 	},
 };
 
+static struct meson_gx_pwrc_vpu vpu_hdmi_pd_g12a = {
+	.genpd = {
+		.name = "vpu_hdmi",
+		.power_off = meson_g12a_pwrc_vpu_power_off,
+		.power_on = meson_g12a_pwrc_vpu_power_on,
+	},
+};
+
 static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 {
+	const struct meson_gx_pwrc_vpu *vpu_pd_match;
 	struct regmap *regmap_ao, *regmap_hhi;
+	struct meson_gx_pwrc_vpu *vpu_pd;
 	struct reset_control *rstc;
 	struct clk *vpu_clk;
 	struct clk *vapb_clk;
 	bool powered_off;
 	int ret;
 
+	vpu_pd_match = of_device_get_match_data(&pdev->dev);
+	if (!vpu_pd_match) {
+		dev_err(&pdev->dev, "failed to get match data\n");
+		return -ENODEV;
+	}
+
+	vpu_pd = devm_kzalloc(&pdev->dev, sizeof(*vpu_pd), GFP_KERNEL);
+	if (!vpu_pd)
+		return -ENOMEM;
+
+	memcpy(vpu_pd, vpu_pd_match, sizeof(*vpu_pd));
+
 	regmap_ao = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
 	if (IS_ERR(regmap_ao)) {
 		dev_err(&pdev->dev, "failed to get regmap\n");
@@ -201,39 +322,46 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 		return PTR_ERR(vapb_clk);
 	}
 
-	vpu_hdmi_pd.regmap_ao = regmap_ao;
-	vpu_hdmi_pd.regmap_hhi = regmap_hhi;
-	vpu_hdmi_pd.rstc = rstc;
-	vpu_hdmi_pd.vpu_clk = vpu_clk;
-	vpu_hdmi_pd.vapb_clk = vapb_clk;
+	vpu_pd->regmap_ao = regmap_ao;
+	vpu_pd->regmap_hhi = regmap_hhi;
+	vpu_pd->rstc = rstc;
+	vpu_pd->vpu_clk = vpu_clk;
+	vpu_pd->vapb_clk = vapb_clk;
+
+	platform_set_drvdata(pdev, vpu_pd);
 
-	powered_off = meson_gx_pwrc_vpu_get_power(&vpu_hdmi_pd);
+	powered_off = meson_gx_pwrc_vpu_get_power(vpu_pd);
 
 	/* If already powered, sync the clock states */
 	if (!powered_off) {
-		ret = meson_gx_pwrc_vpu_setup_clk(&vpu_hdmi_pd);
+		ret = meson_gx_pwrc_vpu_setup_clk(vpu_pd);
 		if (ret)
 			return ret;
 	}
 
-	pm_genpd_init(&vpu_hdmi_pd.genpd, &pm_domain_always_on_gov,
+	pm_genpd_init(&vpu_pd->genpd, &pm_domain_always_on_gov,
 		      powered_off);
 
 	return of_genpd_add_provider_simple(pdev->dev.of_node,
-					    &vpu_hdmi_pd.genpd);
+					    &vpu_pd->genpd);
 }
 
 static void meson_gx_pwrc_vpu_shutdown(struct platform_device *pdev)
 {
+	struct meson_gx_pwrc_vpu *vpu_pd = platform_get_drvdata(pdev);
 	bool powered_off;
 
-	powered_off = meson_gx_pwrc_vpu_get_power(&vpu_hdmi_pd);
+	powered_off = meson_gx_pwrc_vpu_get_power(vpu_pd);
 	if (!powered_off)
-		meson_gx_pwrc_vpu_power_off(&vpu_hdmi_pd.genpd);
+		vpu_pd->genpd.power_off(&vpu_pd->genpd);
 }
 
 static const struct of_device_id meson_gx_pwrc_vpu_match_table[] = {
-	{ .compatible = "amlogic,meson-gx-pwrc-vpu" },
+	{ .compatible = "amlogic,meson-gx-pwrc-vpu", .data = &vpu_hdmi_pd },
+	{
+	  .compatible = "amlogic,meson-g12a-pwrc-vpu",
+	  .data = &vpu_hdmi_pd_g12a
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
